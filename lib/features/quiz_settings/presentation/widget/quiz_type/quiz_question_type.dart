import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/features/quiz_settings/presentation/quiz_settings_controller.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/settings_action_chip.dart';

enum QuizLevelType {
  boolean('True/False'),
  multiple('Multiple choice');

  const QuizLevelType(this.message);
  final String message;
}

class QuizQuestionType extends ConsumerWidget {
  const QuizQuestionType({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedType = ref.watch(quizLevelProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        Text(
          'Select Quiz Question Type',
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
            ...QuizLevelType.values
                .map(
                  (type) => SettingActionChip(
                    key: ValueKey(type.message),
                    label: type.message,
                    isSelected: selectedType == type,
                    onPressed: () => ref
                        .read(quizSettingsController.notifier)
                        .updateQuestionType(type),
                  ),
                )
                .toList(),
          ],
        )
      ],
    );
  }
}
