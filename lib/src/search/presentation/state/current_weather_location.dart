// ignore_for_file: avoid_public_notifier_properties
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../current_location/domain/entities/current_location.dart';

part 'current_weather_location.g.dart';

@riverpod
class CurrentLocationController extends _$CurrentLocationController {
  @override
  CurrentLocation build() {
    return const CurrentLocation(
      cityName: 'Udine',
      country: 'Italy',
    );
  }

  @override
  set state(CurrentLocation value) {
    super.state = value;
  }
}
