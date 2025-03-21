import 'package:coffee_app/core/models/coffee_entity.dart';
import 'package:coffee_app/features/coffee_screen/coffee_screen.dart';
import 'package:coffee_app/features/coffee_detail_screen/coffee_detail_screen.dart';
import 'package:coffee_app/features/main_scaffold/main_scaffold_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
      routes: [
        GoRoute(
            path: '/',
            builder: (context, state) => CoffeeScreen(),
            routes: [
              GoRoute(
                path: '/coffee/:id',
                builder: (context, state) {
                  final coffee = state.extra as CoffeeEntity;
                  return CoffeeDetailScreen(coffee: coffee);
                },
              ),
            ]),
      ],
    ),
  ],
);
