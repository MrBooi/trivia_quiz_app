import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:opentrivia/core/shared/app_button.dart';
import 'package:opentrivia/core/styles/app_colors.dart';
import 'package:opentrivia/features/quiz/domain/question.dart';
import 'package:opentrivia/features/quiz/presentation/controller/quiz_controller.dart';

import 'question_list.dart';

class QuestionWidget extends ConsumerWidget {
  const QuestionWidget({
    required this.questions,
    required this.pageController,
    super.key,
  });
  final List<Question> questions;
  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(quizControllerProvider);
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (context, idx) {
        final question = questions[idx];
        return Column(
          children: [
            const SizedBox(height: 10),
            Text(
              'Question ${idx + 1} of ${questions.length}',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 12.0),
              child: Text(
                HtmlUnescape().convert(question.question),
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Spacer(),
            QuestionList(
              question: question,
            ),
            if (!state.isAnswered) const SizedBox.shrink(),
            PrimaryButton(
              title: 'Next Question', // TODO move this to locale file
              onTap: () {
                ref.read(quizControllerProvider.notifier).nextQuestion(
                      questions,
                      pageController.page!.toInt(),
                    );
                if (pageController.page!.toInt() + 1 < questions.length) {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.linear,
                  );
                }
              },
            ),
            const Spacer(),
          ],
        );
      },
    );
  }
}
