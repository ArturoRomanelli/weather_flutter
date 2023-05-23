import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/json.dart';
import 'condition_dto.dart';

//import 'condition_dto.dart';

part 'day_dto.freezed.dart';
part 'day_dto.g.dart';

@freezed
class DayDto with _$DayDto {
  const factory DayDto({
    required double avgtempC,
    required ConditionDto condition,
    double? maxtempC,
    double? maxtempF,
    double? mintempC,
    double? mintempF,
    double? avgtempF,
    double? maxwindMph,
    int? maxwindKph,
    double? totalprecipMm,
    double? totalprecipIn,
    int? totalsnowCm,
    double? avgvisKm,
    int? avgvisMiles,
    int? avghumidity,
    int? dailyWillItRain,
    int? dailyChanceOfRain,
    int? dailyWillItSnow,
    int? dailyChanceOfSnow,
    int? uv,
  }) = _DayDto;
  factory DayDto.fromJson(JSON json) => _$DayDtoFromJson(json);
}
