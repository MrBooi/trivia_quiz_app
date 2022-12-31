import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:opentrivia/features/categorie/domain/category.dart';
import 'package:opentrivia/features/quiz/presentation/quiz_screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({required this.category, super.key});

  final Category category;

  static const categoryCard = Key('category-card');

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.0, // TODO MOVE THIS CODE TO STYLES
        ),
      ),
      child: InkWell(
        key: categoryCard,
        onTap: () {
          // TODO Migrate route to GoRouter
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => QuizScreen(
                category: category,
              ),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AutoSizeText(
              category.name,
              minFontSize: 10.0,
              textAlign: TextAlign.center,
              maxLines: 3,
              wrapWords: false,
            ),
          ],
        ),
      ),
    );
  }
}
