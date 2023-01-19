import 'package:flutter_test/flutter_test.dart';
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
}
