import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/json.dart';

part 'location_dto.freezed.dart';
part 'location_dto.g.dart';

@freezed
class LocationDto with _$LocationDto {
  const factory LocationDto({
    String? name,
    String? region,
    String? country,
    double? lat,
    double? lon,
    String? tzId,
    int? localtimeepoch,
    String? localtime,
  }) = _LocationDto;

  factory LocationDto.fromJson(JSON json) => _$LocationDtoFromJson(json);
}
