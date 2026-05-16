import 'package:flutter/material.dart';
import '../models/quiz_category.dart';
import '../data/quiz_data.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF2FF),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  const Text('QuizIT',
                      style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold, color: Color(0xFF6366F1), letterSpacing: -1.5)),
                  const SizedBox(height: 12),
                  const Text(
                    "Simulateur d'examen informatique — choisissez une matière et testez vos connaissances.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Color(0xFF64748B), height: 1.5),
                  ),
                  const SizedBox(height: 40),
                  LayoutBuilder(builder: (context, constraints) {
                    final cols = constraints.maxWidth > 600 ? 3 : 2;
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: cols,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 200,
                      ),
                      itemCount: quizCategories.length,
                      itemBuilder: (_, i) => _CategoryCard(category: quizCategories[i]),
                    );
                  }),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final QuizCategory category;
  const _CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => QuizScreen(category: category))),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 16, offset: const Offset(0, 4))],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 56, height: 56,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: category.gradient, begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(category.icon, color: Colors.white, size: 28),
            ),
            const SizedBox(height: 14),
            Text(category.title,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                maxLines: 2, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 5),
            Text(category.description,
                style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                maxLines: 2, overflow: TextOverflow.ellipsis),
            const Spacer(),
            Row(
              children: [
                const Icon(Icons.quiz_outlined, size: 13, color: Color(0xFFB0C4D8)),
                const SizedBox(width: 4),
                Text('${category.questions.length} questions', style: const TextStyle(fontSize: 12, color: Color(0xFFB0C4D8))),
                const SizedBox(width: 10),
                const Icon(Icons.access_time, size: 13, color: Color(0xFFB0C4D8)),
                const SizedBox(width: 4),
                Text('${category.duration} min', style: const TextStyle(fontSize: 12, color: Color(0xFFB0C4D8))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}