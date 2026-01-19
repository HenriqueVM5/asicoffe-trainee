import 'package:assicoffee_app/data/categories_data.dart';
import 'package:assicoffee_app/models/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//provider categorias para jogar a lista de categorias para um estado global

final categoriesProvider = Provider<List<Category>>((ref) {
  return availableCategories;
});

