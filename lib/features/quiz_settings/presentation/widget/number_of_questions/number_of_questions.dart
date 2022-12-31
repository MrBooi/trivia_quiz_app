import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/core/configs/configs.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/number_of_questions/number_of_questions_controller.dart';

class NumberOfQuestions extends ConsumerWidget {
  const NumberOfQuestions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedNumber = ref.watch(numberOfQuestionsController);
    return Column(
      children: [
        const SizedBox(height: 12),
        const Text("Select Total Number of Questions"),
        const SizedBox(height: 8),
        Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          runSpacing: 16.0,
          spacing: 16.0,
          children: [
            ...Configs.totalNumberOfQuiz
                .map(
                  (num) => ActionChip(
                    label: Text('$num'),
                    labelStyle: const TextStyle(color: Colors.white),
                    backgroundColor: selectedNumber == num
                        ? Colors.green // TODO Move this
                        : Colors.grey.shade600,
                    onPressed: () => ref
                        .read(numberOfQuestionsController.notifier)
                        .onNumberOfQuestionChanged(num),
                  ),
                )
                .toList(),
          ],
        )
      ],
    );
  }
}
