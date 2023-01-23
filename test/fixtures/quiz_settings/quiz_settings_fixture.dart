import 'package:opentrivia/features/quiz_settings/domain/quiz_settings.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_level/quiz_level.dart';
import 'package:opentrivia/features/quiz_settings/presentation/widget/quiz_type/quiz_question_type.dart';

QuizSettingsModel get quizSettingsFixture => QuizSettingsModel(
      difficulty: 'easy',
      total: 10,
      type: QuizLevelType.multiple,
    );

Difficulty get quizDifficulty => Difficulty.easy;
