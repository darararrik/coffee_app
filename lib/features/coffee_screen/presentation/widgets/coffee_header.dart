import 'package:flutter/material.dart';

class CategoryHeader extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CategoryHeader({
    super.key,
    required this.categories,
    required this.onCategorySelected,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: FilterChip(
                side: BorderSide(color: Colors.transparent),
                showCheckmark: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                label: Text(category),
                selected: selectedCategory == category,
                onSelected: (_) => onCategorySelected(category),
                selectedColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(context).colorScheme.surface,
                labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: selectedCategory == category
                          ? Colors.white
                          : Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
