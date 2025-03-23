import 'package:coffee_app/features/coffee_screen/data/dto/coffee_category/coffee_category_dto.dart';
import 'package:coffee_app/features/coffee_screen/domain/entities/category_entity.dart';

class CategoryMapper {
  static CategoryEntity toEntity(CoffeeCategoryDto coffeeCategoryDto) {
    return CategoryEntity(
        id: coffeeCategoryDto.id, slug: coffeeCategoryDto.slug);
  }
}
