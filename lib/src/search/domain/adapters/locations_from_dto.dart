import '../../data/dto/search_location_dto.dart';
import '../entities/current_location.dart';

extension LocationsFromDto on SearchLocationDto {
  CurrentLocation toDomain() {
    return CurrentLocation(
      cityName: name,
      lat: lat,
      long: lon,
      country: country,
    );
  }
}
