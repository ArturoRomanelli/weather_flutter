import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dto/search_locations_dto.dart';
import '../sources/locations_api.dart';

part 'locations_repository.g.dart';

@riverpod
LocationsRepository locationsRepository(LocationsRepositoryRef ref) {
  final api = ref.watch(locationsApiProvider);
  return LocationsRepository(api);
}

class LocationsRepository {
  const LocationsRepository(this.api);
  final LocationsApi api;

  // TODO change return type
  Future<SearchLocationsDto> getLocations(String search) async {
    final result = await api.locations(q: search);

    // here we get a Iterable<Json>, thus we should return a List<SearchLocationsDto>
    return SearchLocationsDto.fromJson(result);
  }
}
