import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(onSecondary: Colors.blueAccent));
ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Colors.black,
        onPrimary: Colors.grey,
        onSecondary: Colors.purple),
    cardTheme: CardTheme(
        color: Colors.grey, elevation: 10, shadowColor: Colors.blueAccent));
