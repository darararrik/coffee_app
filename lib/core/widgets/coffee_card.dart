import 'package:flutter/material.dart';
import 'package:coffee_app/core/ui/images.dart';
import 'package:coffee_app/core/ui/svg_icons.dart';
import '../models/coffee_entity.dart';

class CoffeeCard extends StatelessWidget {
  final CoffeeEntity coffee;
  final VoidCallback onAddTap;

  const CoffeeCard({
    super.key,
    required this.coffee,
    required this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: Column(
                  children: [
                    placeholderCoffeePng,
                    const SizedBox(height: 8),
                    Text(
                      coffee.name,
                      style: const TextStyle(fontSize: 22),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0).copyWith(top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${coffee.price.toStringAsFixed(0)} ₽",
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                  IconButton.filled(
                    onPressed: onAddTap,
                    icon: plusIcon,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
