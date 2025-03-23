import 'package:coffee_app/features/coffee_screen/domain/entities/coffee_entity.dart';

abstract class ICoffeeRepo {
  Future<List<CoffeeEntity>> fetchCoffee();
}
