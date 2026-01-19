//codigo que cria o card do produto que úsado em diversas telas recebendo como parametro a lista de items filtadras

import 'package:assicoffee_app/models/product.dart';
import 'package:flutter/material.dart';
import 'favorite_button.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final void Function() onSelectedProduct;

  const ProductItem({super.key, required this.product, required this.onSelectedProduct});

  @override
  Widget build(context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return InkWell(
      onTap: onSelectedProduct,
      child: Container(
        //fundo do card
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem do Produto pega da internet atravez da url
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  product.imageUrl,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  //caso a imagem não seja encontrada ou não tenha internet
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color.fromARGB(255, 224, 224, 224),
                      child: Icon(Icons.coffee, size: 50, color: Colors.grey),
                    );
                  },
                ),
                
              ),
            ),
      
            // Informações do Produto
      
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category.toUpperCase(),
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  //Linha com nome do produto
                  Text(
                    product.name,
                    style: textTheme
                        .titleMedium, 
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  // linha com preço e botão favoritar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "R\$ ${product.price.toStringAsFixed(2)}",
                        style: textTheme.labelLarge?.copyWith(
                          color: colorScheme.tertiary,
                        ),
                      ),
                      FavoriteButton(productName: product.name),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
