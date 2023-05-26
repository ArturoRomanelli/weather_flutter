import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../forecast/presentation/state/forecast_weather_state.dart';
import 'current_weather_state.dart';

part 'home_loading_state.g.dart';

@riverpod
FutureOr<void> homeLoading(HomeLoadingRef ref) async {
  await ref.watch(currentWeatherProvider.future);
  await ref.watch(forecastWeatherProvider.future);
}
