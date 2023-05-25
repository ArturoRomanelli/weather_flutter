import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/json.dart';
import 'search_location_dto.dart';

part 'search_locations_dto.freezed.dart';
part 'search_locations_dto.g.dart';

@freezed
class SearchLocationsDto with _$SearchLocationsDto {
  const factory SearchLocationsDto({
    @Default([]) Iterable<SearchLocationDto> locations,
  }) = _SearchLocationsDto;

  factory SearchLocationsDto.fromJson(JSON json) => _$SearchLocationsDtoFromJson(json);
}
