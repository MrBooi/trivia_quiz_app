import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/core/shared/app_button.dart';
import 'package:opentrivia/core/styles/app_colors.dart';
import 'package:opentrivia/features/quiz/domain/question.dart';
import 'package:opentrivia/features/quiz/presentation/controller/quiz_controller.dart';

class QuizResultsWidget extends ConsumerWidget {
  final List<Question> questions;

  const QuizResultsWidget({
    Key? key,
    required this.questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizControllerProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'You got ${state.correct.length} out of ${questions.length} questions correctly!',
          style: const TextStyle(
            color: AppColors.primary,
            fontSize: 60.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40.0),
        PrimaryButton(
          title: 'New Quiz',
          onTap: () {
            Navigator.pop(context);
            ref.read(quizControllerProvider.notifier).newQuiz();
          },
        ),
      ],
    );
  }
}
