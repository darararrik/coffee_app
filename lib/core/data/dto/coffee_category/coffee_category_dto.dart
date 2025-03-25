import 'package:json_annotation/json_annotation.dart';

part 'coffee_category_dto.g.dart';

@JsonSerializable()
class CoffeeCategoryDto {
  final int id;
  final String slug;

  CoffeeCategoryDto({required this.id, required this.slug});

  factory CoffeeCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CoffeeCategoryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CoffeeCategoryDtoToJson(this);
}
