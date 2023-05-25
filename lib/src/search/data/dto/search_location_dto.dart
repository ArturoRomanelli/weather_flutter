import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/json.dart';

part 'search_location_dto.freezed.dart';
part 'search_location_dto.g.dart';

@freezed
class SearchLocationDto with _$SearchLocationDto {
  const factory SearchLocationDto({
    required String name,
    int? id,
    String? region,
    String? country,
    double? lat,
    double? lon,
    String? url,
  }) = _SearchLocationDto;
  factory SearchLocationDto.fromJson(JSON json) => _$SearchLocationDtoFromJson(json);
}
