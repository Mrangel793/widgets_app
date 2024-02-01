import 'package:flutter/material.dart';

final List<Color> colorsTheme = [
  Colors.blue,
  Colors.teal,
  Colors.purple,
  Colors.orange,
  Colors.yellow,
];


class AppTheme{

final int selectedColor;

  AppTheme({
    this.selectedColor = 0
    });

  ThemeData theme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorsTheme[selectedColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
    
  );

}