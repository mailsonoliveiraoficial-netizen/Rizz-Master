import 'package:flutter/material.dart';

class AppTheme {
  static const backgroundColor = Color(0xFF06070D);
  static const cardColor = Color(0xFF0E111E);
  static const primaryPurple = Color(0xFF6366F1);
  static const accentPink = Color(0xFFD946EF);
  static const textGrey = Color(0xFFB8C0D9);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundColor,
      cardColor: cardColor,
      fontFamily: 'Poppins', // Garante a fonte principal do mockup
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: textGrey),
      ),
    );
  }
}