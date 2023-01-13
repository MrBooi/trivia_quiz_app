import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/features/categorie/domain/category.dart';

import '../../../fixtures/categories/categories_fixtures.dart';
import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Should be a subclass of Category Model', () {
    expect(categoryFixture, isA<Category>());
  });

  group('toJson', () {
    test('Should return a valid model', () {
      // arrange
      final jsonMap = json.decode(
        fixture('categories/category.json'),
      );
      //act
      final result = Category.fromJson(jsonMap);

      // expect
      expect(result, categoryFixture);
    });
  });

  group('toJson', () {
    test('Should return a Json map containing the proper data', () {
      //act
      final result = categoryFixture.toJson();

      final expectedJsonMap = json.decode(
        fixture('categories/category.json'),
      );

      // expect
      expect(result, expectedJsonMap);
    });
  });
}
