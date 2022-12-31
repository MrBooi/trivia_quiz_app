import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_level/quiz_level.dart';

class QuizLevelController extends StateNotifier<Difficulty> {
  QuizLevelController() : super(Difficulty.easy);

  void onLevelChanged(Difficulty difficulty) {
    state = difficulty;
  }
}

final quizLevelController =
    StateNotifierProvider<QuizLevelController, Difficulty>(
  (ref) {
    return QuizLevelController();
  },
);
