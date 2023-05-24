import '../../data/repository/locations_repository.dart';
import '../adapters/locations_from_dto.dart';
import '../entities/locations.dart';

class LocationsService {
  const LocationsService(this.repository);
  final LocationsRepository repository;

  Future<Locations> getLocations(String search) async {
    final result = await repository.getLocations(search);

    return result.toDomain();
  }
}
