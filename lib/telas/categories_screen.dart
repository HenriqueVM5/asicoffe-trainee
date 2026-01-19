//cria a tela de categorias ou Home


import 'package:assicoffee_app/providers/categories_provider.dart';
import 'package:assicoffee_app/providers/products_provider.dart';
import 'package:assicoffee_app/telas/products_screen.dart';
import 'package:assicoffee_app/widgets/categories_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allcategories = ref.watch(categoriesProvider);

    return Column(
      children: [
        // Área da Lista de categorias
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            //cria grades de categoria
            child: GridView.builder(
              itemCount: allcategories.length, 
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                crossAxisSpacing: 10, 
                mainAxisSpacing: 10, 
              ),
              itemBuilder: (context, index) {
                final categoryItem = allcategories[index];
                return CategoriesCards(
                  categories: categoryItem,
                  onSelctedCategory: () {
                    ref.read(selectedCategoryProvider.notifier).setCategory(categoryItem.type);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductsScreen(title: categoryItem.title),
                      ),
                    );
                  },
                ); //coloca os cards gerados na grade acima passando somente os filtadros
              },
            ),
          ),
        ),
      ],
    );
  }
}
