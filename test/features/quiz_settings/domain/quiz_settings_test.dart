import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/features/quiz_settings/domain/quiz_settings.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../fixtures/quiz_settings/quiz_settings_fixture.dart';

void main() {
  test('Should be a subclass of QuizSettings Model', () {
    expect(quizSettingsFixture, isA<QuizSettingsModel>());
  });

  group('toJson', () {
    test('Should return a valid model', () {
      // arrange
      final jsonMap = json.decode(
        fixture('quiz_settings/quiz_settings_model.json'),
      );
      //act
      final result = QuizSettingsModel.fromJson(jsonMap);

      // expect
      expect(result, quizSettingsFixture);
    });
  });

  group('toJson', () {
    test('Should return a Json map containing the proper data', () {
      //act
      final result = quizSettingsFixture.toJson();

      final expectedJsonMap = json.decode(
        fixture('quiz_settings/quiz_settings_model.json'),
      );

      // expect
      expect(result, expectedJsonMap);
    });
  });
}
