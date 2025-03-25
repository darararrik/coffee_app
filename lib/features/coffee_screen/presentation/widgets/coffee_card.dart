import 'package:coffee_app/core/data/db/app_database.dart';
import 'package:coffee_app/core/domain/entities/coffee_entity.dart';
import 'package:coffee_app/features/coffee_screen/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:coffee_app/core/presentation/ui/svg_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CoffeeCard extends StatelessWidget {
  final CoffeeEntity coffee;

  const CoffeeCard({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/coffee/${coffee.id}', extra: coffee);
      },
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surface,
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
                      Image.network(
                        coffee.imageUrl + 'd',
                        height: 100,
                        fit: BoxFit.fitWidth,
                        errorBuilder: (context, error, stackTrace) {
                          return placeholderCoffee;
                        },
                      ),
                      const SizedBox(height: 8),
                      Text(
                        coffee.name,
                        style: Theme.of(context).textTheme.titleLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartUpdated) {
                    final existingItem = state.cartItems.firstWhere(
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
                      child: existingItem.quantity > 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton.filled(
                                  onPressed: () {
                                    context.read<CartBloc>().add(
                                          UpdateQuantityEvent(
                                            existingItem.copyWith(
                                              quantity:
                                                  existingItem.quantity - 1,
                                            ),
                                          ),
                                        );
                                  },
                                  icon: Icon(Icons.remove),
                                ),
                                Text(
                                  '${existingItem.quantity}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                IconButton.filled(
                                  onPressed: () {
                                    if (existingItem.quantity < 10) {
                                      context.read<CartBloc>().add(
                                            UpdateQuantityEvent(
                                              existingItem.copyWith(
                                                quantity:
                                                    existingItem.quantity + 1,
                                              ),
                                            ),
                                          );
                                    }
                                  },
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
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Roboto',
                ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        IconButton.filled(
          onPressed: () {
            context.read<CartBloc>().add(
                  AddToCartEvent(
                    CartItem(
                      id: coffee.id,
                      name: coffee.name,
                      price: coffee.price.value,
                      imageUrl: coffee.imageUrl,
                      quantity: 1,
                    ),
                  ),
                );
          },
          icon: plusIcon,
          style: IconButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
