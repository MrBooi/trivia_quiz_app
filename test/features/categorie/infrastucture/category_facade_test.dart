import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:opentrivia/features/categorie/domain/category_response.dart';
import 'package:opentrivia/features/categorie/infrastucture/category_facade.dart';

import '../../../fixtures/quiz_settings/quiz_settings_fixture.dart';

void main() {
  group('CategoryFacade', () {
    ProviderContainer makeProviderContainer(CategoryResponse categoryResponse) {
      final container = ProviderContainer(overrides: [
        categoriesListProvider.overrideWith((ref) => categoryResponse)
      ]);
      addTearDown(container.dispose);
      return container;
    }

    testWidgets('Should return empty list of categories.', (tester) async {
      final providerContainer =
          makeProviderContainer(emptyCategoryResponseFixture);

      expect(
        providerContainer.read(categoriesListProvider).value,
        emptyCategoryResponseFixture,
      );
    });

    testWidgets('Should return categories list.', (tester) async {
      final providerContainer = makeProviderContainer(categoryResponseFixture);

      expect(
        providerContainer.read(categoriesListProvider).value,
        categoryResponseFixture,
      );
    });
  });
}
