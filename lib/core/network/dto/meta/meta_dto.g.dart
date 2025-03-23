// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaDto _$MetaDtoFromJson(Map<String, dynamic> json) => MetaDto(
      page: (json['page'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$MetaDtoToJson(MetaDto instance) => <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'count': instance.count,
    };
