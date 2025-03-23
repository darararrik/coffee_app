import 'package:coffee_app/core/network/dto/coffee_response/coffee_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'coffee_client.g.dart';

@RestApi(baseUrl: 'https://coffeeshop.academy.effective.band/api/v1/')
abstract class CoffeeClient {
  factory CoffeeClient(Dio dio, {String? baseUrl}) = _CoffeeClient;

  @GET('products/')
  Future<CoffeeResponse> getCoffee();
}
