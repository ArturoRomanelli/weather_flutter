import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/json.dart';
import 'condition_dto.dart';

part 'current_dto.freezed.dart';
part 'current_dto.g.dart';

@freezed
class CurrentDto with _$CurrentDto {
  const factory CurrentDto({
    required ConditionDto condition,
    int? lastUpdatedEpoch,
    required DateTime lastUpdated,
    int? tempC,
    double? tempF,
    int? isDay,
    double? windMph,
    double? windKph,
    int? windDegree,
    String? windDir,
    int? pressureMb,
    double? pressureIn,
    int? precipMm,
    int? precipIn,
    int? humidity,
    int? cloud,
    double? feelslikeC,
    double? feelslikeF,
    int? visKm,
    int? visMiles,
    int? uv,
    double? gustMph,
    double? gustKph,
  }) = _CurrentDto;

  factory CurrentDto.fromJson(JSON json) => _$CurrentDtoFromJson(json);
}
