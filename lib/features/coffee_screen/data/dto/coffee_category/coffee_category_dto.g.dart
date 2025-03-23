// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoffeeCategoryDto _$CoffeeCategoryDtoFromJson(Map<String, dynamic> json) =>
    CoffeeCategoryDto(
      id: (json['id'] as num).toInt(),
      slug: json['slug'] as String,
    );

Map<String, dynamic> _$CoffeeCategoryDtoToJson(CoffeeCategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
    };
