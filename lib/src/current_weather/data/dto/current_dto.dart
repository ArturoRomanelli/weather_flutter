import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_flutter/core/json.dart';

import 'condition_dto.dart';

part 'current_dto.freezed.dart';
part 'current_dto.g.dart';

@freezed
class CurrentDto with _$CurrentDto {
  const factory CurrentDto({
    required ConditionDto condition,
    required DateTime lastUpdated,
    required double tempC,
    required double windkph,
    required double humidity,
    required double feelslikec,
    int? lastupdatedepoch,
    double? tempf,
    int? isday,
    double? windmph,
    double? winddegree,
    String? winddir,
    double? pressuremb,
    double? pressurein,
    double? precipmm,
    double? precipin,
    double? cloud,
    double? feelslikef,
    double? viskm,
    double? vismiles,
    double? uv,
    double? gustmph,
    double? gustkph,
  }) = _CurrentDto;

  factory CurrentDto.fromJson(JSON json) => _$CurrentDtoFromJson(json);
}
