import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/quiz_settings/quiz_settings_fixture.dart';
import '../../../robot.dart';

void main() {
  testWidgets('should verify that were are on categories widget.',
      (tester) async {
    final r = Robot(tester);
    await r.pumpMyApp();

    r.categoriesRobot.expectCategoryMainTextFound();
    r.categoriesRobot.expectCategoriesFound();
  });

  testWidgets('should tap on first  category item.', (tester) async {
    final r = Robot(tester);
    await r.pumpMyApp();

    r.categoriesRobot.expectCategoryMainTextFound();
    r.categoriesRobot.expectCategoriesFound();
    await r.categoriesRobot.tapCategoryItem(categories.first.id.toString());
  });

  testWidgets('should tap on third category item.', (tester) async {
    final r = Robot(tester);
    await r.pumpMyApp();

    r.categoriesRobot.expectCategoryMainTextFound();
    r.categoriesRobot.expectCategoriesFound();
    await r.categoriesRobot.tapCategoryItem(categories[3].id.toString());
  });
}
