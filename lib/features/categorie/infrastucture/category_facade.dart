import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:opentrivia/core/infrastructure/http/dio_http_service.dart';
import 'package:opentrivia/core/infrastructure/http/http_service.dart';
import 'package:opentrivia/features/categorie/domain/category_response.dart';
import 'package:opentrivia/features/categorie/domain/i_category_facade.dart';

class CategoryFacade implements ICategoryFacade {
  CategoryFacade(this._httpService);

  final HttpService _httpService;

  @override
  Future<CategoryResponse> getCategories() async {
    // TODO HANDLE ERRORS
    const endpoint = '/api_category.php'; // TODO Move This To config
    final response = await _httpService.get(endpoint);
    return CategoryResponse.fromJson(response);
  }
}

final categoryFacadeProvider = Provider<CategoryFacade>((ref) {
  final httpProvider = ref.watch(httpServiceProvider);
  return CategoryFacade(httpProvider);
});

final categoriesListProvider = FutureProvider<CategoryResponse>((ref) {
  final categoryProvider = ref.watch(categoryFacadeProvider);
  return categoryProvider.getCategories();
});
