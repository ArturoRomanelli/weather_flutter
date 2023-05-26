import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../logs/http_logger.dart';

part 'dio.g.dart';

@riverpod
Dio httpClient(HttpClientRef ref) {
  final options = BaseOptions(
    baseUrl: 'https://api.weatherapi.com/v1',
    receiveTimeout: 12.seconds,
    queryParameters: {'key': 'your_key'},
  );
  final httpLogger = ref.watch(httpLoggerProvider);
  final loggerInterceptor = PrettyDioLogger(
    logPrint: httpLogger.info,
    responseBody: false,
  );

  final dio = Dio(options);
  if (kDebugMode) dio.interceptors.add(loggerInterceptor);

  ref.keepAlive();
  return dio;
}
