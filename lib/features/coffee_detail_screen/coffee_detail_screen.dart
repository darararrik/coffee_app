import 'package:coffee_app/core/domain/entities/coffee_entity.dart';
import 'package:coffee_app/core/presentation/ui/images.dart';
import 'package:coffee_app/core/presentation/ui/svg_icons.dart';
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
              Image.network(
                coffee.imageUrl,
                fit: BoxFit.cover,
                height: 218,
                errorBuilder: (context, error, stackTrace) {
                  return placeholderCoffeePng;
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(coffee.name,
                            style: Theme.of(context).textTheme.headlineLarge),
                        Text(
                          "${coffee.price.value.toStringAsFixed(0)} ₽",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(coffee.description,
                        style: Theme.of(context).textTheme.bodyLarge),
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
