import 'package:coffee_app/coffee_app.dart';
import 'package:coffee_app/core/config/app_config.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appConfig = await AppConfig.create();
  runApp(CoffeeApp(appConfig: appConfig));
}
