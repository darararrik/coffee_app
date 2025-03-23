part of 'coffee_bloc.dart';

sealed class CoffeeState extends Equatable {
  const CoffeeState();

  @override
  List<Object> get props => [];
}

final class CoffeeInitial extends CoffeeState {}

final class CoffeeLoading extends CoffeeState {}

final class CoffeeLoaded extends CoffeeState {
  final List<CoffeeEntity> coffees;
  const CoffeeLoaded({required this.coffees});

  @override
  List<Object> get props => [coffees];
}

final class CoffeeError extends CoffeeState {
  final String message;
  const CoffeeError({required this.message});

  @override
  List<Object> get props => [message];
}
