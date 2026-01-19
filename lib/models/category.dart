//classe que define as categorias

import 'package:assicoffee_app/models/product.dart' as product_model;

class Category {
  const Category({
    required this.cImageUrl,
    required this.title,
    required this.type,
  });

  final String cImageUrl;
  final String title;
  final product_model.Category type;
}