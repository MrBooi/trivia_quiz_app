import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/core/presentation/app_widget.dart';
import 'package:opentrivia/features/categorie/infrastucture/category_facade.dart';

import 'core/shared/shared_robot.dart';
import 'features/categorie/categories_robot.dart';
import 'features/quiz/quiz_robot.dart';
import 'fixtures/categories/categories_fixtures.dart';
import 'fixtures/quiz_settings/quiz_settings_robot.dart';

class Robot {
  Robot(this.tester)
      : shared = SharedRobot(tester),
        quizSettingsRobot = QuizSettingsRobot(tester),
        categoriesRobot = CategoriesRobot(tester),
        quizRobot = QuizRobot(tester);

  final WidgetTester tester;
  final SharedRobot shared;
  final QuizSettingsRobot quizSettingsRobot;
  final CategoriesRobot categoriesRobot;
  final QuizRobot quizRobot;

  Future<void> pumpMyApp() async {
    // * Entry point of the app
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          categoriesListProvider.overrideWith((ref) async {
            return categoryResponseFixture;
          }),
        ],
        child: const AppWidget(),
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> tapOnSettingsIcon() async {
    final finder = find.byType(IconButton);
    expect(finder, findsOneWidget);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }
}
