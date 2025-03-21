import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffee_app/features/shopping_cart_bottom_sheet/models/cart_item.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    final List<CartItem> items = [];
    bool isVisible = false;

    on<AddToCartEvent>((event, emit) {
      items.add(event.item);
      isVisible = true;
      emit(CartUpdated(
        items: items,
        isVisible: isVisible,
        totalAmount: _calculateTotal(items),
      ));
    });

    on<RemoveFromCartEvent>((event, emit) {
      items.removeWhere((item) => item.id == event.itemId);
      isVisible = items.isNotEmpty;
      emit(CartUpdated(
        items: items,
        isVisible: isVisible,
        totalAmount: _calculateTotal(items),
      ));
    });

    on<UpdateQuantityEvent>((event, emit) {
      final index = items.indexWhere((item) => item.id == event.itemId);
      if (index != -1) {
        if (event.quantity == 0) {
          items.removeAt(index);
        } else {
          items[index] = items[index].copyWith(quantity: event.quantity);
        }
        isVisible = items.isNotEmpty;
        emit(
          CartUpdated(
            items: items,
            isVisible: isVisible,
            totalAmount: _calculateTotal(items),
          ),
        );
      }
    });

    on<ToggleCartVisibilityEvent>((event, emit) {
      isVisible = !isVisible;
      emit(CartUpdated(
        items: items,
        isVisible: isVisible,
        totalAmount: _calculateTotal(items),
      ));
    });
  }

  double _calculateTotal(List<CartItem> items) {
    return items.fold(0, (sum, item) => sum + (item.price * item.quantity));
  }
}
