import 'package:weather_flutter/src/forecast/domain/entities/forecast_day.dart';

import '../../data/dto/forecast_day_dto.dart';

extension ForecastDayFromDto on ForecastDayDto {
  ForecastDay toDomain() =>
      ForecastDay(temp: day.avgtempC, weather: day.condition.text, date: date);
}
