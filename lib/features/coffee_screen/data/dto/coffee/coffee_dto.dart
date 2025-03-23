import 'package:coffee_app/features/coffee_screen/data/dto/coffee_category/coffee_category_dto.dart';
import 'package:coffee_app/features/coffee_screen/data/dto/price/price_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'coffee_dto.g.dart';

@JsonSerializable()
class CoffeeDto {
  final int id;
  final String name;
  final String description;
  final CoffeeCategoryDto category;
  final String imageUrl;
  final List<PriceDto> prices;

  CoffeeDto({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.prices,
  });

  factory CoffeeDto.fromJson(Map<String, dynamic> json) =>
      _$CoffeeDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CoffeeDtoToJson(this);
}
