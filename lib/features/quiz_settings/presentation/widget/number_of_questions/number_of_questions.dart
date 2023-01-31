import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/core/configs/configs.dart';
import 'package:opentrivia/features/quiz_settings/presentation/quiz_settings_controller.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/settings_action_chip.dart';

class NumberOfQuestions extends ConsumerWidget {
  const NumberOfQuestions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedNumber = ref.watch(quizSettingsController).total;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          'Select Total Number of Questions',
          style: TextStyle(
            color: Colors.grey.shade900,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          runSpacing: 16.0,
          spacing: 16.0,
          children: [
            ...Configs.totalNumberOfQuiz
                .map(
                  (number) => SettingActionChip(
                    key: ValueKey('$number'),
                    label: '$number',
                    isSelected: selectedNumber == number,
                    onPressed: () => ref
                        .read(quizSettingsController.notifier)
                        .updateNumberOfQuestions(number),
                  ),
                )
                .toList(),
          ],
        )
      ],
    );
  }
}
