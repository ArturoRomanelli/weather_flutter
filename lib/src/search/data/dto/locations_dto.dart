import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/json.dart';
import '../../../current_weather/data/dto/location_dto.dart';

part 'locations_dto.freezed.dart';
part 'locations_dto.g.dart';

@freezed
class LocationsDto with _$LocationsDto {
  const factory LocationsDto({
    @Default([]) Iterable<LocationDto> locations,
  }) = _LocationsDto;
  factory LocationsDto.fromJson(JSON json) => _$LocationsDtoFromJson(json);
}
