import 'package:flutter/material.dart';
import 'package:opentrivia/core/styles/app_colors.dart';
import 'package:opentrivia/features/categorie/presentation/categorie_list/categories_grid.dart';

class CategoriesListScreen extends StatelessWidget {
  const CategoriesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              "Tap on a category to start the quiz.", // TODO Move this to tranlation file
              style: TextStyle(
                // TODO Move style
                color: AppColors.white,
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
        CategoryGrid(),
      ],
    );
  }
}
