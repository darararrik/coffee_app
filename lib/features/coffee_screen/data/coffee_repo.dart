import 'package:coffee_app/core/network/api/coffee_client.dart';
import 'package:coffee_app/features/coffee_screen/data/mappers/coffee_mapper.dart';
import 'package:coffee_app/features/coffee_screen/domain/entities/coffee_entity.dart';
import 'package:coffee_app/features/coffee_screen/domain/i_get_coffee_repo.dart';

class CoffeeRepo implements ICoffeeRepo {
  final CoffeeClient _coffeeClient;
  CoffeeRepo({required CoffeeClient coffeeClient})
      : _coffeeClient = coffeeClient;
  @override
  Future<List<CoffeeEntity>> fetchCoffee() async {
    final response = await _coffeeClient.getCoffee();
    print(response.data);
    return response.data
        .map((coffee) => CoffeeMapper.toEntity(coffee))
        .toList();
  }
}
