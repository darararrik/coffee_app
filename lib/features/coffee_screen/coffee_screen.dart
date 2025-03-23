import 'package:coffee_app/core/ui/colors.dart';
import 'package:coffee_app/features/coffee_screen/presentation/blocs/coffee_bloc/coffee_bloc.dart';
import 'package:coffee_app/features/shopping_cart_bottom_sheet/models/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/features/coffee_screen/presentation/widgets/coffee_card.dart';
import 'package:coffee_app/features/coffee_screen/presentation/widgets/coffee_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffee_app/features/coffee_screen/presentation/blocs/cart_bloc/cart_bloc.dart';

class CoffeeScreen extends StatefulWidget {
  const CoffeeScreen({super.key});
  @override
  State<CoffeeScreen> createState() => _CoffeeScreenState();
}

class _CoffeeScreenState extends State<CoffeeScreen> {
  final Map<String, GlobalKey> _categoryKeys = {};

  @override
  void initState() {
    super.initState();
    context.read<CoffeeBloc>().add(FetchCoffee());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeBloc, CoffeeState>(
      builder: (context, state) {
        if (state is CoffeeLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CoffeeError) {
          return Center(child: Text(state.message));
        }
        if (state is CoffeeLoaded) {
          final coffees = state.coffees;
          // Получаем уникальные категории
          final categories =
              coffees.map((coffee) => coffee.category.slug).toSet().toList();

          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverPersistentHeader(
                pinned: true,
                delegate: _StickyHeaderDelegate(
                  child: CategoryHeader(
                    categories: categories,
                    onCategorySelected: (category) {},
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, categoryIndex) {
                    final categoryName = categories[categoryIndex];
                    final coffeeList = coffees
                        .where((coffee) => coffee.category.slug == categoryName)
                        .toList();

                    return Column(
                      key: _categoryKeys[categoryName],
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          child: Text(
                            categoryName,
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
                            childAspectRatio: 180.0 / 248.0,
                          ),
                          itemCount: coffeeList.length,
                          itemBuilder: (context, index) {
                            final coffee = coffeeList[index];
                            return CoffeeCard(
                              coffee: coffee,
                              onAddTap: () {
                                context.read<CartBloc>().add(
                                      AddToCartEvent(
                                        CartItem(
                                          id: coffee.id,
                                          name: coffee.name,
                                          price: coffee.price.value,
                                          imageUrl: coffee.imageUrl,
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
                  childCount: categories.length, // Количество категорий
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
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
