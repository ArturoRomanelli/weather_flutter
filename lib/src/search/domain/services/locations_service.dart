import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repository/locations_repository.dart';
import '../adapters/locations_from_dto.dart';
import '../entities/locations.dart';

part 'locations_service.g.dart';

@riverpod
LocationsService locationsService(LocationsServiceRef ref) {
  final repo = ref.watch(locationsRepositoryProvider);
  return LocationsService(repo);
}

class LocationsService {
  const LocationsService(this.repository);
  final LocationsRepository repository;

  Future<Locations> getLocations(String search) async {
    final result = await repository.getLocations(search);

    return result.toDomain();
  }
}
