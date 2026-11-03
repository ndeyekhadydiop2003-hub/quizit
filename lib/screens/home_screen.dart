
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
        child: SelectionArea(
          child: LayoutBuilder(
           builder: (context, screenConstraints) {
            final screenWidth = screenConstraints.maxWidth;

            // Marges adaptées à la taille de l'écran
            final horizontalPadding = screenWidth < 600
                ? 16.0
                : screenWidth < 900
                    ? 24.0
                    : 32.0;

            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1100),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: screenWidth < 600 ? 24 : 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 12),

                      // Titre principal
                      Text(
                        'QuizIT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth < 600 ? 42 : 52,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF6366F1),
                          letterSpacing: -1.5,
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Description
                      Text(
                        "Simulateur d'examen informatique — "
                        "choisissez une matière et testez vos connaissances.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth < 600 ? 15 : 16,
                          color: const Color(0xFF64748B),
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 36),

                      // Grille responsive
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final width = constraints.maxWidth;

                          // Téléphone : 1 colonne
                          // Tablette : 2 colonnes
                          // Ordinateur : 3 colonnes
                          final cols = width >= 900
                              ? 3
                              : width >= 560
                                  ? 2
                                  : 1;

                          return GridView.builder(
                            shrinkWrap: true,
                            physics:
                                const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: cols,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              mainAxisExtent:
                                  cols == 1 ? 220 : 220,
                            ),
                            itemCount: quizCategories.length,
                            itemBuilder: (context, index) {
                              return _CategoryCard(
                                category: quizCategories[index],
                              );
                            },
                          );
                        },
                      ),

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ));

  }
}

class _CategoryCard extends StatelessWidget {
  final QuizCategory category;

  const _CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      elevation: 0,
      shadowColor: Colors.black.withOpacity(0.07),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => QuizScreen(category: category),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 14,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icône de la matière
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: category.gradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  category.icon,
                  color: Colors.white,
                  size: 27,
                ),
              ),

              const SizedBox(height: 12),

              // Nom de la matière
              Text(
                category.title,
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                  height: 1.3,
                ),
              ),

              const SizedBox(height: 5),

              // Description
              Expanded(
                child: Text(
                  category.description,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF94A3B8),
                    height: 1.4,
                  ),
                ),
              ),

              const SizedBox(height: 6),

              // Informations : questions et durée
              Wrap(
                spacing: 14,
                runSpacing: 5,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  _CardInfo(
                    icon: Icons.quiz_outlined,
                    text: '${category.questions.length} questions',
                  ),
                  _CardInfo(
                    icon: Icons.access_time,
                    text: '${category.duration} min',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const _CardInfo({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 14,
          color: const Color(0xFFB0C4D8),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF94A3B8),
          ),
        ),
      ],
    );
  }
}
