//definiçao da classe produto 

enum Category{
  salgados,
  doces,
  lanches,
  cafesQuentes,
  cafesGelados,
  refrigerantes,
  sucos,
}

class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String category;
  final String description;
  final DateTime date;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Category categories;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.description,
    required this.date,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.categories,
  });
}