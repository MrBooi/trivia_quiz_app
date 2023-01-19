import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/features/quiz/presentation/controller/quiz_controller.dart';
import 'package:opentrivia/features/quiz/presentation/controller/quiz_state.dart';

import '../../../../fixtures/quiz/question_fixture.dart';

void main() {
  group('QuizController', () {
    ProviderContainer makeProviderContainer() {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      return container;
    }

    test(
      'Submit incorrect Answer.',
      () {
        final container = makeProviderContainer();

        container
            .read(quizControllerProvider.notifier)
            .submitAnswer(questionsFixture[0], 'incorrect');

        expect(
          container.read(quizControllerProvider).status,
          QuizStatus.incorrect,
        );

        expect(
          container.read(quizControllerProvider).incorrect.length,
          1,
        );
      },
    );

    test(
      'Submit correct Answer.',
      () {
        final container = makeProviderContainer();

        container
            .read(quizControllerProvider.notifier)
            .submitAnswer(questionsFixture[0], 'Tasmania, Australia');

        expect(
          container.read(quizControllerProvider).status,
          QuizStatus.correct,
        );
        expect(
          container.read(quizControllerProvider).correct.length,
          1,
        );
      },
    );

    test(
      'should return [QuizStatus.initial] if quiz is not yet completed.',
      () {
        final container = makeProviderContainer();

        container
            .read(quizControllerProvider.notifier)
            .nextQuestion(questionsFixture, 1);

        expect(
          container.read(quizControllerProvider).status,
          QuizStatus.initial,
        );
        expect(
          container.read(quizControllerProvider).selectedAnswer,
          '',
        );
      },
    );

    test(
      'should return [QuizStatus.completed] if quiz user have completed all the questions.',
      () {
        final container = makeProviderContainer();

        container
            .read(quizControllerProvider.notifier)
            .nextQuestion(questionsFixture, questionsFixture.length);

        expect(
          container.read(quizControllerProvider).status,
          QuizStatus.completed,
        );
        expect(
          container.read(quizControllerProvider).selectedAnswer,
          '',
        );
      },
    );

    test(
      'should clear state and start new quiz.',
      () {
        final container = makeProviderContainer();

        container.read(quizControllerProvider.notifier).newQuiz();
        final results = container.read(quizControllerProvider);

        expect(
          container.read(quizControllerProvider).status,
          QuizStatus.initial,
        );
        expect(
          container.read(quizControllerProvider).selectedAnswer,
          '',
        );
        expect(
          container.read(quizControllerProvider).correct,
          [],
        );
        expect(
          container.read(quizControllerProvider).incorrect,
          [],
        );
      },
    );

    test(
      'quizControllerProvider returns a QuizState',
      () async {
        final providerContainer = makeProviderContainer();

        expect(
          providerContainer.read(quizControllerProvider),
          isA<QuizState>(),
        );
      },
    );
  });
}
