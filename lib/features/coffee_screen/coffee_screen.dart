import 'package:coffee_app/core/ui/colors.dart';
import 'package:coffee_app/features/shopping_cart_bottom_sheet/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/core/models/coffee_entity.dart';
import 'package:coffee_app/core/widgets/coffee_card.dart';
import 'package:coffee_app/core/widgets/coffee_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffee_app/features/coffee_screen/bloc/cart_bloc.dart';

class CoffeeScreen extends StatelessWidget {
  CoffeeScreen({super.key});
  static const List<String> categories = [
    'Чёрный кофе',
    'Дрип Кофе',
    'Чай',
    'Прочие напитки'
  ];

  final String selectedCategory = categories.first;
  final Map<String, GlobalKey> _categoryKeys = {};

  final List<CoffeeEntity> dataCoffee = [
    CoffeeEntity(
        id: '1', name: 'Эспрессо', category: 'Чёрный кофе', price: 451),
    CoffeeEntity(id: '2', name: 'Латте', category: 'Дрип Кофе', price: 451),
    CoffeeEntity(id: '3', name: 'Капучино', category: 'Дрип Кофе', price: 451),
    CoffeeEntity(id: '4', name: 'Капучино', category: 'Дрип Кофе', price: 451),
    CoffeeEntity(id: '5', name: 'Капучино', category: 'Дрип Кофе', price: 451),
    CoffeeEntity(id: '6', name: 'Капучино', category: 'Дрип Кофе', price: 451),
    CoffeeEntity(id: '7', name: 'Капучино', category: 'Дрип Кофе', price: 451),
    CoffeeEntity(id: '8', name: 'Капучино', category: 'Дрип Кофе', price: 451),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
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
                  final categoryCoffeeList = dataCoffee
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
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(color: neutral1DarkColor),
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
                          childAspectRatio: 180.0 / 252.0,
                        ),
                        itemCount: categoryCoffeeList.length,
                        itemBuilder: (context, index) {
                          return CoffeeCard(
                            coffee: categoryCoffeeList[index],
                            onAddTap: () {
                              context.read<CartBloc>().add(
                                    AddToCartEvent(
                                      CartItem(
                                        id: categoryCoffeeList[index].id,
                                        name: categoryCoffeeList[index].name,
                                        price: categoryCoffeeList[index].price,
                                        imageUrl:
                                            categoryCoffeeList[index].imageUrl,
                                      ),
                                    ),
                                  );
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
        );
      },
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
