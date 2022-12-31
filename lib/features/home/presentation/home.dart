import 'package:flutter/material.dart';
import 'package:opentrivia/core/shared/trivia_app_bar.dart';
import 'package:opentrivia/core/shared/wave_clipper_widget.dart';
import 'package:opentrivia/features/categorie/presentation/categories_list_screen.dart';
import 'package:opentrivia/features/quiz_settings/presentation/quiz_settings_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TriviaAppBar(
        title: 'Open Trivia Quiz',
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO Migrate route to GoRouter
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const QuizSettingsScreen(),
                ),
              );
            },
          )
        ],
      ),
      body: Stack(
        children: const [
          WaveClipperWidget(),
          CategoriesListScreen(),
        ],
      ),
    );
  }
}
