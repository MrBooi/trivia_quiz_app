import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_level/quiz_level.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_type/quiz_question_type.dart';

part 'quiz_settings.freezed.dart';
part 'quiz_settings.g.dart';

@freezed
class QuizSettingsModel with _$QuizSettingsModel {
  const QuizSettingsModel._();

  factory QuizSettingsModel({
    required String difficulty,
    required int total,
    required QuizLevelType type,
  }) = _QuizSettingsModel;

  factory QuizSettingsModel.empty() => QuizSettingsModel(
        difficulty: Difficulty.easy.name,
        total: 10,
        type: QuizLevelType.multiple,
      );

  factory QuizSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$QuizSettingsModelFromJson(json);
}
