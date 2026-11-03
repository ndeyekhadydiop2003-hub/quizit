import 'dart:async';
import 'package:flutter/material.dart';
import '../models/quiz_category.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  final QuizCategory category;
  const QuizScreen({super.key, required this.category});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  late List<int?> _answers;
  Timer? _questionTimer;
  Timer? _advanceTimer;
  int _timeLeft = 15;
  static const int _totalTime = 15;
  bool _locked = false;

  @override
  void initState() {
    super.initState();
    _answers = List.filled(widget.category.questions.length, null);
    _startTimer();
  }

  @override
  void dispose() {
    _questionTimer?.cancel();
    _advanceTimer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _questionTimer?.cancel();
    _advanceTimer?.cancel();
    final alreadyAnswered = _answers[_currentIndex] != null;
    setState(() {
      _locked = alreadyAnswered;
      _timeLeft = alreadyAnswered ? 0 : _totalTime;
    });
    if (alreadyAnswered) return;

    _questionTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) { t.cancel(); return; }
      setState(() => _timeLeft--);
      if (_timeLeft <= 0) { t.cancel(); _onTimeUp(); }
    });
  }

  void _onTimeUp() {
    if (!mounted || _locked) return;
    setState(() { _answers[_currentIndex] = -1; _locked = true; });
    _scheduleAdvance();
  }

  void _scheduleAdvance() {
    _advanceTimer?.cancel();
    if (_currentIndex < widget.category.questions.length - 1) {
      _advanceTimer = Timer(const Duration(milliseconds: 1200), () {
        if (mounted) _goTo(_currentIndex + 1);
      });
    }
  }

  void _goTo(int index) {
    _questionTimer?.cancel();
    _advanceTimer?.cancel();
    setState(() => _currentIndex = index);
    _startTimer();
  }

  void _select(int index) {
    if (_locked) return;
    _questionTimer?.cancel();
    setState(() { _answers[_currentIndex] = index; _locked = true; });
    _scheduleAdvance();
  }

  void _goPrev() { if (_currentIndex > 0) _goTo(_currentIndex - 1); }

  void _goNext() {
    _advanceTimer?.cancel();
    if (_currentIndex < widget.category.questions.length - 1) _goTo(_currentIndex + 1);
  }

  void _finish() {
    _questionTimer?.cancel();
    _advanceTimer?.cancel();
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (_) => ResultScreen(category: widget.category, userAnswers: List.from(_answers)),
    ));
  }

  Color get _timerColor {
    if (_timeLeft > 10) return const Color(0xFF22C55E);
    if (_timeLeft > 5)  return const Color(0xFFF97316);
    return const Color(0xFFEF4444);
  }

  int  get _correct => widget.category.questions[_currentIndex].correct;
  int? get _sel     => _answers[_currentIndex];

  Color _optBg(int i) {
    if (!_locked) return Colors.white;
    if (i == _correct) return const Color(0xFFF0FDF4);
    if (_sel == i)     return const Color(0xFFFFF1F2);
    return const Color(0xFFF8FAFC);
  }

  Color _optBorder(int i) {
    if (!_locked) return const Color(0xFFE2E8F0);
    if (i == _correct) return const Color(0xFF86EFAC);
    if (_sel == i)     return const Color(0xFFFCA5A5);
    return const Color(0xFFE2E8F0);
  }

  Color _optText(int i) {
    if (!_locked) return const Color(0xFF1E293B);
    if (i == _correct) return const Color(0xFF15803D);
    if (_sel == i)     return const Color(0xFFDC2626);
    return const Color(0xFF94A3B8);
  }

  Color _badgeBg(int i) {
    if (!_locked) return const Color(0xFFEEF2FF);
    if (i == _correct) return const Color(0xFF22C55E);
    if (_sel == i)     return const Color(0xFFEF4444);
    return const Color(0xFFE2E8F0);
  }

  Color _badgeText(int i) {
    if (!_locked) return const Color(0xFF6366F1);
    if (i == _correct || _sel == i) return Colors.white;
    return const Color(0xFF94A3B8);
  }

  Widget? _trailingIcon(int i) {
    if (!_locked) return null;
    if (i == _correct) return const Icon(Icons.check_circle, color: Color(0xFF22C55E), size: 20);
    if (_sel == i && i != _correct) return const Icon(Icons.cancel, color: Color(0xFFEF4444), size: 20);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final q           = widget.category.questions[_currentIndex];
    final total       = widget.category.questions.length;
    final a           = _answers[_currentIndex];
    final isTimedOut  = a == -1;
    final isAnswered  = a != null;
    final isCorrect   = a != null && a != -1 && a == _correct;

    return Scaffold(
      backgroundColor: const Color(0xFFEEF2FF),
      body: SafeArea(
        child: SelectionArea(
          child: Center(
           child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 780),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    OutlinedButton.icon(
                      onPressed: () {
                        _questionTimer?.cancel(); _advanceTimer?.cancel();
                        Navigator.popUntil(context, (r) => r.isFirst);
                      },
                      icon: const Icon(Icons.home_outlined, size: 16),
                      label: const Text('Accueil'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF1E293B),
                        side: const BorderSide(color: Color(0xFFCBD5E1)),
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    Text('Question ${_currentIndex + 1} sur $total',
                        style: const TextStyle(fontSize: 14, color: Color(0xFF64748B), fontWeight: FontWeight.w500)),
                  ]),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 20, offset: const Offset(0, 4))],
                      ),
                      padding: const EdgeInsets.all(28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                            Text(widget.category.title, style: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8))),
                            Row(children: [
                              Icon(Icons.timer_outlined, color: _timerColor, size: 16),
                              const SizedBox(width: 4),
                              Text('${_timeLeft}s', style: TextStyle(color: _timerColor, fontWeight: FontWeight.bold, fontSize: 14)),
                            ]),
                          ]),
                          const SizedBox(height: 10),
                          ClipRRect(borderRadius: BorderRadius.circular(4), child: LinearProgressIndicator(
                            value: _timeLeft / _totalTime,
                            backgroundColor: const Color(0xFFE2E8F0),
                            valueColor: AlwaysStoppedAnimation<Color>(_timerColor),
                            minHeight: 6,
                          )),
                          const SizedBox(height: 6),
                          ClipRRect(borderRadius: BorderRadius.circular(4), child: LinearProgressIndicator(
                            value: (_currentIndex + 1) / total,
                            backgroundColor: const Color(0xFFE2E8F0),
                            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF6366F1)),
                            minHeight: 6,
                          )),
                          const SizedBox(height: 24),
                          Text(q.question, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B), height: 1.45)),
                          const SizedBox(height: 20),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...List.generate(q.options.length, (i) {
                                    const labels = ['A', 'B', 'C', 'D'];
                                    final trailing = _trailingIcon(i);
                                    final isActive = _locked && (i == _correct || _sel == i);
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 12),
                                      child: GestureDetector(
                                        onTap: () => _select(i),
                                        child: AnimatedContainer(
                                          duration: const Duration(milliseconds: 300),
                                          decoration: BoxDecoration(
                                            color: _optBg(i),
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(color: _optBorder(i), width: isActive ? 2 : 1),
                                          ),
                                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                          child: Row(children: [
                                            AnimatedContainer(
                                              duration: const Duration(milliseconds: 300),
                                              width: 34, height: 34,
                                              decoration: BoxDecoration(color: _badgeBg(i), shape: BoxShape.circle),
                                              child: Center(child: Text(labels[i], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: _badgeText(i)))),
                                            ),
                                            const SizedBox(width: 14),
                                            Expanded(child: Text(q.options[i], style: TextStyle(fontSize: 15, color: _optText(i), fontWeight: isActive ? FontWeight.w600 : FontWeight.normal))),
                                            if (trailing != null) ...[const SizedBox(width: 8), trailing],
                                          ]),
                                        ),
                                      ),
                                    );
                                  }),
                                  if (isAnswered) ...[
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(14),
                                      decoration: BoxDecoration(
                                        color: isTimedOut ? const Color(0xFFFFFBEB) : (isCorrect ? const Color(0xFFF0FDF4) : const Color(0xFFFFF1F2)),
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: isTimedOut ? const Color(0xFFFCD34D) : (isCorrect ? const Color(0xFF86EFAC) : const Color(0xFFFCA5A5)),
                                          width: 1.5,
                                        ),
                                      ),
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                        Text(
                                          isTimedOut ? '⏰ Temps écoulé !' : (isCorrect ? '✓ Bonne réponse !' : '✗ Mauvaise réponse'),
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,
                                            color: isTimedOut ? const Color(0xFF92400E) : (isCorrect ? const Color(0xFF15803D) : const Color(0xFFDC2626))),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(q.explanation, style: TextStyle(fontSize: 13, height: 1.4,
                                          color: isTimedOut ? const Color(0xFF78350F) : (isCorrect ? const Color(0xFF16A34A) : const Color(0xFF6366F1)))),
                                      ]),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    OutlinedButton(
                      onPressed: _currentIndex > 0 ? _goPrev : null,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF475569),
                        disabledForegroundColor: const Color(0xFFCBD5E1),
                        side: BorderSide(color: _currentIndex > 0 ? const Color(0xFFCBD5E1) : const Color(0xFFECF0F1)),
                        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Row(mainAxisSize: MainAxisSize.min, children: [
                        Icon(Icons.arrow_back, size: 16), SizedBox(width: 6),
                        Text('Précédent', style: TextStyle(fontSize: 15)),
                      ]),
                    ),
                    if (_locked && _currentIndex < total - 1)
                      Row(children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                          decoration: BoxDecoration(color: const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(10)),
                          child: const Row(mainAxisSize: MainAxisSize.min, children: [
                            SizedBox(width: 15, height: 15, child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF6366F1))),
                            SizedBox(width: 7),
                            Text('Suite...', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 13)),
                          ]),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton.icon(
                          onPressed: _goNext,
                          icon: const Icon(Icons.skip_next, size: 18),
                          label: const Text('Suivant'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            elevation: 0,
                          ),
                        ),
                      ])
                    else
                      ElevatedButton(
                        onPressed: _currentIndex < total - 1 ? _goNext : _finish,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          elevation: 0,
                        ),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          Text(_currentIndex < total - 1 ? 'Suivant' : 'Terminer',
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                          const SizedBox(width: 6),
                          Icon(_currentIndex < total - 1 ? Icons.arrow_forward : Icons.flag, size: 16),
                        ]),
                      ),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}