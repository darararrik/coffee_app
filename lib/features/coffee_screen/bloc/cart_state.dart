part of 'cart_bloc.dart';

sealed class CartState extends Equatable {}

final class CartInitial extends CartState {
  @override
  List<Object?> get props => [];
}

class CartUpdated extends CartState {
  final List<CartItem> items;
  final bool isVisible;
  final double totalAmount;

  CartUpdated({
    required this.items,
    required this.isVisible,
    required this.totalAmount,
  });

  @override
  List<Object?> get props => [items, isVisible, totalAmount];
}
