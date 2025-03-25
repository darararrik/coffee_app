import 'package:coffee_app/core/network/api/coffee_client.dart';
import 'package:coffee_app/core/network/dto/order_request/order_request.dart';
import 'package:coffee_app/core/data/mappers/coffee_mapper.dart';
import 'package:coffee_app/core/domain/entities/coffee_entity.dart';
import 'package:coffee_app/core/domain/repos/abstract_coffee_repo.dart';

class CoffeeRepoImpl implements ICoffeeRepo {
  final CoffeeClient _coffeeClient;
  CoffeeRepoImpl({required CoffeeClient coffeeClient})
      : _coffeeClient = coffeeClient;
  @override
  Future<List<CoffeeEntity>> fetchCoffee() async {
    final response = await _coffeeClient.getCoffee();
    return response.data
        .map((coffee) => CoffeeMapper.toEntity(coffee))
        .toList();
  }

  @override
  Future<String> orderCoffee(Map<int, int> positions) async {
    final response =
        await _coffeeClient.orderCoffee(OrderRequest(positions: positions));
    return response.message;
  }
}
