import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFFF7FAF8),
  ),
  scaffoldBackgroundColor: Color(0xFFF7FAF8),
  primaryColor: Color(0xFF5CBCE5),
  colorScheme: ColorScheme.light(
    primary: Color(0xFF5CBCE5),
  ),
  textTheme: TextTheme(
    // Title styles
    headlineLarge: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 32,
      height: 40 / 32,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 28,
      height: 36 / 28,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 24,
      height: 32 / 24,
      letterSpacing: 0.15,
      fontWeight: FontWeight.w400,
    ),
    titleLarge: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 22,
      height: 28 / 22,
      letterSpacing: 0,
      fontWeight: FontWeight.w400,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0.15,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 16,
      height: 24 / 16,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0.25,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 12,
      height: 16 / 12,
      letterSpacing: 0.4,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 14,
      height: 20 / 14,
      letterSpacing: 0.1,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 12,
      height: 16 / 12,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Open Sans',
      fontSize: 11,
      height: 16 / 11,
      letterSpacing: 0.5,
      fontWeight: FontWeight.w600,
    ),
  ),
);
