import 'package:flutter_animate/flutter_animate.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_flutter/utility/riverpod/cache_for.dart';

import '../../../search/domain/presentation/state/current_weather_location.dart';
import '../../domain/entities/current_weather.dart';
import '../../domain/services/current_weather_service.dart';

part 'current_weather_state.g.dart';

@riverpod
FutureOr<CurrentWeather> currentWeather(CurrentWeatherRef ref) async {
  final service = ref.watch(currentWeatherServiceProvider);
  final location = ref.watch(currentLocationProvider);
  final currentWeather = await service.getCurrentWeather(location);

  ref.cacheFor(10.minutes);
  return currentWeather;
}
