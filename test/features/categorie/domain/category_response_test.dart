import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/features/categorie/domain/category_response.dart';

import '../../../fixtures/categories/categories_fixtures.dart';
import '../../../fixtures/fixture_reader.dart';

void main() {
  test('Should be a subclass of CategoryResponse Model', () {
    expect(emptyCategoryResponseFixture, isA<CategoryResponse>());
  });

  group('toJson', () {
    test('Should return a valid model', () {
      // arrange
      final jsonMap = json.decode(
        fixture('categories/categories.json'),
      );
      //act
      final result = CategoryResponse.fromJson(jsonMap);

      // expect
      expect(result, categoryResponseFixture);
    });
  });

  group('toJson', () {
    test('Should return a Json map containing the proper data', () {
      //act
      final result = categoryResponseFixture.toJson();

      final expectedJsonMap = json.decode(
        fixture('categories/categories.json'),
      );

      // expect
      expect(result, expectedJsonMap);
    });
  }, skip: true);
}
