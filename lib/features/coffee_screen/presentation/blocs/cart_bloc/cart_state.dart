part of 'cart_bloc.dart';

sealed class CartState extends Equatable {}

final class CartInitial extends CartState {
  @override
  List<Object?> get props => [];
}

class CartUpdated extends CartState {
  final List<CartItem> cartItems;
  final bool isVisible;

  CartUpdated({
    required this.cartItems,
    required this.isVisible,
  });

  @override
  List<Object?> get props => [cartItems, isVisible];
}

class CartError extends CartState {
  final String message;

  CartError(this.message);

  @override
  List<Object?> get props => [message];
}
