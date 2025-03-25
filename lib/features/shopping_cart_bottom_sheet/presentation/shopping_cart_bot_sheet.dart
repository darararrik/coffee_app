import 'package:coffee_app/core/presentation/ui/colors.dart';
import 'package:coffee_app/core/presentation/ui/svg_icons.dart';
import 'package:coffee_app/features/coffee_screen/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:coffee_app/features/shopping_cart_bottom_sheet/presentation/bloc/order_bloc.dart';
import 'package:coffee_app/features/shopping_cart_bottom_sheet/presentation/widgets/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state is OrderOrdered) {
          context.read<CartBloc>().add(AllRemoveEvent());
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: neutral3LightDarkColor,
              content: Text(state.message),
              duration: Duration(seconds: 2),
            ),
          );
        }
        if (state is OrderError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: neutral3LightDarkColor,
              content: Text(state.message),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      child: BlocBuilder<CartBloc, CartState>(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                final item = state.cartItems[index];
                                return CartItemWidget(
                                  item: item,
                                  onQuantityChanged: (quantity) {
                                    context.read<CartBloc>().add(
                                          UpdateQuantityEvent(item),
                                        );
                                  },
                                );
                              },
                              childCount: state.cartItems.length,
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
                                    state.cartItems
                                        .fold(
                                            0.0,
                                            (sum, item) =>
                                                sum +
                                                item.price * item.quantity)
                                        .toStringAsFixed(0),
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
                    child: GestureDetector(
                      onTap: () {
                        context.read<OrderBloc>().add(
                              OrderCoffeeEvent(
                                positions: Map.fromEntries(
                                  state.cartItems.map((item) =>
                                      MapEntry(item.id, item.quantity)),
                                ),
                              ),
                            );
                      },
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
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                          ),
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
      ),
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
