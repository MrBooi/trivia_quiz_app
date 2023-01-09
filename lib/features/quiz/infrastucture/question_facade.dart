import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/core/infrastructure/http/dio_http_service.dart';
import 'package:opentrivia/core/infrastructure/http/http_service.dart';
import 'package:opentrivia/features/categorie/domain/category.dart';
import 'package:opentrivia/features/quiz/domain/i_question_facade.dart';
import 'package:opentrivia/features/quiz/domain/question.dart';
import 'package:opentrivia/features/quiz_settings/domain/quiz_settings.dart';
import 'package:opentrivia/features/quiz_settings/presentation/quiz_settings_controller.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_type/quiz_question_type.dart';

class QuestionFacade implements IQuestionFacade {
  QuestionFacade(this._httpService);
  final HttpService _httpService;

  @override
  Future<List<Question>> getQuestions({
    required String id,
    required int total,
    required QuizLevelType type,
    String? difficulty,
  }) async {
    const endpoint = '/api.php';
    final response = await _httpService.get(
      endpoint,
      queryParameters: {
        'amount': total,
        'category': id,
        if (difficulty != null) 'difficulty': difficulty,
        'type': type.name
      },
    );

    List<Map<String, dynamic>> questions = List<Map<String, dynamic>>.from(
      response['results'],
    );
    return Question.fromData(questions);
  }
}

final questionFacadeProvider = Provider<QuestionFacade>((ref) {
  final httpProvider = ref.watch(httpServiceProvider);
  return QuestionFacade(httpProvider);
});

final questionQuizProvider = Provider<QuizSettingsModel>((ref) {
  return ref.watch(quizSettingsController);
});

final questionsListProvider = FutureProvider.autoDispose
    .family<List<Question>, CategoryID>((ref, categoryID) {
  final questionFacade = ref.watch(questionFacadeProvider);
  final questionQuiz = ref.watch(questionQuizProvider);

  return questionFacade.getQuestions(
    id: categoryID.toString(),
    total: questionQuiz.total,
    difficulty: questionQuiz.difficulty,
    type: questionQuiz.type,
  );
});
