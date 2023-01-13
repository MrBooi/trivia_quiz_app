import 'package:opentrivia/features/categorie/domain/category.dart';
import 'package:opentrivia/features/categorie/domain/category_response.dart';

Category get categoryFixture => Category(id: 9, name: 'General');

List<Category> get categories => [
      Category(id: 9, name: 'General'),
      Category(id: 10, name: 'Books'),
      Category(id: 11, name: 'Film'),
      Category(id: 12, name: 'Music'),
      Category(id: 13, name: 'Musicals'),
      Category(id: 14, name: 'Television'),
      Category(id: 15, name: 'Video game'),
      Category(id: 16, name: 'Board game'),
      Category(id: 17, name: 'Science'),
      Category(id: 18, name: 'Computers'),
      Category(id: 19, name: 'Maths'),
      Category(id: 20, name: 'Mythology'),
      Category(id: 21, name: 'Sports'),
      Category(id: 22, name: 'Geography'),
      Category(id: 23, name: 'History'),
      Category(id: 24, name: 'Politics'),
      Category(id: 25, name: 'Art'),
      Category(id: 26, name: 'Celebrities'),
      Category(id: 27, name: 'Animals'),
      Category(id: 28, name: 'Vehicles'),
      Category(id: 29, name: 'Comics'),
      Category(id: 30, name: 'Gadgets'),
      Category(id: 31, name: 'Anime'),
      Category(id: 32, name: 'Cartoons'),
    ];

CategoryResponse get categoryResponseFixture => CategoryResponse(
      triviaCategories: categories,
    );

CategoryResponse get emptyCategoryResponseFixture => CategoryResponse(
      triviaCategories: [],
    );
