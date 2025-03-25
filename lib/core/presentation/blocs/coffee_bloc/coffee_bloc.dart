import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:coffee_app/core/domain/entities/coffee_entity.dart';
import 'package:coffee_app/core/domain/repos/abstract_coffee_repo.dart';
import 'package:equatable/equatable.dart';
part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  final ICoffeeRepo _coffeeRepo;

  CoffeeBloc({required ICoffeeRepo coffeeRepo})
      : _coffeeRepo = coffeeRepo,
        super(CoffeeInitial()) {
    on<FetchCoffee>(_onGetCoffee);
  }

  FutureOr<void> _onGetCoffee(
      FetchCoffee event, Emitter<CoffeeState> emit) async {
    emit(CoffeeLoading());
    try {
      final coffees = await _coffeeRepo.fetchCoffee();
      emit(CoffeeLoaded(coffees: coffees));
    } catch (e) {
      emit(CoffeeError(message: e.toString()));
    }
  }
}
