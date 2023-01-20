import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/features/quiz/presentation/controller/quiz_controller.dart';
import 'package:opentrivia/features/quiz/presentation/widget/results/quiz_result_widget.dart';

import '../../../../../fixtures/quiz/question_fixture.dart';
import '../../../../../robot.dart';

void main() {
  group('QuizResultsWidget', () {
    testWidgets('should render quiz result widget.', (tester) async {
      final r = Robot(tester);
      await r.pumpEntryForSingleWidget(
        overrides: [
          quizControllerProvider.overrideWith((ref) {
            return QuizController();
          }),
        ],
        QuizResultsWidget(
          questions: questionsFixture,
        ),
      );

      r.quizRobot.expectQuizResultsWidgetFound();
      r.quizRobot.expectTextOfCorrectAnswerFound();
      r.quizRobot.expectNewQuizButtonFound();
    });

    testWidgets('should tap on Quiz new Button.', (tester) async {
      final r = Robot(tester);
      await r.pumpEntryForSingleWidget(
        overrides: [
          quizControllerProvider.overrideWith((ref) {
            return QuizController();
          }),
        ],
        QuizResultsWidget(
          questions: questionsFixture,
        ),
      );

      r.quizRobot.expectQuizResultsWidgetFound();
      r.quizRobot.expectTextOfCorrectAnswerFound();
      r.quizRobot.expectNewQuizButtonFound();
      await r.quizRobot.tapOnQuizButton();
    });
  });
}
