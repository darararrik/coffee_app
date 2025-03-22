import 'package:coffee_app/features/coffee_screen/bloc/cart_bloc.dart';
import 'package:coffee_app/features/shopping_cart_bottom_sheet/shopping_cart.dart';
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
                onPressed: () {},
                child: Icon(Icons.sunny),
              ),
              ...[
                if (state is CartUpdated && state.isVisible)
                  FloatingActionButton.extended(
                    onPressed: () {
                      showShoppingCart(context);
                    },
                    //Почему-то в Open Sans не отображается значок рубля (₽)
                    label: Text(
                      "${state.totalAmount.toStringAsFixed(0)} ₽",
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Roboto"),
                    ),
                    icon: Icon(Icons.shopping_cart_outlined),
                  ),
              ],
            ],
          ),
        );
      },
    );
  }
}
