import 'package:coffee_app/features/coffee_screen/domain/entities/coffee_entity.dart';
import 'package:coffee_app/core/ui/colors.dart';
import 'package:coffee_app/features/coffee_screen/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/core/ui/images.dart';
import 'package:coffee_app/core/ui/svg_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:coffee_app/features/shopping_cart_bottom_sheet/models/cart_item.dart';

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
    return GestureDetector(
      onTap: () {
        context.push('/coffee/${coffee.id}', extra: coffee);
      },
      child: Card(
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
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: neutral1DarkColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartUpdated) {
                    final cartItem = state.items.firstWhere(
                      (item) => item.id == coffee.id,
                      orElse: () => CartItem(
                        id: coffee.id,
                        name: coffee.name,
                        price: coffee.price.value,
                        quantity: 0,
                        imageUrl: coffee.imageUrl,
                      ),
                    );
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      child: cartItem.quantity > 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton.filled(
                                  onPressed: () {
                                    context.read<CartBloc>().add(
                                          UpdateQuantityEvent(
                                            coffee.id,
                                            cartItem.quantity - 1,
                                          ),
                                        );
                                  },
                                  icon: Icon(Icons.remove),
                                  style: IconButton.styleFrom(
                                    backgroundColor:
                                        neutral2LightColor, // Цвет фона
                                    foregroundColor:
                                        Colors.black, // Цвет иконки
                                  ),
                                ),
                                Text(
                                  '${cartItem.quantity}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: neutral1DarkColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                IconButton.filled(
                                  onPressed: () {
                                    context.read<CartBloc>().add(
                                          UpdateQuantityEvent(
                                            coffee.id,
                                            cartItem.quantity + 1,
                                          ),
                                        );
                                  },
                                  style: IconButton.styleFrom(
                                    backgroundColor:
                                        neutral2LightColor, // Цвет фона
                                    foregroundColor:
                                        Colors.black, // Цвет иконки
                                  ),
                                  icon: Icon(Icons.add),
                                ),
                              ],
                            )
                          : standartState(context),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0)
                        .copyWith(top: 26),
                    child: standartState(context),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row standartState(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            "${coffee.price.value.toStringAsFixed(0)} ₽",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: neutral1DarkColor,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        IconButton.filled(
          onPressed: onAddTap,
          icon: plusIcon,
        ),
      ],
    );
  }
}
