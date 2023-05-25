import 'package:dio/dio.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio.g.dart';

@riverpod
Dio httpClient(HttpClientRef ref) {
  final options = BaseOptions(
    baseUrl: 'https://api.weatherapi.com/v1',
    receiveTimeout: 12.seconds,
    queryParameters: {'key': 'your_key'},
  );

  return Dio(options);
}
