import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:opentrivia/core/shared/app_circular_icon.dart';
import 'package:opentrivia/core/styles/app_colors.dart';

class QuestionOption extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final bool isCorrect;
  final bool isDisplayingAnswer;
  final VoidCallback onTap;

  const QuestionOption({
    Key? key,
    required this.answer,
    required this.isSelected,
    required this.isCorrect,
    required this.isDisplayingAnswer,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 20.0,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 20.0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            border: Border.all(
              color: isDisplayingAnswer
                  ? isCorrect
                      ? AppColors.primary
                      : isSelected
                          ? Colors.red
                          : AppColors.white
                  : Colors.white,
              width: 3.0,
            ),
            borderRadius: BorderRadius.circular(100.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                HtmlUnescape().convert(answer),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: isDisplayingAnswer && isCorrect
                      ? FontWeight.bold
                      : FontWeight.w400,
                ),
              ),
            ),
            if (isDisplayingAnswer)
              isCorrect
                  ? const AppCircularIcon(
                      icon: Icons.check,
                      color: AppColors.primary,
                    )
                  : isSelected
                      ? const AppCircularIcon(
                          icon: Icons.close,
                          color: Colors.red,
                        )
                      : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
