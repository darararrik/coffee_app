// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoffeeDto _$CoffeeDtoFromJson(Map<String, dynamic> json) => CoffeeDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      category:
          CoffeeCategoryDto.fromJson(json['category'] as Map<String, dynamic>),
      imageUrl: json['imageUrl'] as String,
      prices: (json['prices'] as List<dynamic>)
          .map((e) => PriceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CoffeeDtoToJson(CoffeeDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'imageUrl': instance.imageUrl,
      'prices': instance.prices,
    };
