import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/features/quiz/domain/question.dart';
import 'package:opentrivia/features/quiz/presentation/controller/quiz_controller.dart';
import 'package:opentrivia/features/quiz/presentation/widget/question_option.dart';

class QuestionList extends ConsumerWidget {
  const QuestionList({required this.question, super.key});
  final Question question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizControllerProvider);
    return Column(
      children: question.answers
          .map(
            (answer) => QuestionOption(
              answer: answer,
              isSelected: answer == state.selectedAnswer,
              isCorrect: answer == question.correctAnswer,
              isDisplayingAnswer: state.isAnswered,
              onTap: () => ref
                  .read(quizControllerProvider.notifier)
                  .submitAnswer(question, answer),
            ),
          )
          .toList(),
    );
  }
}
