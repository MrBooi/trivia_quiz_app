import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/features/quiz/domain/question.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../fixtures/quiz/question_fixture.dart';

void main() {
  test('Should be a subclass of Question Model', () {
    expect(questionsFixture[0], isA<Question>());
  });

  group('toJson', () {
    test('Should return a valid model', () {
      // arrange
      final jsonMap = json.decode(
        fixture('quiz/question.json'),
      )['results'];

      //act
      final result = Question.fromJson(jsonMap[0]);

      // expect
      expect(result.question, questionsFixture[0].question);
    });
  });

  group('toJson', () {
    test('Should return a Json map containing the proper data', () {
      //act
      final result = questionsFixture[0].toJson();
      result.remove('options');

      final expectedJsonMap = json.decode(
        fixture('quiz/question.json'),
      );

      // expect
      expect(result, expectedJsonMap['results'][0]);
    });
  });
}
