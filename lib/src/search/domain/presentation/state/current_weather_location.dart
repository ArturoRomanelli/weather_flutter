import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../entities/current_location.dart';

part 'current_weather_location.g.dart';

@riverpod
CurrentLocation currentLocation(CurrentLocationRef ref) {
  // Mock
  return const CurrentLocation(
    cityName: 'Udine',
    lat: 1,
    long: 2,
  );
}
