import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:opentrivia/features/quiz/domain/question.dart';

part 'quiz_state.freezed.dart';
part 'quiz_state.g.dart';

enum QuizStatus {
  initial,
  correct,
  incorrect,
  completed,
}

@freezed
class QuizState with _$QuizState {
  const QuizState._();

  factory QuizState({
    required String selectedAnswer,
    required List<Question> correct,
    required List<Question> incorrect,
    required QuizStatus status,
  }) = _QuizState;

  factory QuizState.initial() {
    return QuizState(
      selectedAnswer: '',
      correct: [],
      incorrect: [],
      status: QuizStatus.initial,
    );
  }

  bool get isAnswered =>
      status == QuizStatus.correct || status == QuizStatus.incorrect;

  bool get isCompleted => status == QuizStatus.completed;

  int get completedQuestions => correct.length + incorrect.length;

  factory QuizState.fromJson(Map<String, dynamic> json) =>
      _$QuizStateFromJson(json);
}
