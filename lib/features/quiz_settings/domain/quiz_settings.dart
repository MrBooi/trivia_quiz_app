import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_settings.freezed.dart';
part 'quiz_settings.g.dart';

@freezed
class QuizSettingsModel with _$QuizSettingsModel {
  const QuizSettingsModel._();

  factory QuizSettingsModel({
    String? difficulty,
    required int total,
  }) = _QuizSettingsModel;

  factory QuizSettingsModel.fromJson(Map<String, dynamic> json) =>
      _$QuizSettingsModelFromJson(json);
}
