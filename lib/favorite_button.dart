//codigo que cria o botão de favoitar que é um foguetinho q fica azul quando favoritado

import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  // Estado local para controlar se está favoritado
  bool isFavorited = false;

  @override
  Widget build(context) {
    return IconButton(
      icon: Icon(
        Icons.rocket_launch,
        color: isFavorited ? Color.fromARGB(255, 0, 127, 254) : Colors.grey,
      ),
      onPressed: () {
        // setState reconstrói o widget invertendo o valor ao clicar no botão
        setState(() {
          isFavorited = !isFavorited;
        });
      },
    );
  }
}