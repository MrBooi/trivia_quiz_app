import 'package:flutter_test/flutter_test.dart';

import '../test/robot.dart';

void main() {
  testWidgets('Full Quiz Flow', (tester) async {
    await tester.runAsync(() async {
      final r = Robot(tester);
      await r.pumpMyApp();

      r.categoriesRobot.expectCategoryMainTextFound();
      r.categoriesRobot.expectCategoriesFound();
    });
  });
}
