import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/core/configs/configs.dart';
import 'package:opentrivia/features/quiz_settings/presentation/quiz_settings_controller.dart';

class QuizQuestionType extends ConsumerWidget {
  const QuizQuestionType({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedType = ref.watch(quizSettingsController).type;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(height: 12),
      const Text("Select Quiz Question Type"),
      const SizedBox(height: 8),
      Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        runSpacing: 16.0,
        spacing: 16.0,
        children: [
          ...Configs.questionTypes
              .map(
                (type) => ActionChip(
                  label: Text(type),
                  labelStyle: const TextStyle(color: Colors.white),
                  backgroundColor: selectedType == type
                      ? Colors.green // TODO Move this
                      : Colors.grey.shade600,
                  onPressed: () => ref
                      .read(quizSettingsController.notifier)
                      .updateQuestionType(type),
                ),
              )
              .toList(),
        ],
      )
    ]);
  }
}
