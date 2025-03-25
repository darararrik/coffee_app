import 'package:coffee_app/core/presentation/blocs/coffee_bloc/coffee_bloc.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/features/coffee_screen/presentation/widgets/coffee_card.dart';
import 'package:coffee_app/features/coffee_screen/presentation/widgets/coffee_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffee_app/features/coffee_screen/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:coffee_app/features/coffee_screen/presentation/cubit/category_cubit.dart';

class CoffeeScreen extends StatefulWidget {
  const CoffeeScreen({super.key});
  @override
  State<CoffeeScreen> createState() => _CoffeeScreenState();
}

class _CoffeeScreenState extends State<CoffeeScreen> {
  final Map<String, GlobalKey> _categoryKeys = {};
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<CoffeeBloc>().add(FetchCoffee());
    context.read<CartBloc>().add(LoadCartEvent());
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final scrollPosition = _scrollController.offset;
    String? currentCategory;
    const double headerHeight = 100.0;
    const double threshold = 20.0;

    for (var entry in _categoryKeys.entries) {
      final key = entry.value;
      final RenderBox? renderBox =
          key.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox == null) continue;

      final offset = renderBox.localToGlobal(Offset.zero);
      final elementTop = offset.dy - scrollPosition;

      if (elementTop <= (headerHeight + threshold) &&
          elementTop + renderBox.size.height > headerHeight) {
        currentCategory = entry.key;
        break;
      }
    }

    if (currentCategory != null &&
        currentCategory != context.read<CategoryCubit>().state) {
      context.read<CategoryCubit>().selectCategory(currentCategory);
    }
  }

  void _scrollToCategory(String category) {
    final key = _categoryKeys[category];
    if (key?.currentContext != null) {
      final headerHeight = 25.0; // Высота заголовка

      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtStart,
        alignment: 0.0,
      ).then((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.offset - headerHeight,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
          );
        }
      });
      context.read<CategoryCubit>().selectCategory(category);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeBloc, CoffeeState>(
      builder: (context, state) {
        if (state is CoffeeLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is CoffeeError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Ошибка",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<CoffeeBloc>().add(FetchCoffee());
                  },
                  child: Text("Перезагрузить"))
            ],
          );
        }
        if (state is CoffeeLoaded) {
          final coffees = state.coffees;
          final categories =
              coffees.map((coffee) => coffee.category.slug).toSet().toList();

          _categoryKeys.clear();
          for (var category in categories) {
            _categoryKeys[category] = GlobalKey();
          }
          if (context.read<CategoryCubit>().state.isEmpty &&
              categories.isNotEmpty) {
            context.read<CategoryCubit>().selectCategory(categories.first);
          }
          return CustomScrollView(
            controller: _scrollController,
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverPersistentHeader(
                pinned: true,
                delegate: _StickyHeaderDelegate(
                  child: BlocBuilder<CategoryCubit, String>(
                    builder: (context, selectedCategory) {
                      return CategoryHeader(
                        categories: categories,
                        onCategorySelected: (category) {
                          _scrollToCategory(category);
                        },
                        selectedCategory: selectedCategory,
                      );
                    },
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
                          child: Text(categoryName,
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
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
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: child,
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
