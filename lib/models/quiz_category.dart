import 'package:flutter/material.dart';
import 'quiz_question.dart';

class QuizCategory {
  final String id;
  final String title;
  final String description;
  final List<Color> gradient;
  final IconData icon;
  final List<QuizQuestion> questions;

  const QuizCategory({
    required this.id,
    required this.title,
    required this.description,
    required this.gradient,
    required this.icon,
    required this.questions,
  });

  int get duration => 4;
}