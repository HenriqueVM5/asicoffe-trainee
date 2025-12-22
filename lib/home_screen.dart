//codigo que gera o background e chama a funçao que gera os cards dos produtos 1 a 1

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data.dart';
import 'product_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // definiçao de cores de Fundo e appBar
    final Color creamColor = const Color.fromARGB(255, 255, 253, 208); // Creme para o fundo
    final Color blueColor = const Color.fromARGB(255, 0, 127, 254); // Azul para appBar

    return Scaffold(
      //cor do fundo
      backgroundColor: creamColor, 
      //configuração da appBar
      appBar: AppBar(
        backgroundColor: blueColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "AsiCoffee",
          style: GoogleFonts.lobster(
            fontSize: 28,
            color: creamColor,//fonte mesma cor do fundo
          ),
        ),
      ),
      body: Column(
        children: [
          // Área da Lista de Produtos 
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
//cria grades de proodutos, builder gera imagens e apaga da memoria conforme aparecem na tela
              child: GridView.builder( 
                itemCount: menuItems.length,//Qtd de itens no data 
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Divide em duas colunas
                  crossAxisSpacing: 10, //Espaço horizontal entre produtos 10px
                  mainAxisSpacing: 10, //Espaço vertical entre produtos 10px
                  childAspectRatio: 0.8, // Proporção altura/largura mais alto para caber imagem e infos
                ),
                itemBuilder: (context, index) {
                  return ProductItem(product: menuItems[index]);//coloca os cards gerados na grade acima
                },
              ),
            ),
          ),

          // Rodapé 
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),//cria borda circular
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/simbolo_asimov.png',
                height: 30,
                ),
                SizedBox(width: 10),
                Text(
                  "Pau na maquina (de café)",
                  style: GoogleFonts.lato(color: creamColor, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
