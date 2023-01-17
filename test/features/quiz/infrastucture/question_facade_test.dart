import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:opentrivia/core/infrastructure/http/dio_http_service.dart';
import 'package:opentrivia/features/quiz/infrastucture/question_facade.dart';
import 'package:opentrivia/features/quiz_settings/domain/quiz_settings.dart';
import 'package:opentrivia/features/quiz_settings/presentation/quiz_settings_controller.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_level/quiz_level.dart';

import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_type/quiz_question_type.dart';

import '../../../fixtures/quiz_settings/quiz_settings_fixture.dart';
import '../../../mocks/core_mocks.dart';

void main() {
  late MockDioHttpService httpServiceMock;
  late QuestionFacade questionFacade;

  ProviderContainer makeProviderContainer() {
    final container = ProviderContainer(
      overrides: [
        questionFacadeProvider.overrideWith((ref) {
          final httpProvider = ref.read(httpServiceProvider);
          return QuestionFacade(httpProvider);
        }),
        questionQuizProvider.overrideWith((ref) {
          return ref.watch(quizSettingsController);
        }),
        questionsListProvider.overrideWith((ref, categoryID) {
          final questionFacade = ref.watch(questionFacadeProvider);
          final questionQuiz = ref.watch(questionQuizProvider);
          return questionFacade.getQuestions(
            id: categoryID.toString(),
            total: questionQuiz.total,
            difficulty: questionQuiz.difficulty,
            type: questionQuiz.type,
          );
        }),
      ],
    );

    addTearDown(container.dispose);
    return container;
  }

  setUp(() {
    httpServiceMock = MockDioHttpService();
    questionFacade = QuestionFacade(httpServiceMock);
  });

  test('getQuestions returns a list of questions', () async {
    final response = {
      'results': [
        {
          'category': 'General Knowledge',
          'type': 'multiple',
          'difficulty': 'easy',
          'question': 'What is the capital of France?',
          'correct_answer': 'Paris',
          'incorrect_answers': ['London', 'Madrid', 'Rome'],
        },
        {
          'category': 'General Knowledge',
          'type': 'multiple',
          'difficulty': 'easy',
          'question': 'What is the capital of Italy?',
          'correct_answer': 'Rome',
          'incorrect_answers': ['Paris', 'Madrid', 'London'],
        },
      ],
    };

    when(() => httpServiceMock.get(
          '/api.php',
          queryParameters: {
            'amount': 10,
            'category': '9',
            'difficulty': 'easy',
            'type': 'multiple',
          },
        )).thenAnswer((_) async => response);

    final questions = await questionFacade.getQuestions(
      id: '9',
      total: 10,
      difficulty: 'easy',
      type: QuizLevelType.multiple,
    );

    expect(questions, hasLength(2));
    expect(questions[0].question, 'What is the capital of France?');
    expect(questions[0].correctAnswer, 'Paris');
    expect(questions[0].incorrectAnswers, ['London', 'Madrid', 'Rome']);
    expect(questions[1].question, 'What is the capital of Italy?');
    expect(questions[1].correctAnswer, 'Rome');
    expect(questions[1].incorrectAnswers, ['Paris', 'Madrid', 'London']);
  });

  test(
    'questionFacadeProvider returns a QuestionFacade',
    () async {
      final providerContainer = makeProviderContainer();

      expect(
        providerContainer.read(questionFacadeProvider),
        isA<QuestionFacade>(),
      );
    },
  );

  test('questionQuizProvider returns a QuizSettingsModel', () async {
    final providerContainer = makeProviderContainer();
    final quizSettings = quizSettingsFixture;
    final quizSettingsController = QuizSettingsController();
    quizSettingsController.updateDifficulty(Difficulty.easy);
    quizSettingsController.updateNumberOfQuestions(quizSettings.total);
    quizSettingsController.updateQuestionType(quizSettings.type);

    final questionQuiz = providerContainer.read(questionQuizProvider);

    expect(questionQuiz, isA<QuizSettingsModel>());
    expect(questionQuiz.total, 10);
    expect(questionQuiz.difficulty, 'easy');
    expect(questionQuiz.type, QuizLevelType.multiple);
  });

  // test('questionsListProvider returns a list of questions', () async {
  //   final providerContainer = makeProviderContainer();
  //   final response = {
  //     'results': [
  //       {
  //         'category': 'General Knowledge',
  //         'type': 'multiple',
  //         'difficulty': 'easy',
  //         'question': 'What is the capital of France?',
  //         'correct_answer': 'Paris',
  //         'incorrect_answers': ['London', 'Madrid', 'Rome'],
  //       },
  //       {
  //         'category': 'General Knowledge',
  //         'type': 'multiple',
  //         'difficulty': 'easy',
  //         'question': 'What is the capital of Italy?',
  //         'correct_answer': 'Rome',
  //         'incorrect_answers': ['Paris', 'Madrid', 'London'],
  //       },
  //     ],
  //   };
  //   when(() => httpServiceMock.get(
  //         '/api.php',
  //         queryParameters: {
  //           'amount': 10,
  //           'category': 9,
  //           'difficulty': 'easy',
  //           'type': 'multiple',
  //         },
  //       )).thenAnswer((_) async => response);

  //   when(() => questionFacade.getQuestions(
  //         id: '9',
  //         total: 10,
  //         difficulty: 'easy',
  //         type: QuizLevelType.multiple,
  //       )).thenAnswer(
  //     (_) async {
  //       // final questions = List<Map<String, dynamic>>.from(
  //       //   response['results'] as Map<String, dynamic>,
  //       // );
  //       return Question.fromData(response['results']!);
  //     },
  //   );

  //   final quizSettings = quizSettingsFixture;
  //   final quizSettingsController = QuizSettingsController();
  //   quizSettingsController.updateDifficulty(Difficulty.easy);
  //   quizSettingsController.updateNumberOfQuestions(quizSettings.total);
  //   quizSettingsController.updateQuestionType(quizSettings.type);

  //   final questions = await providerContainer.read(
  //     questionsListProvider(9).future,
  //   );

  //   expect(questions, hasLength(2));

  //   expect(questions[0].question, 'What is the capital of France?');
  //   expect(questions[0].correctAnswer, 'Paris');
  //   expect(questions[0].incorrectAnswers, ['London', 'Madrid', 'Rome']);
  //   expect(questions[1].question, 'What is the capital of Italy?');
  //   expect(questions[1].correctAnswer, 'Rome');
  //   expect(questions[1].incorrectAnswers, ['Paris', 'Madrid', 'London']);
  // });
}
