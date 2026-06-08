import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xff121214),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xff8257e5),
        secondary: Color(0xff04d361),
        surface: Color(0xff202024),
        error: Color(0xfff75a68),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff121214),
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}