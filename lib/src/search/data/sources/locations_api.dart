import 'package:dio/dio.dart';

import '../../../../core/json.dart';

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
