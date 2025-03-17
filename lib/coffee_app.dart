import 'package:coffee_app/core/ui/theme.dart';
import 'package:coffee_app/features/coffee_screen/coffee_screen.dart';
import 'package:flutter/material.dart';

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop',
      theme: lightTheme,
      home: CoffeeScreen(),
    );
  }
}
