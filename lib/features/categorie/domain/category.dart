import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

/// * The Category identifier is an important concept and can have its own type.
typedef CategoryID = int;

@freezed
class Category with _$Category {
  const Category._();

  factory Category({
    required CategoryID id,
    required String name,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
