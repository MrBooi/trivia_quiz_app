import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/features/quiz_settings/presentation/quiz_settings_controller.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/settings_action_chip.dart';

enum Difficulty {
  any,
  easy,
  medium,
  hard,
}

class QuizLevel extends ConsumerWidget {
  const QuizLevel({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDifficulty = ref.watch(quizQuestionTypeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        const Text('Select Quiz Difficulty Level'),
        const SizedBox(height: 8),
        Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          runSpacing: 16.0,
          spacing: 16.0,
          children: [
            ...Difficulty.values
                .map(
                  (difficulty) => SettingActionChip(
                    isSelected: selectedDifficulty == difficulty,
                    label: difficulty.name,
                    onPressed: () => ref
                        .read(quizSettingsController.notifier)
                        .updateDifficulty(difficulty),
                  ),
                )
                .toList(),
          ],
        )
      ],
    );
  }
}
