import 'package:json_annotation/json_annotation.dart';

part 'meta_dto.g.dart';

@JsonSerializable()
class MetaDto {
  final int page;
  final int size;
  final int count;

  MetaDto({required this.page, required this.size, required this.count});

  factory MetaDto.fromJson(Map<String, dynamic> json) =>
      _$MetaDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MetaDtoToJson(this);
}
