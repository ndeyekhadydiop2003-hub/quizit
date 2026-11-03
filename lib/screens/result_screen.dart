import 'package:flutter/material.dart';
import '../models/quiz_category.dart';
import 'quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  final QuizCategory category;
  final List<int?> userAnswers;
  const ResultScreen({super.key, required this.category, required this.userAnswers});

  int get _score => userAnswers.asMap().entries
      .where((e) => e.value == category.questions[e.key].correct).length;

  @override
  Widget build(BuildContext context) {
    final total = category.questions.length;
    final score = _score;
    final pct   = (score / total * 100).round();

    return Scaffold(
      backgroundColor: const Color(0xFFEEF2FF),
      body: SafeArea(
        child: SelectionArea(
          child: Center(
           child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 780),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Text('Résultats — ${category.title}',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
                  const SizedBox(height: 4),
                  const Text('Vous avez obtenu', style: TextStyle(fontSize: 14, color: Color(0xFF94A3B8))),
                  const SizedBox(height: 14),
                  Text('$score / $total',
                      style: const TextStyle(fontSize: 56, fontWeight: FontWeight.bold, color: Color(0xFF6366F1), height: 1)),
                  const SizedBox(height: 6),
                  Text('Score : $pct%', style: const TextStyle(fontSize: 16, color: Color(0xFF64748B))),
                  const SizedBox(height: 28),
                  ...List.generate(category.questions.length, (i) {
                    final q       = category.questions[i];
                    final correct = userAnswers[i] == q.correct;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: correct ? const Color(0xFFF0FDF4) : const Color(0xFFFFF1F2),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: correct ? const Color(0xFF86EFAC) : const Color(0xFFFCA5A5)),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Icon(correct ? Icons.check_circle : Icons.cancel,
                                  color: correct ? const Color(0xFF22C55E) : const Color(0xFFEF4444), size: 20),
                              const SizedBox(width: 10),
                              Expanded(child: Text('${i + 1}. ${q.question}',
                                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Color(0xFF1E293B), height: 1.4))),
                            ]),
                            const SizedBox(height: 6),
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(q.explanation,
                                  style: TextStyle(fontSize: 13,
                                      color: correct ? const Color(0xFF16A34A) : const Color(0xFF6366F1), height: 1.4)),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                  Row(children: [
                    Expanded(child: ElevatedButton.icon(
                      onPressed: () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => QuizScreen(category: category))),
                      icon: const Icon(Icons.refresh, size: 18),
                      label: const Text('Recommencer', style: TextStyle(fontSize: 15)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6366F1), foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), elevation: 0,
                      ),
                    )),
                    const SizedBox(width: 14),
                    Expanded(child: OutlinedButton.icon(
                      onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
                      icon: const Icon(Icons.home_outlined, size: 18),
                      label: const Text('Accueil', style: TextStyle(fontSize: 15)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF1E293B),
                        side: const BorderSide(color: Color(0xFFCBD5E1)),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    )),
                  ]),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}