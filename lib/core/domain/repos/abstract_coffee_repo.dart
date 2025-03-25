import 'package:coffee_app/core/domain/entities/coffee_entity.dart';

abstract interface class ICoffeeRepo {
  Future<List<CoffeeEntity>> fetchCoffee();
  Future<String> orderCoffee(Map<int, int> positions);
}
