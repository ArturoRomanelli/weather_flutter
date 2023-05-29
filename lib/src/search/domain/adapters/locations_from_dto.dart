import '../../data/dto/search_locations_dto.dart';
import '../entities/current_location.dart';
import '../entities/locations.dart';

extension LocationsFromDto on SearchLocationsDto {
  Locations toDomain() {
    return Locations(
      places: [
        ...locations.map(
          (dto) => CurrentLocation(
            cityName: dto.name,
            lat: dto.lat,
            long: dto.lon,
            country: dto.country,
          ),
        )
      ],
    );
  }
}
