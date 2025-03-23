import 'package:coffee_app/features/coffee_screen/data/dto/coffee/coffee_dto.dart';
import 'package:coffee_app/features/coffee_screen/data/mappers/category_mapper.dart';
import 'package:coffee_app/features/coffee_screen/data/mappers/price_mapper.dart';
import 'package:coffee_app/features/coffee_screen/domain/entities/coffee_entity.dart';

class CoffeeMapper {
  static CoffeeEntity toEntity(CoffeeDto coffeeDto) {
    return CoffeeEntity(
        id: coffeeDto.id,
        name: coffeeDto.name,
        category: CategoryMapper.toEntity(coffeeDto.category),
        price: PriceMapper.toEntity(coffeeDto.prices),
        imageUrl: coffeeDto.imageUrl);
  }
}
