import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/core/configs/configs.dart';
import 'package:opentrivia/features/quiz_settings/presentation/quiz_settings_controller.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_level/quiz_level.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_type/quiz_question_type.dart';

import '../../../fixtures/quiz_settings/quiz_settings_fixture.dart';

void main() {
  late QuizSettingsController quizSetting;

  group('QuizSettingsController', () {
    ProviderContainer makeProviderContainer() {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      return container;
    }

    setUp(() {
      quizSetting = QuizSettingsController();
    });

    test('should updated quiz difficulty from easy to hard.', () {
      const mockQuizLevel = Difficulty.hard;
      final container = makeProviderContainer();

      container.read(quizSettingsController.notifier).updateDifficulty(
            mockQuizLevel,
          );

      expect(
        container.read(quizSettingsController),
        quizSettingsFixture.copyWith(
          difficulty: mockQuizLevel.name,
        ),
      );
    });

    test('should updated quiz number of questions from 10 to 50.', () {
      final mockNumberOfQuestions = Configs.totalNumberOfQuiz.last;
      final container = makeProviderContainer();

      container.read(quizSettingsController.notifier).updateNumberOfQuestions(
            mockNumberOfQuestions,
          );

      expect(
        container.read(quizSettingsController),
        quizSettingsFixture.copyWith(
          total: mockNumberOfQuestions,
        ),
      );
    });

    test('should updated quiz Type from multiple to boolean.', () {
      const mockQuizType = QuizLevelType.boolean;
      final container = makeProviderContainer();

      container.read(quizSettingsController.notifier).updateQuestionType(
            mockQuizType,
          );

      expect(
        container.read(quizSettingsController),
        quizSettingsFixture.copyWith(type: mockQuizType),
      );
    });
  });
  group('QuizQuestionTypeProvider', () {
    ProviderContainer makeProviderContainer(Difficulty difficulty) {
      final container = ProviderContainer(
        overrides: [
          quizQuestionTypeProvider.overrideWithValue(difficulty),
        ],
      );

      addTearDown(container.dispose);
      return container;
    }

    test('should return Difficulty.hard.', () {
      final providerContainer = makeProviderContainer(Difficulty.hard);

      expect(providerContainer.read(quizQuestionTypeProvider), Difficulty.hard);
    });

    test(' should not return Difficulty.hard.', () {
      final providerContainer = makeProviderContainer(Difficulty.hard);

      expect(
        providerContainer.read(quizQuestionTypeProvider),
        isNot(
          Difficulty.easy,
        ),
      );
    });
  });

  group('quizLevelProvider', () {
    ProviderContainer makeProviderContainer(QuizLevelType levelType) {
      final container = ProviderContainer(
        overrides: [
          quizLevelProvider.overrideWithValue(levelType),
        ],
      );

      addTearDown(container.dispose);
      return container;
    }

    test('should return QuizLevelType.multiple.', () {
      final providerContainer = makeProviderContainer(QuizLevelType.multiple);

      expect(
        providerContainer.read(quizLevelProvider),
        QuizLevelType.multiple,
      );
    });

    test('should not return QuizLevelType.boolean.', () {
      final providerContainer = makeProviderContainer(QuizLevelType.multiple);

      expect(
        providerContainer.read(quizLevelProvider),
        isNot(
          QuizLevelType.boolean,
        ),
      );
    });
  });
}
