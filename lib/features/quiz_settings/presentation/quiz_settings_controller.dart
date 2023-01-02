import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/features/quiz_settings/domain/quiz_settings.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_level/quiz_level.dart';

class QuizSettingsController extends StateNotifier<QuizSettingsModel> {
  QuizSettingsController() : super(QuizSettingsModel.empty());

  void updateDifficulty(Difficulty difficulty) {
    state = state.copyWith(difficulty: difficulty.name);
  }

  void updateNumberOfQuestions(int numberOfQuestions) {
    state = state.copyWith(total: numberOfQuestions);
  }

  void updateQuestionType(String type) {
    state = state.copyWith(type: type);
  }
}

final quizSettingsController =
    StateNotifierProvider<QuizSettingsController, QuizSettingsModel>(
  (ref) {
    return QuizSettingsController();
  },
);

final quizQuestionTypeProvider = Provider<Difficulty>((ref) {
  final difficulty = ref.watch(quizSettingsController).difficulty;
  return Difficulty.values.firstWhere((el) => el.name == difficulty);
});
