import '../../data/dto/forecast_day_dto.dart';
import '../entities/forecast_day.dart';

extension ForecastDayFromDto on ForecastDayDto {
  ForecastDay toDomain() => ForecastDay(
        temp: day.avgtempC,
        weather: day.condition.text,
        date: date,
      );
}
