import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/features/categorie/presentation/categorie_list/category_card.dart';

class CategoriesRobot {
  CategoriesRobot(this.tester);
  final WidgetTester tester;

  void expectLoadingIndicatorFound() {
    final finder = find.byType(CircularProgressIndicator);
    expect(finder, findsOneWidget);
  }

  void expectCategoryMainTextFound() {
    final finder = find.text('Tap on a category to start the quiz.');
    expect(finder, findsOneWidget);
  }

  void expectCategoriesFound() {
    final finder = find.byType(CategoryCard);
    expect(finder, findsWidgets);
  }

  void expectCategoriesNotFound() {
    final finder = find.text('No categories found');
    expect(finder, findsOneWidget);
  }

  Future<void> tapCategoryItem(String categoryId) async {
    final finder = find.byKey(ValueKey(categoryId));
    await tester.ensureVisible(finder);
    await tester.tap(finder);
  }
}
