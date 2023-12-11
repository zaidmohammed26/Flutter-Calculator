import 'package:calculator/calculator.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
//import 'package:meals/screens/categories.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 125, 167, 202),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const CalculatorScreen(),
    );
  }
}
