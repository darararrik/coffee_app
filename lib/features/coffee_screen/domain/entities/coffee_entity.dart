import 'package:coffee_app/features/coffee_screen/domain/entities/category_entity.dart';
import 'package:coffee_app/features/coffee_screen/domain/entities/prices_entity.dart';

class CoffeeEntity {
  final int id;
  final String name;
  final CategoryEntity category;
  final PriceEntity price;
  final String imageUrl;
  final String description;

  const CoffeeEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.imageUrl = 'assets/img/coffee.png',
    this.description =
        'Кофейный напиток с неожиданным сочетанием ингредиентов – кофе арабика Starbucks с добавлением ложки оливкового масла Partanna extra virgin холодного отжима, что создает восхитительный вкус',
  });
}
