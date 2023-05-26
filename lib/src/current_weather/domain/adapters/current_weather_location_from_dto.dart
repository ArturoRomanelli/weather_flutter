import 'package:weather_flutter/src/current_weather/data/dto/current_weather_location_dto.dart';

import '../entities/current_location.dart';

extension CurrentWeatherLocationFromDto on CurrentWeatherLocationDto {
  CurrentLocation toDomain() {
    return CurrentLocation(cityName: name);
  }
}
