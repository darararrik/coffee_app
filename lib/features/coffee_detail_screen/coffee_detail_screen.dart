import 'package:coffee_app/core/models/coffee_entity.dart';
import 'package:coffee_app/core/ui/svg_icons.dart';
import 'package:coffee_app/core/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoffeeDetailScreen extends StatelessWidget {
  const CoffeeDetailScreen({super.key, required this.coffee});

  final CoffeeEntity coffee;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: backButtonIcon,
          ),
        ),
        SliverFillRemaining(
          child: Column(
            children: [
              Image.asset(
                coffee.imageUrl,
                fit: BoxFit.cover,
                height: 218,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffee.name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: neutral1Dark),
                    ),
                    SizedBox(height: 16),
                    Text(
                      coffee.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: neutral1Dark),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
