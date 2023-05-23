import 'package:dio/dio.dart';
import 'package:weather_flutter/core/json.dart';

class CurrentWeatherApi {
  const CurrentWeatherApi(this.dio);
  final Dio dio;

  Future<Json> current(String city) async {
    final result = await dio.get<Json>(
      '/current.json',
      queryParameters: {'q': city},
    );

    final data = result.data!;

    return data;
  }
}
