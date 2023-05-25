import '../../data/dto/search_locations_dto.dart';
import '../entities/location.dart';
import '../entities/locations.dart';

extension LocationsFromDto on SearchLocationsDto {
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
