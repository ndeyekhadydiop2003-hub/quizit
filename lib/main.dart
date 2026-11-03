import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(const QuizITApp());

class QuizITApp extends StatelessWidget {
  const QuizITApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizIT',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6366F1)),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}




