// ignore_for_file: avoid_public_notifier_properties
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_flutter/src/current_location/domain/adapters/position_to_query_adapter.dart';

import '../../../search/domain/services/locations_service.dart';
import '../../domain/entities/current_location.dart';
import '../../domain/services/geolocation_service.dart';

part 'current_weather_location.g.dart';

@riverpod
class CurrentLocationController extends _$CurrentLocationController {
  @override
  Future<CurrentLocation> build() async {
    final geoService = ref.watch(geoLocationServiceProvider);
    final searchService = ref.watch(locationsServiceProvider);

    final currentPosition = await geoService.getGeoPosition();

    final q = currentPosition.associatedQuery;

    final locations = await searchService.getLocations(q);

    return locations.places.first;
  }

  void updateLocation(CurrentLocation location) {
    // TODO: leggere la documentazione di questa funziona
    // TLDR: aggiorna lo stato interno con una funzione che accetta come input lo stato precedente
    // update((p0) => null);
    state = AsyncValue.data(location);
  }
}
