import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/features/categorie/infrastucture/category_facade.dart';
import 'package:opentrivia/features/quiz/infrastucture/question_facade.dart';
import 'package:opentrivia/features/quiz/presentation/quiz_screen.dart';

import '../../../fixtures/categories/categories_fixtures.dart';
import '../../../fixtures/quiz/question_fixture.dart';
import '../../../robot.dart';

void main() {
  final mockCategory = categoryFixture.copyWith(id: 27, name: 'Animals');
  testWidgets('Should verify that we are on Quiz Screen.', (tester) async {
    final r = Robot(tester);
    await r.pumpEntryForSingleWidget(
      overrides: [
        categoriesListProvider.overrideWith((ref) async {
          return categoryResponseFixture;
        }),
        questionsListProvider.overrideWith((ref, arg) {
          return questionsFixture;
        })
      ],
      QuizScreen(
        category: mockCategory,
      ),
    );

    r.quizRobot.expectCategoryNameFound(mockCategory.name);
    r.quizRobot.expectQuizBodyFound();
    r.quizRobot.expectQuestionWidgetFound();
  });

  testWidgets('Should return message if no questions found.', (tester) async {
    final r = Robot(tester);
    await r.pumpEntryForSingleWidget(
      overrides: [
        categoriesListProvider.overrideWith((ref) async {
          return categoryResponseFixture;
        }),
        questionsListProvider.overrideWith((ref, arg) {
          return [];
        })
      ],
      QuizScreen(
        category: mockCategory,
      ),
    );

    r.quizRobot.expectCategoryNameFound(mockCategory.name);
    r.quizRobot.expectQuizBodyFound();
    r.quizRobot.expectEmptyTextFound(
      'Please update your settings, we could not find trivia questions.',
    );
  });

  // testWidgets('Should return error widget if API fails..', (tester) async {
  //   final r = Robot(tester);
  //   await r.shared.pumpEntryForSharedWidgets(
  //     overrides: [
  //       categoriesListProvider.overrideWith((ref) async {
  //         return categoryResponseFixture;
  //       }),
  //       questionsListProvider.overrideWith(
  //         (ref, arg) => ref.future,
  //       )
  //     ],
  //     QuizScreen(
  //       category: mockCategory,
  //     ),
  //   );

  //   r.quizRobot.expectCategoryNameFound(mockCategory.name);
  //   r.quizRobot.expectQuizBodyFound();
  //   r.quizRobot.expectEmptyTextFound(
  //     'Please update your settings, we could not find trivia questions.',
  //   );
  // });
}
