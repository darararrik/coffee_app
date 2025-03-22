import 'package:coffee_app/core/ui/colors.dart';
import 'package:coffee_app/core/ui/svg_icons.dart';
import 'package:coffee_app/features/coffee_screen/bloc/cart_bloc.dart';
import 'package:coffee_app/features/shopping_cart_bottom_sheet/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartUpdated) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: neutral3LightDarkColor,
                                ),
                                height: 4,
                                width: 32,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Ваш заказ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                IconButton(
                                  onPressed: () {
                                    context
                                        .read<CartBloc>()
                                        .add(AllRemoveEvent());
                                    context.pop();
                                  },
                                  icon: trashIcon,
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Divider(
                              color: neutral2DarkColor,
                              thickness: 0,
                            ),
                          ],
                        ),
                      ),
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final item = state.items[index];
                              return CartItemWidget(
                                item: item,
                                onQuantityChanged: (quantity) {
                                  context.read<CartBloc>().add(
                                        UpdateQuantityEvent(item.id, quantity),
                                      );
                                },
                              );
                            },
                            childCount: state.items.length,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Divider(
                          color: neutral2DarkColor,
                          thickness: 0,
                        ),
                      ),
                      // Итог
                      SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Итого',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Row(
                              children: [
                                Text(
                                  state.totalAmount.toStringAsFixed(0),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  ' ₽',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Roboto"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Пустое пространство для кнопки
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 100),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(100)),
                      alignment: Alignment.center,
                      child: Text(
                        'Оформить заказ',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}

void showShoppingCart(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.85,
      shouldCloseOnMinExtent: true,
      builder: (context, scrollController) => ShoppingCart(),
    ),
  );
}
