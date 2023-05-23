import 'package:dio/dio.dart';
import 'package:weather_flutter/core/json.dart';

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
