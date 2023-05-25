import '../dto/search_locations_dto.dart';
import '../sources/locations_api.dart';

class LocationsRepository {
  const LocationsRepository(this.api);
  final LocationsApi api;

  Future<SearchLocationsDto> getLocations(String search) async {
    final result = await api.locations(q: search);

    return SearchLocationsDto.fromJson(result);
  }
}
