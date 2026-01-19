//dados com definiçoes das categorias

import 'package:assicoffee_app/models/category.dart';
import 'package:assicoffee_app/models/product.dart' as product_model;

List<Category> availableCategories = [
  Category(
    cImageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQERgycmQai437DmrhaiByu6aHEHmVzVatv9A&s',
    title: 'Salgados',
    type: product_model.Category.salgados,
  ),
  Category(
    cImageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnOkP70w2jB9RuIgDya3HGvKijRSNAsIrlQw&s',
    title: 'Doces',
    type: product_model.Category.doces,
  ),
  Category(
    cImageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_fvXeAz5yUPdC0Q13cxdIesoZ8xo4px-cDg&s',
    title: 'Lanches',
    type: product_model.Category.lanches,
  ),
  Category(
    cImageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcETuN9u8qTJNPttiP6gYvSutY8Iq4finuDQ&s',
    title: 'Cafés Quentes',
    type: product_model.Category.cafesQuentes,
  ),
  Category(
    cImageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRugw4eQiQszoGPLSpJT5y5pw8bah-sqNe3hQ&s',
    title: 'Cafés Gelados',
    type: product_model.Category.cafesGelados,
  ),
  Category(
    cImageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUFglt6XQP5eacf2nsFRDIMPVAQaSOTk7kfw&s',
    title: 'Refrigerantes',
    type: product_model.Category.refrigerantes,
  ),
  Category(
    cImageUrl:
        'https://blog.nagumo.com.br/wp-content/uploads/2022/06/receitas-de-sucos-funcionais-imagem-destacada.jpg',
    title: 'Sucos',
    type: product_model.Category.sucos,
  ),
];
