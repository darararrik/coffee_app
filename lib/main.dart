import 'package:coffee_app/coffee_app.dart';
import 'package:coffee_app/core/network/api/coffee_client.dart';
import 'package:coffee_app/features/coffee_screen/data/coffee_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  final Dio dio = Dio();
  final coffeeClient = CoffeeClient(dio);
  final coffeeRepo = CoffeeRepo(coffeeClient: coffeeClient);
  runApp(CoffeeApp(coffeeRepo: coffeeRepo));
}
