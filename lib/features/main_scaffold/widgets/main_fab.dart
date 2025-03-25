import 'package:coffee_app/core/presentation/cubit/theme_cubit.dart';
import 'package:coffee_app/features/coffee_screen/presentation/blocs/cart_bloc/cart_bloc.dart';
import 'package:coffee_app/features/shopping_cart_bottom_sheet/presentation/shopping_cart_bot_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainFab extends StatelessWidget {
  const MainFab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
                child: Theme.of(context).brightness == Brightness.dark
                    ? Icon(
                        Icons.dark_mode_outlined,
                        size: 24,
                        color: Theme.of(context).colorScheme.onSurface,
                      )
                    : Icon(
                        Icons.light_mode_outlined,
                        size: 24,
                      ),
              ),
              ...[
                if (state is CartUpdated && state.isVisible)
                  FloatingActionButton.extended(
                    onPressed: () {
                      showShoppingCart(context);
                    },
                    label: Text(
                      "${state.cartItems.fold(0.0, (sum, item) => sum + item.price * item.quantity).toStringAsFixed(0)} ₽",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Roboto"),
                    ),
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  ),
              ],
            ],
          ),
        );
      },
    );
  }
}
