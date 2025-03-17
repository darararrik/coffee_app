import 'package:flutter/material.dart';
import 'package:coffee_app/core/models/coffee_entity.dart';
import 'package:coffee_app/core/widgets/coffee_card.dart';
import 'package:coffee_app/core/widgets/coffee_header.dart';

class CoffeeScreen extends StatelessWidget {
  CoffeeScreen({super.key});
  static const List<String> categories = [
    'Черный кофе',
    'Дрип Кофе',
    'Чай',
    'Прочие напитки'
  ];

  final String selectedCategory = categories.first;
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _categoryKeys = {};

  final List<CoffeeEntity> coffeeList = [
    CoffeeEntity(name: 'Эспрессо', category: 'Черный кофе', price: 451),
    CoffeeEntity(name: 'Латте', category: 'Дрип Кофе', price: 451),
    CoffeeEntity(name: 'Капучино', category: 'Дрип Кофе', price: 451),
    CoffeeEntity(name: 'Капучино', category: 'Дрип Кофе', price: 451),
    CoffeeEntity(name: 'Капучино', category: 'Дрип Кофе', price: 451),
    CoffeeEntity(name: 'Капучино', category: 'Дрип Кофе', price: 451),
    CoffeeEntity(name: 'Капучино', category: 'Дрип Кофе', price: 451),
    CoffeeEntity(name: 'Капучино', category: 'Дрип Кофе', price: 451),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: _StickyHeaderDelegate(
                child: CategoryHeader(
                  categories: categories,
                  selectedCategory: selectedCategory,
                  onCategorySelected: (category) {},
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final category = categories[index];
                  final categoryCoffeeList = coffeeList
                      .where((coffee) => coffee.category == category)
                      .toList();

                  return Column(
                    key: _categoryKeys[category],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          category,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20,
                          childAspectRatio: 180 / 242,
                        ),
                        itemCount: categoryCoffeeList.length,
                        itemBuilder: (context, index) {
                          return CoffeeCard(
                            coffee: categoryCoffeeList[index],
                            onAddTap: () {
                              // Добавить обработку добавления в корзину
                            },
                          );
                        },
                      ),
                    ],
                  );
                },
                childCount: categories.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  const _StickyHeaderDelegate({required this.child});

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      child;

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
