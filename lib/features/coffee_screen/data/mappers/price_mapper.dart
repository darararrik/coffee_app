import 'package:coffee_app/features/coffee_screen/data/dto/price/price_dto.dart';
import 'package:coffee_app/features/coffee_screen/domain/entities/prices_entity.dart';

class PriceMapper {
  static PriceEntity toEntity(List<PriceDto> priceDto) {
    return PriceEntity(
        value: double.parse(
            priceDto.where((price) => price.currency == 'RUB').first.value),
        currency:
            priceDto.where((price) => price.currency == 'RUB').first.currency);
  }
}
