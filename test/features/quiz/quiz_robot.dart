import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/core/shared/app_button.dart';
import 'package:opentrivia/features/quiz/presentation/widget/question_widget.dart';
import 'package:opentrivia/features/quiz/presentation/widget/quiz_body.dart';
import 'package:opentrivia/features/quiz/presentation/widget/results/quiz_result_widget.dart';

class QuizRobot {
  QuizRobot(this.tester);
  final WidgetTester tester;

  void expectCategoryNameFound(String categoryName) {
    final finder = find.text(categoryName);
    expect(finder, findsOneWidget);
  }

  void expectQuizBodyFound() {
    final finder = find.byType(QuizBody);
    expect(finder, findsOneWidget);
  }

  void expectEmptyTextFound(String text) {
    final finder = find.text(text);
    expect(finder, findsOneWidget);
  }

  void expectQuestionWidgetFound() {
    final finder = find.byType(QuestionWidget);
    expect(finder, findsOneWidget);
  }

  void expectQuizResultsWidgetFound() {
    final finder = find.byType(QuizResultsWidget);
    expect(finder, findsOneWidget);
  }

  void expectTextOfCorrectAnswerFound() {
    final finder = find.byKey(totalCorrectAnswers);
    expect(finder, findsOneWidget);
  }

  void expectNewQuizButtonFound() {
    final finder = find.text('New Quiz');
    final button = find.byType(PrimaryButton);
    expect(finder, findsOneWidget);
    expect(button, findsOneWidget);
  }

  Future<void> tapOnQuizButton() async {
    final finder = find.text('New Quiz');
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }
}
