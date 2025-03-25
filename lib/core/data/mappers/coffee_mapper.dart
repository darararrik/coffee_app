import 'package:coffee_app/core/data/dto/coffee/coffee_dto.dart';
import 'package:coffee_app/core/data/mappers/category_mapper.dart';
import 'package:coffee_app/core/data/mappers/price_mapper.dart';
import 'package:coffee_app/core/domain/entities/coffee_entity.dart';

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
