import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/features/quiz/domain/question.dart';
import 'package:opentrivia/features/quiz/presentation/controller/quiz_state.dart';

class QuizController extends StateNotifier<QuizState> {
  QuizController() : super(QuizState.initial());

  void submitAnswer(Question currentQuestion, String answer) {
    if (state.isAnswered) return;
    if (currentQuestion.correctAnswer == answer) {
      final correct = [...state.correct];
      state = state.copyWith(
        selectedAnswer: answer,
        correct: correct..add(currentQuestion),
        status: QuizStatus.correct,
      );
    } else {
      final incorrect = [...state.incorrect];
      state = state.copyWith(
        selectedAnswer: answer,
        incorrect: incorrect..add(currentQuestion),
        status: QuizStatus.incorrect,
      );
    }
  }

  void nextQuestion(List<Question> questions, int currentIndex) {
    state = state.copyWith(
      selectedAnswer: '',
      status: currentIndex + 1 < questions.length
          ? QuizStatus.initial
          : QuizStatus.completed,
    );
  }

  void newQuiz() {
    state = QuizState.initial();
  }
}

final quizControllerProvider =
    StateNotifierProvider.autoDispose<QuizController, QuizState>(
  (ref) => QuizController(),
);
