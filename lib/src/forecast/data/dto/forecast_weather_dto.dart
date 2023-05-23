import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_flutter/src/forecast/data/dto/current_dto.dart';

import '../../../../core/json.dart';
import '../../../current_weather/data/dto/location_dto.dart';
import 'forecast_dto.dart';

part 'forecast_weather_dto.freezed.dart';
part 'forecast_weather_dto.g.dart';

@freezed
class ForecastWeatherDto with _$ForecastWeatherDto {
  const factory ForecastWeatherDto({
    LocationDto? location,
    required CurrentDto current,
    required ForecastDto forecast,
  }) = _ForecastWeatherDto;

  factory ForecastWeatherDto.fromJson(JSON json) => _$ForecastWeatherDtoFromJson(json);
}
