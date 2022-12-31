import 'package:flutter/material.dart';
import 'package:opentrivia/core/shared/trivia_app_bar.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/number_of_questions/number_of_questions.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_level/quiz_level.dart';

class QuizSettingsScreen extends StatelessWidget {
  const QuizSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TriviaAppBar(
        title: 'Quiz Settings',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            NumberOfQuestions(),
            QuizLevel(),
          ],
        ),
      ),
    );
  }
}
