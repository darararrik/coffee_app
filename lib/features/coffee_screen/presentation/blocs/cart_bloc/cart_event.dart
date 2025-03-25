part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {}

class AddToCartEvent extends CartEvent {
  final CartItem item;
  AddToCartEvent(this.item);

  @override
  List<Object?> get props => [item];
}

class RemoveFromCartEvent extends CartEvent {
  final int itemId;
  RemoveFromCartEvent(this.itemId);

  @override
  List<Object?> get props => [itemId];
}

class UpdateQuantityEvent extends CartEvent {
  final CartItem item;
  UpdateQuantityEvent(this.item);

  @override
  List<Object?> get props => [item];
}

class ToggleCartVisibilityEvent extends CartEvent {
  @override
  List<Object?> get props => [];
}

class AllRemoveEvent extends CartEvent {
  AllRemoveEvent();

  @override
  List<Object?> get props => [];
}

class LoadCartEvent extends CartEvent {
  LoadCartEvent();

  @override
  List<Object?> get props => [];
}
