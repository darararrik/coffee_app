import 'package:flutter/material.dart';
import 'package:coffee_app/features/shopping_cart_bottom_sheet/models/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final Function(int) onQuantityChanged;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(item.imageUrl),
          ),
          const SizedBox(width: 16),

          // Информация о товаре
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  '${item.price} ₽',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),

          // Кнопки управления количеством
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (item.quantity > 1) {
                    onQuantityChanged(item.quantity - 1);
                  }
                },
                icon: const Icon(Icons.remove_circle_outline),
                color: Colors.grey,
              ),
              Text(
                '${item.quantity}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              IconButton(
                onPressed: () {
                  onQuantityChanged(item.quantity + 1);
                },
                icon: const Icon(Icons.add_circle_outline),
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
