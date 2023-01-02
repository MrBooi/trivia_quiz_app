import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

@freezed
class Question with _$Question {
  const Question._();

  factory Question({
    @JsonKey(name: "category") required String categoryName,
    required String type,
    required String difficulty,
    required String question,
    @JsonKey(name: "correct_answer") required String correctAnswer,
    @JsonKey(name: "incorrect_answers") required List<String> incorrectAnswers,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  static List<Question> fromData(List<Map<String, dynamic>> data) {
    return data.map((question) => Question.fromJson(question)).toList();
  }
}