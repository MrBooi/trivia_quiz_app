import 'package:flutter/material.dart';
import 'package:opentrivia/core/styles/app_colors.dart';
import 'package:opentrivia/core/styles/app_text_styles.dart';
import 'package:opentrivia/core/styles/text_theme.dart';

class AppThemes {
  // app theme data setup
  static ThemeData get appTheme {
    return ThemeData(
      primaryColor: AppColors.getMaterialColorFromColor(AppColors.primary),
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
      ),
      backgroundColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.white,
      textTheme: TextThemes.textTheme,
      primaryTextTheme: TextThemes.primaryTextTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.primary,
        titleTextStyle: AppTextStyles.h2,
      ),
    );
  }
}
