
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const AsiCoffeeApp());
}

class AsiCoffeeApp extends StatelessWidget {
  const AsiCoffeeApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      title: 'AsiCoffee',
      home: const HomeScreen(),
    );
  }
}