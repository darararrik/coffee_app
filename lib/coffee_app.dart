import 'package:coffee_app/core/ui/theme.dart';
import 'package:coffee_app/features/coffee_screen/domain/i_get_coffee_repo.dart';
import 'package:coffee_app/features/coffee_screen/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:coffee_app/features/coffee_screen/presentation/blocs/coffee_bloc/coffee_bloc.dart';
import 'package:coffee_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key, required this.coffeeRepo});
  final ICoffeeRepo coffeeRepo;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => CoffeeBloc(coffeeRepo: coffeeRepo)),
      ],
      child: MaterialApp.router(
        title: 'Coffee Shop',
        theme: lightTheme,
        routerConfig: appRouter,
      ),
    );
  }
}
