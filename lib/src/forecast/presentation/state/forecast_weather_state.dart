import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_flutter/src/forecast/domain/entities/forecast_weather.dart';

import '../../../search/presentation/state/current_weather_location.dart';
import '../../domain/services/forecast_weather_service.dart';

part 'forecast_weather_state.g.dart';

@riverpod
FutureOr<ForecastWeather> forecastWeather(ForecastWeatherRef ref) async {
  final service = ref.watch(forecastWeatherServiceProvider);
  final location = ref.watch(currentLocationControllerProvider);
  final forecastWeather = await service.getForecastWeather(location, 7);

  return forecastWeather;
}
