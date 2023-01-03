import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/core/shared/async_value_widget.dart';
import 'package:opentrivia/features/categorie/domain/category.dart';
import 'package:opentrivia/features/quiz/infrastucture/question_facade.dart';
import 'package:opentrivia/features/quiz/presentation/controller/quiz_controller.dart';
import 'package:opentrivia/features/quiz/presentation/widget/question_widget.dart';
import 'package:opentrivia/features/quiz/presentation/widget/results/quiz_result_widget.dart';

class QuizBody extends ConsumerWidget {
  const QuizBody({required this.id, super.key});
  final CategoryID id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.watch(questionsListProvider(id));
    final state = ref.watch(quizControllerProvider);
    final pageController = PageController();

    return AsyncValueWidget(
      value: questions,
      data: (q) {
        if (q.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Please update your settings, we could not find trivia questions.', // TODO move this to local
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }

        return !state.isCompleted
            ? QuestionWidget(
                questions: q,
                pageController: pageController,
              )
            : QuizResultsWidget(questions: q);
      },
    );
  }
}
