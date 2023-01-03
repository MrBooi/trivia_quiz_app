import 'package:flutter/material.dart';
import 'package:opentrivia/core/shared/trivia_app_bar.dart';
import 'package:opentrivia/core/shared/wave_clipper_widget.dart';
import 'package:opentrivia/features/categorie/domain/category.dart';
import 'package:opentrivia/features/quiz/presentation/widget/quiz_body.dart';

class QuizScreen extends StatelessWidget {
  final Category category;
  const QuizScreen({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TriviaAppBar(
        title: category.name,
      ),
      body: Stack(
        children: [
          const WaveClipperWidget(),
          QuizBody(
            id: category.id,
          ),
        ],
      ),
    );
  }
}
