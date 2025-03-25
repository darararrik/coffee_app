part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class OrderCoffeeEvent extends OrderEvent {
  // positions - id кофе и количество
  final Map<int, int> positions;

  const OrderCoffeeEvent({required this.positions});
}
