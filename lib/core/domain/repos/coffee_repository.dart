import 'package:coffee_app/core/domain/entities/coffee_entity.dart';

abstract class CoffeeRepository {
  Future<List<CoffeeEntity>> getCoffeeList({
    required int page,
    required int pageSize,
  });

  Future<CoffeeEntity> getCoffeeById(String id);

  Future<void> addToCart(CoffeeEntity coffee);

  Future<void> removeFromCart(CoffeeEntity coffee);

  Future<List<CoffeeEntity>> getCartItems();
}
