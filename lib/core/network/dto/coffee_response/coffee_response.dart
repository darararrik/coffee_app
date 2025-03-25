import 'package:coffee_app/core/data/dto/coffee/coffee_dto.dart';
import 'package:coffee_app/core/network/dto/meta/meta_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coffee_response.g.dart';

@JsonSerializable()
class CoffeeResponse {
  final List<CoffeeDto> data;
  final MetaDto meta;

  CoffeeResponse({required this.data, required this.meta});

  factory CoffeeResponse.fromJson(Map<String, dynamic> json) =>
      _$CoffeeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CoffeeResponseToJson(this);
}
