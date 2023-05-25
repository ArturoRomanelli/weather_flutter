import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_flutter/client/dio.dart';

import '../../../../core/json.dart';

part 'locations_api.g.dart';

@riverpod
LocationsApi locationsApi(LocationsApiRef ref) {
  final client = ref.watch(httpClientProvider);

  return LocationsApi(client);
}

class LocationsApi {
  const LocationsApi(this.dio);
  final Dio dio;

  Future<JSON> locations({required String q}) async {
    final result = await dio.get<JSON>(
      '/search.json',
      queryParameters: {'q': q},
    );

    final data = result.data!;

    return data;
  }
}
