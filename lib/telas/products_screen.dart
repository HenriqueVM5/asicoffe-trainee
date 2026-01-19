//codiigo que gera a tela com os cards de produtos dentro de cafa categoria

import 'package:assicoffee_app/providers/products_provider.dart'; 
import 'package:assicoffee_app/telas/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/product_item.dart';

class ProductsScreen extends ConsumerWidget {
  const ProductsScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentProducts = ref.watch(filteredProductsProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    //definição de content em caso de a categoria estar vazia
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search_off,
            size: 60,
            color: colorScheme.errorContainer.withValues(alpha: 0.5),
          ),
          const SizedBox(height: 16),
          Text(
            'Ops... nada por aqui!',
            style: theme.textTheme.headlineLarge!.copyWith(
              color: colorScheme.errorContainer,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tente selecionar outra categoria.',
            style: theme.textTheme.bodyLarge!.copyWith(
              color: colorScheme.errorContainer,
            ),
          ),
        ],
      ),
    );

    //content se a lista possuir algo
    if (currentProducts.isNotEmpty) {
      content = Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: currentProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return ProductItem(
              product: currentProducts[index],
              onSelectedProduct: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(product: currentProducts[index]),
                  ),
                );
              },
            );
          },
        ),
      );
    }

    //return apos verificação
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}