import 'package:flutter/material.dart';
import 'package:coffee_app/features/shopping_cart_bottom_sheet/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final Function(int) onQuantityChanged;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 55,
                height: 55,
                child: Image.asset(item.imageUrl),
              ),
              const SizedBox(width: 16),
              Row(
                children: [
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    item.quantity.toStringAsFixed(0),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                (item.price * item.quantity).toStringAsFixed(0),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                " ₽",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500, fontFamily: 'Roboto'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
