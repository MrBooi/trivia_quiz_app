import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_level/quiz_level.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_type/quiz_question_type.dart';

import '../../../robot.dart';

void main() {
  testWidgets('Should verify that we are on QuizSettingsScreen',
      (tester) async {
    final r = Robot(tester);
    await r.pumpMyApp();

    // should tap on settings Icon to navigate to QuizSettingsScreen
    await r.tapOnSettingsIcon();

    r.quizSettingsRobot.foundQuizSettings();
    r.quizSettingsRobot.expectNumberOfQuestionsFound();
    r.quizSettingsRobot.expectQuizQuestionTypeFound();
    r.quizSettingsRobot.expectQuizLevelFound();
  });

  testWidgets('Should select 20 has a number of questions', (tester) async {
    final r = Robot(tester);
    await r.pumpMyApp();

    // should tap on settings Icon to navigate to QuizSettingsScreen
    await r.tapOnSettingsIcon();

    r.quizSettingsRobot.foundQuizSettings();
    r.quizSettingsRobot.expectNumberOfQuestionsFound();
    await r.quizSettingsRobot.tapNumberOfQuestions(20);
  });

  testWidgets('Should select Multiple choice has a quiz type ', (tester) async {
    final r = Robot(tester);
    await r.pumpMyApp();

    // should tap on settings Icon to navigate to QuizSettingsScreen
    await r.tapOnSettingsIcon();

    r.quizSettingsRobot.foundQuizSettings();
    r.quizSettingsRobot.expectQuizQuestionTypeFound();
    await r.quizSettingsRobot.tapQuizQuestionType(QuizLevelType.multiple);
  });

  testWidgets('Should select medium has a quiz level.', (tester) async {
    final r = Robot(tester);
    await r.pumpMyApp();

    // should tap on settings Icon to navigate to QuizSettingsScreen
    await r.tapOnSettingsIcon();

    r.quizSettingsRobot.foundQuizSettings();
    r.quizSettingsRobot.expectQuizLevelFound();
    await r.quizSettingsRobot.tapQuizLevel(Difficulty.medium);
  });
}
