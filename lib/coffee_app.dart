import 'package:coffee_app/core/config/app_config.dart';
import 'package:coffee_app/core/presentation/cubit/theme_cubit.dart';
import 'package:coffee_app/core/presentation/ui/theme.dart';
import 'package:coffee_app/features/coffee_screen/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:coffee_app/core/presentation/blocs/coffee_bloc/coffee_bloc.dart';
import 'package:coffee_app/features/coffee_screen/presentation/cubit/category_cubit.dart';
import 'package:coffee_app/features/shopping_cart_bottom_sheet/presentation/bloc/order_bloc.dart';
import 'package:coffee_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key, required this.appConfig});
  final AppConfig appConfig;
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => appConfig.database,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CategoryCubit()),
          BlocProvider(
              create: (context) => CartBloc(database: appConfig.database)),
          BlocProvider(
              create: (context) =>
                  CoffeeBloc(coffeeRepo: appConfig.coffeeRepo)),
          BlocProvider(
              create: (context) => OrderBloc(coffeeRepo: appConfig.coffeeRepo)),
          BlocProvider(create: (context) => ThemeCubit(appConfig.prefs)),
        ],
        child: BlocBuilder<ThemeCubit, bool>(
          builder: (context, isDarkTheme) {
            return MaterialApp.router(
              title: 'Coffee App',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
              routerConfig: appRouter,
            );
          },
        ),
      ),
    );
  }
}
