import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:opentrivia/features/categorie/domain/category.dart';

part 'category_response.freezed.dart';
part 'category_response.g.dart';

@freezed
class CategoryResponse with _$CategoryResponse {
  const CategoryResponse._();
  factory CategoryResponse({
    @JsonKey(name: 'trivia_categories')
        required List<Category> triviaCategories,
  }) = _CategoryResponse;

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
}
