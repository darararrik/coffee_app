import 'package:coffee_app/core/ui/theme.dart';
import 'package:coffee_app/features/coffee_screen/bloc/cart_bloc.dart';
import 'package:coffee_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartBloc()),
      ],
      child: MaterialApp.router(
        title: 'Coffee Shop',
        theme: lightTheme,
        routerConfig: appRouter,
      ),
    );
  }
}
