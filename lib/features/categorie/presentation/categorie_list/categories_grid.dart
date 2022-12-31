import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/core/shared/async_value_widget.dart';
import 'package:opentrivia/features/categorie/domain/category_response.dart';
import 'package:opentrivia/features/categorie/infrastucture/category_facade.dart';
import 'package:opentrivia/features/categorie/presentation/categorie_list/category_card.dart';

class CategoryGrid extends ConsumerWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryList = ref.watch(categoriesListProvider);

    return AsyncValueSliverWidget<CategoryResponse>(
      value: categoryList,
      data: (categories) => categories.triviaCategories.isEmpty
          ? SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'No categories found', // TODO Move to Translation file
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            )
          : SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: categories.triviaCategories.length,
                  (_, idx) {
                    final category = categories.triviaCategories[idx];
                    return CategoryCard(
                      category: category,
                    );
                  },
                ),
              ),
            ),
    );
  }
}
