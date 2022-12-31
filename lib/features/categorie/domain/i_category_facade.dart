import 'package:opentrivia/features/categorie/domain/category_response.dart';

abstract class ICategoryFacade {
  Future<CategoryResponse> getCategories();
}
