//codigo main roda o app e define os temas e cores padrão

import 'package:assicoffee_app/telas/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {
    runApp(const ProviderScope(child: AsiCoffeeApp()));
  });
}
class AsiCoffeeApp extends StatelessWidget {
  const AsiCoffeeApp({super.key});

  @override
  Widget build(context) {
    // Kcolors tema claro
    const kCreamColor = Color.fromARGB(255, 255, 253, 208);
    const kBlueColor = Color.fromARGB(255, 0, 127, 254);
    const kDarkBlueColor = Color.fromARGB(255, 31, 61, 143);
    const kOrangeColor = Color.fromARGB(255, 239, 108, 0);
    final kGreenColor = Colors.green[700]!;
    // Kcolors tema escuro
    const kDarkBackground = Color.fromARGB(255, 18, 18, 18);
    const kDarkCardColor = Color.fromARGB(255, 44, 44, 44);
    final kLightGreenColor = Colors.greenAccent[400]!;

    return MaterialApp(
      title: 'AsiCoffee',
      home: const TabsScreen(),
      themeMode: ThemeMode.system,
      //tema claro
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light, //avisar o sitema que o tema é claro
        colorScheme: ColorScheme.fromSeed(
          seedColor: kBlueColor,
          brightness: Brightness.light,
          primary: kBlueColor, // Cor principal
          onPrimary: kCreamColor, // cor texto sobre a cor principal
          surface: kCreamColor, // Cor de fundo das telas
          onSurface: kDarkBlueColor, // Cor texto sobre o fundo
          secondary: kOrangeColor, // Cor Categorias
          tertiary: kGreenColor, // Cor Preços
          surfaceContainer: Colors.white,
        ),
        textTheme: TextTheme(
          // Títulos principais
          displayLarge: GoogleFonts.lobster(fontSize: 28, color: kCreamColor),
          // Títulos de Cards
          titleMedium: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: kDarkBlueColor,
          ),
          // Corpo
          bodyMedium: GoogleFonts.lato(fontSize: 14, color: kDarkBlueColor),
          // Textos pequenos
          labelSmall: GoogleFonts.lato(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            color: kOrangeColor,
          ),
          // Preços
          labelLarge: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: kGreenColor,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: kBlueColor,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: GoogleFonts.lobster(fontSize: 28, color: kCreamColor),
          iconTheme: const IconThemeData(color: kCreamColor),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: kBlueColor,
          selectedItemColor: kCreamColor,
          unselectedItemColor: kCreamColor.withValues(alpha: 0.5),
        ),
      ),
      // Tema escuro
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark, //avisar o sitema que o tema é escuro
        colorScheme: ColorScheme.fromSeed(
          seedColor: kBlueColor,
          brightness: Brightness.dark,
          primary: kBlueColor, // mesmo azul
          onPrimary: Colors.white,
          surface: kDarkBackground, // Fundo Preto
          surfaceContainer: kDarkCardColor, // Cor dos Cards
          onSurface: kCreamColor, // Texto Creme
          secondary: kOrangeColor, //cor categorias
          tertiary: kLightGreenColor, // cor preço
        ),
        textTheme: TextTheme(
          displayLarge: GoogleFonts.lobster(fontSize: 28, color: kCreamColor),
          titleMedium: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          bodyMedium: GoogleFonts.lato(fontSize: 14),
          labelSmall: GoogleFonts.lato(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            color: kOrangeColor,
          ),
          labelLarge: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: kLightGreenColor,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 30, 30, 30),
          centerTitle: true,
          elevation: 0,
          titleTextStyle: GoogleFonts.lobster(fontSize: 28, color: kBlueColor),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color.fromARGB(
            255,
            30,
            30,
            30,
          ), 
          selectedItemColor: kBlueColor, 
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
