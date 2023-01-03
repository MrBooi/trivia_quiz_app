import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/features/quiz_settings/domain/quiz_settings.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_level/quiz_level.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_type/quiz_question_type.dart';

class QuizSettingsController extends StateNotifier<QuizSettingsModel> {
  QuizSettingsController() : super(QuizSettingsModel.empty());

  void updateDifficulty(Difficulty difficulty) {
    state = state.copyWith(difficulty: difficulty.name);
  }

  void updateNumberOfQuestions(int numberOfQuestions) {
    state = state.copyWith(total: numberOfQuestions);
  }

  void updateQuestionType(QuizLevelType type) {
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

final quizLevelProvider = Provider<QuizLevelType>((ref) {
  final type = ref.watch(quizSettingsController).type;
  return QuizLevelType.values.firstWhere(
    (el) => el == type,
  );
});
