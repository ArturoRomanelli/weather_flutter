import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_flutter/src/search/domain/services/locations_service.dart';

import '../../entities/locations.dart';

part 'locations_search.g.dart';

@riverpod
FutureOr<Locations> searchLocations(SearchLocationsRef ref) async {
  final service = ref.watch(locationsServiceProvider);

  final locations = service.getLocations(search);

  return locations;
}
