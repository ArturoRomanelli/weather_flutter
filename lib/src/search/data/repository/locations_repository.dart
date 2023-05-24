import '../dto/locations_dto.dart';
import '../sources/locations_api.dart';

class LocationsRepository {
  const LocationsRepository(this.api);
  final LocationsApi api;

  Future<LocationsDto> getLocations(String search) async {
    final result = await api.locations(q: search);

    return LocationsDto.fromJson(result);
  }
}
