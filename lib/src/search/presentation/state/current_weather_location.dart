import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/current_location.dart';

part 'current_weather_location.g.dart';

@riverpod
class CurrentLocationController extends _$CurrentLocationController {
  @override
  CurrentLocation build() {
    // final service = ref.watch(locationsServiceProvider);

    // final CurrentLocation =
    // Mock
    return const CurrentLocation(
      cityName: 'Udine',
      lat: 1,
      long: 2,
    );
  }
}
