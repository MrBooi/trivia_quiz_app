import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_level/quiz_level_controller.dart';

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
    final selectedLevel = ref.watch(quizLevelController);
    return Column(
      children: [
        const SizedBox(height: 12),
        const Text("Select Quiz Difficulty Level"),
        const SizedBox(height: 8),
        Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          runSpacing: 16.0,
          spacing: 16.0,
          children: [
            ...Difficulty.values
                .map(
                  (difficulty) => ActionChip(
                    label: Text(difficulty.name),
                    labelStyle: const TextStyle(color: Colors.white),
                    backgroundColor: selectedLevel == difficulty
                        ? Colors.green // TODO Move this
                        : Colors.grey.shade600,
                    onPressed: () => ref
                        .read(quizLevelController.notifier)
                        .onLevelChanged(difficulty),
                  ),
                )
                .toList(),
          ],
        )
      ],
    );
  }
}
