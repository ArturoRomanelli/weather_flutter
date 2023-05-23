import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_flutter/src/current_weather/data/dto/condition_dto.dart';

import '../../../../core/json.dart';

part 'hour_dto.freezed.dart';
part 'hour_dto.g.dart';

@freezed
class HourDto with _$HourDto {
  const factory HourDto(
    int? timeEpoch,
    String? time,
    double? tempC,
    double? tempF,
    int? isDay,
    ConditionDto? condition,
    double? windMph,
    double? windKph,
    int? windDegree,
    String? windDir,
    int? pressureMb,
    double? pressureIn,
    double? precipMm,
    double? precipIn,
    int? humidity,
    int? cloud,
    double? feelslikeC,
    double? feelslikeF,
    double? windchillC,
    double? windchillF,
    double? heatindexC,
    double? heatindexF,
    double? dewpointC,
    double? dewpointF,
    int? willItRain,
    int? chanceOfRain,
    int? willItSnow,
    int? chanceOfSnow,
    int? visKm,
    int? visMiles,
    double? gustMph,
    double? gustKph,
    int? uv,
  ) = _HourDto;
  factory HourDto.fromJson(JSON json) => _$HourDtoFromJson(json);
}
