part of 'cart_bloc.dart';

abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  final CartItem item;
  AddToCartEvent(this.item);
}

class RemoveFromCartEvent extends CartEvent {
  final String itemId;
  RemoveFromCartEvent(this.itemId);
}

class UpdateQuantityEvent extends CartEvent {
  final String itemId;
  final int quantity;
  UpdateQuantityEvent(this.itemId, this.quantity);
}

class ToggleCartVisibilityEvent extends CartEvent {}
