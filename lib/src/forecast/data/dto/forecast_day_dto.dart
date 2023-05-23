import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_flutter/src/forecast/data/dto/astro_dto.dart';
import 'package:weather_flutter/src/forecast/data/dto/day_dto.dart';
import 'package:weather_flutter/src/forecast/data/dto/hour_dto.dart';

import '../../../../core/json.dart';

part 'forecast_day_dto.freezed.dart';
part 'forecast_day_dto.g.dart';

@freezed
class ForecastDayDto with _$ForecastDayDto {
  const factory ForecastDayDto({
    required DateTime date,
    required DayDto day,
    int? dateEpoch,
    AstroDto? astro,
    List<HourDto>? hour,
  }) = _ForecastDayDto;

  factory ForecastDayDto.fromJson(JSON json) => _$ForecastDayDtoFromJson(json);
}
