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
    required int tempC,
    int? lastupdatedepoch,
    double? tempf,
    int? isday,
    double? windmph,
    int? windkph,
    int? winddegree,
    String? winddir,
    int? pressuremb,
    double? pressurein,
    int? precipmm,
    int? precipin,
    int? humidity,
    int? cloud,
    double? feelslikec,
    double? feelslikef,
    int? viskm,
    int? vismiles,
    int? uv,
    double? gustmph,
    double? gustkph,
  }) = _CurrentDto;

  factory CurrentDto.fromJson(JSON json) => _$CurrentDtoFromJson(json);
}
