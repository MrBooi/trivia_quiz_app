import 'package:flutter_test/flutter_test.dart';

import '../test/fixtures/quiz_settings/quiz_settings_fixture.dart';
import '../test/robot.dart';

void main() {
  testWidgets('Full Quiz Flow', (tester) async {
    await tester.runAsync(() async {
      final r = Robot(tester);
      await r.pumpMyApp();

      r.categoriesRobot.expectCategoryMainTextFound();
      r.categoriesRobot.expectCategoriesFound();

      // verify on settings screen
      await r.tapOnSettingsIcon();
      r.quizSettingsRobot.foundQuizSettings();
      r.quizSettingsRobot.expectNumberOfQuestionsFound();
      r.quizSettingsRobot.expectQuizLevelFound();
      r.quizSettingsRobot.expectNumberOfQuestionsFound();

      // update settings
      await r.quizSettingsRobot.tapNumberOfQuestions(quizSettingsFixture.total);
      await r.quizSettingsRobot.tapQuizLevel(quizDifficulty);
      await r.quizSettingsRobot.tapQuizQuestionType(quizSettingsFixture.type);

      // close settings screen
      // TODO click on close button

      // // tap on category item
      // r.categoriesRobot.expectCategoryMainTextFound();
      // // tap on category item
      // r.categoriesRobot.tapCategoryItem(categories[3].id.toString());
    });
  });
}
