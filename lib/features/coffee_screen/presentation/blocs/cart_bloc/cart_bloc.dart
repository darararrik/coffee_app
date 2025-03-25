import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffee_app/core/data/db/app_database.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AppDatabase database;

  CartBloc({required this.database}) : super(CartInitial()) {
    on<LoadCartEvent>(_onLoadCart);
    on<AddToCartEvent>(_onAddToCart);
    on<UpdateQuantityEvent>(_onUpdateQuantity);
    on<AllRemoveEvent>(_onAllRemove);
  }

  Future<void> _onLoadCart(LoadCartEvent event, Emitter<CartState> emit) async {
    try {
      final items = await database.getAllCartItems();
      bool isVisible = items.isNotEmpty;
      emit(CartUpdated(cartItems: items, isVisible: isVisible));
    } catch (e) {
      emit(CartError('Ошибка загрузки корзины'));
    }
  }

  Future<void> _onAddToCart(
      AddToCartEvent event, Emitter<CartState> emit) async {
    try {
      await database.upsertCartItem(event.item);

      final items = await database.getAllCartItems();
      emit(CartUpdated(cartItems: items, isVisible: true));
    } catch (e) {
      emit(CartError('Ошибка добавления товара'));
    }
  }

  Future<void> _onUpdateQuantity(
      UpdateQuantityEvent event, Emitter<CartState> emit) async {
    try {
      if (event.item.quantity <= 0) {
        await database.removeCartItem(event.item.id);
      } else {
        await database.upsertCartItem(event.item);
      }
      final items = await database.getAllCartItems();
      if (items.isEmpty) {
        emit(CartUpdated(cartItems: items, isVisible: false));
      } else {
        emit(CartUpdated(cartItems: items, isVisible: true));
      }
    } catch (e) {
      emit(CartError('Ошибка обновления количества'));
    }
  }

  Future<void> _onAllRemove(
      AllRemoveEvent event, Emitter<CartState> emit) async {
    try {
      await database.clearCart();
      emit(CartUpdated(cartItems: [], isVisible: false));
    } catch (e) {
      emit(CartError('Ошибка очистки корзины'));
    }
  }
}
