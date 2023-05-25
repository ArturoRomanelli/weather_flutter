import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_flutter/client/dio.dart';
import 'package:weather_flutter/core/json.dart';

part 'current_weather_api.g.dart';

@riverpod
CurrentWeatherApi currentWeatherApi(CurrentWeatherApiRef ref) {
  final client = ref.watch(httpClientProvider);

  return CurrentWeatherApi(client);
}

class CurrentWeatherApi {
  const CurrentWeatherApi(this.dio);
  final Dio dio;

  /// Accepts a query q and returns the current weather
  Future<JSON> current(String q) async {
    final result = await dio.get<JSON>(
      '/current.json',
      queryParameters: {'q': q},
    );

    final data = result.data!;

    return data;
  }
}
