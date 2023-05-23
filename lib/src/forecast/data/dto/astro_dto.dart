import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/json.dart';

part 'astro_dto.freezed.dart';
part 'astro_dto.g.dart';

@freezed
class AstroDto with _$AstroDto {
  const factory AstroDto(
    String? sunrise,
    String? sunset,
    String? moonrise,
    String? moonset,
    String? moonPhase,
    String? moonIllumination,
    int? isMoonUp,
    int? isSunUp,
  ) = _AstroDto;

  factory AstroDto.fromJson(JSON json) => _$AstroDtoFromJson(json);
}
