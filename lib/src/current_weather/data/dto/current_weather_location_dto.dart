import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/json.dart';

part 'current_weather_location_dto.freezed.dart';
part 'current_weather_location_dto.g.dart';

@freezed
class CurrentWeatherLocationDto with _$CurrentWeatherLocationDto {
  const factory CurrentWeatherLocationDto({
    required String name,
    String? region,
    String? country,
    double? lat,
    double? lon,
    String? tzId,
    int? localtimeepoch,
    String? localtime,
  }) = _CurrentWeatherLocationDto;

  factory CurrentWeatherLocationDto.fromJson(JSON json) =>
      _$CurrentWeatherLocationDtoFromJson(json);
}
