import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_flutter/core/json.dart';

part 'condition_dto.freezed.dart';
part 'condition_dto.g.dart';

@freezed
class ConditionDto with _$ConditionDto {
  const factory ConditionDto({
    required String text,
    String? icon,
    int? code,
  }) = _ConditionDto;
  factory ConditionDto.fromJson(JSON json) => _$ConditionDtoFromJson(json);
}
