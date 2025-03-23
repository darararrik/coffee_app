// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoffeeResponse _$CoffeeResponseFromJson(Map<String, dynamic> json) =>
    CoffeeResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => CoffeeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: MetaDto.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CoffeeResponseToJson(CoffeeResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };
