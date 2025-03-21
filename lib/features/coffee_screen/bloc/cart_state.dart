part of 'cart_bloc.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<CartItem> items;
  final bool isVisible;
  final double totalAmount;

  CartUpdated({
    required this.items,
    required this.isVisible,
    required this.totalAmount,
  });
}
