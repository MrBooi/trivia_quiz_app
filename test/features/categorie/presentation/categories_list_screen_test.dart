import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/features/categorie/infrastucture/category_facade.dart';
import 'package:opentrivia/features/categorie/presentation/categories_list_screen.dart';

import '../../../fixtures/categories/categories_fixtures.dart';
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

  testWidgets('should return [error message] when to categories found.',
      (tester) async {
    final r = Robot(tester);
    await r.pumpEntryForSingleWidget(
      overrides: [
        categoriesListProvider.overrideWith((ref) async {
          return emptyCategoryResponseFixture;
        }),
      ],
      const CategoriesListScreen(),
    );

    r.categoriesRobot.expectCategoryMainTextFound();
    r.categoriesRobot.expectCategoriesNotFound();
  });
}
