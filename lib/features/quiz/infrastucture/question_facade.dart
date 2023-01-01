import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/core/infrastructure/http/dio_http_service.dart';
import 'package:opentrivia/core/infrastructure/http/http_service.dart';
import 'package:opentrivia/features/categorie/domain/category.dart';
import 'package:opentrivia/features/quiz/domain/i_question_facade.dart';
import 'package:opentrivia/features/quiz/domain/question.dart';
import 'package:opentrivia/features/quiz_settings/domain/quiz_settings.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/number_of_questions/number_of_questions_controller.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_level/quiz_level.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_level/quiz_level_controller.dart';

class QuestionFacade implements IQuestionFacade {
  QuestionFacade(this._httpService);
  final HttpService _httpService;

  @override
  Future<List<Question>> getQuestions({
    required String id,
    required int total,
    String? difficulty,
  }) async {
    // TODO Hanlde Errors
    const endpoint = '/api.php'; // TODO Move This To config
    final response = await _httpService.get(
      endpoint,
      queryParameters: {
        'amount': total,
        'category': id,
        if (difficulty != null) 'difficulty': difficulty
      },
    );

    List<Map<String, dynamic>> questions = List<Map<String, dynamic>>.from(
      response["results"],
    );
    return Question.fromData(questions);
  }
}

final questionFacadeProvider = Provider<QuestionFacade>((ref) {
  final httpProvider = ref.watch(httpServiceProvider);
  return QuestionFacade(httpProvider);
});

final questionQuizProvider = Provider<QuizSettingsModel>((ref) {
  final quizLevel = ref.watch(quizLevelController);
  final totalQuestions = ref.watch(numberOfQuestionsController);
  return QuizSettingsModel(
    difficulty: quizLevel == Difficulty.any ? null : quizLevel.name,
    total: totalQuestions,
  );
});

final questionsListProvider =
    FutureProvider.family<List<Question>, CategoryID>((ref, categoryID) {
  final questionFacade = ref.watch(questionFacadeProvider);
  final questionQuiz = ref.watch(questionQuizProvider);

  return questionFacade.getQuestions(
    id: categoryID.toString(),
    total: questionQuiz.total,
    difficulty: questionQuiz.difficulty,
  );
});

final questionOptionsProvider =
    Provider.family<List<String>, CategoryID>((ref, categoryID) {
  final questions = ref.watch(questionsListProvider(categoryID)).value;
  late List<String> options;
  if (questions != null) {
    final question = questions[0]; // update provider

    print(question.type);

    options = [...question.incorrectAnswers];
    if (!options.contains(question.correctAnswer)) {
      options.add(question.correctAnswer);
      options.shuffle();
    }
  } else {
    options = [];
  }

  return options;
});
