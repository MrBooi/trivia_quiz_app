import 'package:flutter/material.dart';
import 'package:opentrivia/core/styles/app_colors.dart';
import 'package:opentrivia/core/styles/app_text_styles.dart';

class TextThemes {
  /// Main text theme
  static TextTheme get textTheme {
    return const TextTheme(
      headline1: AppTextStyles.h1,
      headline2: AppTextStyles.h2,
      headline3: AppTextStyles.h3,
      headline4: AppTextStyles.h4,
    );
  }

  /// Primary text theme
  /// Uses [AppColors.primary] for all text styles
  static TextTheme get primaryTextTheme {
    return TextTheme(
      headline1: AppTextStyles.h1.copyWith(color: AppColors.primary),
      headline2: AppTextStyles.h2.copyWith(color: AppColors.primary),
      headline3: AppTextStyles.h3.copyWith(color: AppColors.primary),
      headline4: AppTextStyles.h4.copyWith(color: AppColors.primary),
    );
  }
}
