import 'package:flutter/material.dart';

class CategoryHeader extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CategoryHeader({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: FilterChip(
                label: Text(category),
                selected: selectedCategory == category,
                onSelected: (_) => onCategorySelected(category),
                selectedColor: Colors.orange,
                backgroundColor: Colors.grey[300],
                labelStyle: TextStyle(
                  color: selectedCategory == category
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
