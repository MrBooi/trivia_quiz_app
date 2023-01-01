import 'package:opentrivia/features/quiz/domain/question.dart';

abstract class IQuestionFacade {
  Future<List<Question>> getQuestions({
    required String id,
    required int total,
    required String difficulty,
  });
}
