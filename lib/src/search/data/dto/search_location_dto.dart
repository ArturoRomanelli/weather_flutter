import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/json.dart';

part 'search_location_dto.freezed.dart';
part 'search_location_dto.g.dart';

@freezed
class SearchLocationDto with _$SearchLocationDto {
  const factory SearchLocationDto({
    required String name,
    required String country,
    int? id,
    String? region,
    double? lat,
    double? lon,
    String? url,
  }) = _SearchLocationDto;
  factory SearchLocationDto.fromJson(JSON json) => _$SearchLocationDtoFromJson(json);
}
