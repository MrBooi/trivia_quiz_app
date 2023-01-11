import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/core/shared/trivia_app_bar.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/number_of_questions/number_of_questions.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_level/quiz_level.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_type/quiz_question_type.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/settings_action_chip.dart';

class QuizSettingsRobot {
  QuizSettingsRobot(this.tester);
  final WidgetTester tester;

  void foundQuizSettings() {
    final finder = find.text('Quiz Settings');
    final AppBarWidget = find.byType(TriviaAppBar);
    expect(finder, findsOneWidget);
    expect(AppBarWidget, findsOneWidget);
  }

  void expectNumberOfQuestionsFound() {
    final finder = find.text('Select Quiz Question Type');
    final type = find.byType(NumberOfQuestions);
    expect(finder, findsOneWidget);
    expect(type, findsOneWidget);
  }

  Future<void> tapNumberOfQuestions(int total) async {
    final finder = find.byKey(ValueKey('$total'));
    final type = find.byType(SettingActionChip);
    expect(finder, findsOneWidget);
    expect(type, findsWidgets);

    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  void expectQuizQuestionTypeFound() {
    final finder = find.text('Select Total Number of Questions');
    final type = find.byType(QuizQuestionType);
    expect(finder, findsOneWidget);
    expect(type, findsOneWidget);
  }

  Future<void> tapQuizQuestionType(QuizLevelType qType) async {
    final finder = find.byKey(ValueKey(qType.message));
    final type = find.byType(SettingActionChip);
    expect(finder, findsOneWidget);
    expect(type, findsWidgets);

    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  void expectQuizLevelFound() {
    final finder = find.text('Select Quiz Difficulty Level');
    final type = find.byType(QuizLevel);
    expect(finder, findsOneWidget);
    expect(type, findsOneWidget);
  }

  Future<void> tapQuizLevel(Difficulty level) async {
    final finder = find.byKey(ValueKey(level.name));
    final type = find.byType(SettingActionChip);
    expect(finder, findsOneWidget);
    expect(type, findsWidgets);

    await tester.tap(finder);
    await tester.pumpAndSettle();
  }
}
