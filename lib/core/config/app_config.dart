import 'package:coffee_app/core/data/db/app_database.dart';
import 'package:coffee_app/core/data/repos/coffee_repo_impl.dart';
import 'package:coffee_app/core/network/api/coffee_client.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig {
  final AppDatabase database;
  final SharedPreferences prefs;
  final Dio dio;
  final CoffeeClient coffeeClient;
  final CoffeeRepoImpl coffeeRepo;

  AppConfig._(
      this.database, this.prefs, this.dio, this.coffeeClient, this.coffeeRepo);

  static Future<AppConfig> create() async {
    final database = AppDatabase();
    final prefs = await SharedPreferences.getInstance();
    final dio = Dio();
    final coffeeClient = CoffeeClient(dio);
    final coffeeRepo = CoffeeRepoImpl(coffeeClient: coffeeClient);
    return AppConfig._(database, prefs, dio, coffeeClient, coffeeRepo);
  }
}
