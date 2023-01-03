import 'package:flutter/material.dart';
import 'package:opentrivia/core/styles/app_themes.dart';
import 'package:opentrivia/features/home/presentation/home.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trivia Quiz',
      theme: AppThemes.appTheme,
      home: const HomePage(),
    );
  }
}
