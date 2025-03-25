import 'package:coffee_app/core/presentation/ui/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: neutral2LightColor,
          foregroundColor: neutral1DarkColor,
        ),
      ),
      scaffoldBackgroundColor: backgroundColorLight,
      primaryColor: primaryColorLight,
      colorScheme: ColorScheme.light(
        primary: primaryColorLight,
      ),
      textTheme: TextTheme(
        // Title styles
        headlineLarge: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 32,
          height: 40 / 32,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
          color: neutral1DarkColor,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 28,
          height: 36 / 28,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
          color: neutral1DarkColor,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 24,
          height: 32 / 24,
          letterSpacing: 0.15,
          fontWeight: FontWeight.w400,
          color: neutral1DarkColor,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 22,
          height: 28 / 22,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
          color: neutral1DarkColor,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 16,
          height: 24 / 16,
          letterSpacing: 0.15,
          fontWeight: FontWeight.w400,
          color: neutral1DarkColor,
        ),
        titleSmall: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 14,
          height: 20 / 14,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w400,
          color: neutral1DarkColor,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 16,
          height: 24 / 16,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w400,
          color: neutral1DarkColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 14,
          height: 20 / 14,
          letterSpacing: 0.25,
          fontWeight: FontWeight.w400,
          color: neutral1DarkColor,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 12,
          height: 16 / 12,
          letterSpacing: 0.4,
          fontWeight: FontWeight.w400,
          color: neutral1DarkColor,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 14,
          height: 20 / 14,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w600,
          color: neutral1DarkColor,
        ),
        labelMedium: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 12,
          height: 16 / 12,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w600,
          color: neutral1DarkColor,
        ),
        labelSmall: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 11,
          height: 16 / 11,
          letterSpacing: 0.5,
          color: neutral1DarkColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          backgroundColor: neutral2DarkColor,
          foregroundColor: white,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
      ),
      scaffoldBackgroundColor: backgroundColorDark,
      primaryColor: primaryColorDark,
      colorScheme: ColorScheme.dark(
        onSurface: white,
        surface: neutral1DarkColor,
        primary: primaryColorDark,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: neutral1DarkColor,
        labelStyle: TextStyle(
          color: white,
        ),
        selectedColor: primaryColorDark,
        surfaceTintColor: primaryColorDark,
      ),
      textTheme: TextTheme(
        // Title styles
        headlineLarge: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 32,
          height: 40 / 32,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
          color: white,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 28,
          height: 36 / 28,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
          color: white,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 24,
          height: 32 / 24,
          letterSpacing: 0.15,
          fontWeight: FontWeight.w400,
          color: white,
        ),
        titleLarge: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 22,
          height: 28 / 22,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
          color: white,
        ),
        titleMedium: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 16,
          height: 24 / 16,
          letterSpacing: 0.15,
          fontWeight: FontWeight.w400,
          color: white,
        ),
        titleSmall: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 14,
          height: 20 / 14,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w400,
          color: white,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 16,
          height: 24 / 16,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w400,
          color: white,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 14,
          height: 20 / 14,
          letterSpacing: 0.25,
          fontWeight: FontWeight.w400,
          color: white,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 12,
          height: 16 / 12,
          letterSpacing: 0.4,
          fontWeight: FontWeight.w400,
          color: white,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 14,
          height: 20 / 14,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w600,
          color: white,
        ),
        labelMedium: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 12,
          height: 16 / 12,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w600,
          color: white,
        ),
        labelSmall: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 11,
          height: 16 / 11,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w600,
          color: white,
        ),
      ),
    );
  }
}
