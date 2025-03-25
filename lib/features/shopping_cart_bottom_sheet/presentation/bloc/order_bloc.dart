import 'package:bloc/bloc.dart';
import 'package:coffee_app/core/domain/repos/abstract_coffee_repo.dart';
import 'package:equatable/equatable.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final ICoffeeRepo _coffeeRepo;
  OrderBloc({required ICoffeeRepo coffeeRepo})
      : _coffeeRepo = coffeeRepo,
        super(OrderInitial()) {
    on<OrderCoffeeEvent>(_onOrder);
  }
  Future<void> _onOrder(
      OrderCoffeeEvent event, Emitter<OrderState> emit) async {
    emit(OrderLoading());
    try {
      final message = await _coffeeRepo.orderCoffee(event.positions);
      if (message == 'success') {
        emit(OrderOrdered(message: 'Заказ создан'));
      } else {
        emit(OrderError(message: "Возникла ошибка при заказе"));
      }
    } catch (e) {
      emit(OrderError(message: "Возникла ошибка при заказе"));
    }
  }
}
