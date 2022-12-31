import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/core/configs/configs.dart';

class NumberOfQuestionsController extends StateNotifier<int> {
  NumberOfQuestionsController() : super(Configs.totalNumberOfQuiz.first);

  void onNumberOfQuestionChanged(int selectedQuestionNumber) {
    state = selectedQuestionNumber;
  }
}

final numberOfQuestionsController =
    StateNotifierProvider<NumberOfQuestionsController, int>(
  (ref) {
    return NumberOfQuestionsController();
  },
);
