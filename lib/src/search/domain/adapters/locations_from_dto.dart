import '../../data/dto/locations_dto.dart';
import '../entities/location.dart';
import '../entities/locations.dart';

extension LocationsFromDto on LocationsDto {
  Locations toDomain() {
    return Locations(
      places: [
        ...locations.map(
          (dto) => Location(
            name: dto.name,
          ),
        )
      ],
    );
  }
}
