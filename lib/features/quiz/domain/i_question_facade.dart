import 'package:opentrivia/features/quiz/domain/question.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_type/quiz_question_type.dart';

abstract class IQuestionFacade {
  Future<List<Question>> getQuestions({
    required String id,
    required int total,
    required String difficulty,
    required QuizLevelType type,
  });
}
