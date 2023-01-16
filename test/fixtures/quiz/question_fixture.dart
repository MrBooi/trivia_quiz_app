import 'package:opentrivia/features/quiz/domain/question.dart';

List<Question> get questionsFixture => [
      Question(
        categoryName: 'Animals',
        type: 'multiple',
        difficulty: 'medium',
        question:
            'The now extinct species &quot;Thylacine&quot; was native to where?',
        correctAnswer: 'Tasmania, Australia',
        incorrectAnswers: [
          'Baluchistan, Pakistan',
          'Wallachia, Romania',
          'Oregon, United States'
        ],
        options: [
          'Wallachia, Romania',
          'Tasmania, Australia',
          'Baluchistan, Pakistan',
          'Oregon, United States',
        ],
      ),
      Question(
        categoryName: 'Animals',
        type: 'multiple',
        difficulty: 'medium',
        question: 'What are rhino\'s horn made of?',
        correctAnswer: 'Keratin',
        incorrectAnswers: ['Bone', 'Ivory', 'Skin'],
        options: ['Bone', 'Keratin', 'Ivory', 'Skin'],
      ),
      Question(
        categoryName: 'Animals',
        type: 'multiple',
        difficulty: 'medium',
        question: 'Cashmere is the wool from which kind of animal?',
        correctAnswer: 'Goat',
        incorrectAnswers: ['Sheep', 'Camel', 'Llama'],
        options: ['Sheep', 'Camel', 'Goat', 'Llama'],
      )
    ];
