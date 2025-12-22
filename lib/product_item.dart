//codigo que cria o card do produto

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data.dart';
import 'favorite_button.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(context) {
    // Definiçao de cor para escrita do nome do item
    final Color blueColor = const Color.fromARGB(255,31,61,143,); // Azul Escuro

    return Container(
      //fundo do card
      decoration: BoxDecoration(
        color: Colors.white,
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
          //linha com nome categoria do produto
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.category.toUpperCase(),
                  style: TextStyle(
                    color: const Color.fromARGB(255, 239, 108, 0),
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 2),
                //Linha com nome do produto
                Text(
                  product.name,
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: blueColor,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                // linha com preço e botão favoritar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "R\$ ${product.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.green[700],
                      ),
                    ),
                    FavoriteButton(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
