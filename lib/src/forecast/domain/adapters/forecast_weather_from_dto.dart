import '../../data/dto/forecast_weather_dto.dart';
import '../entities/forecast_day.dart';
import '../entities/forecast_weather.dart';

extension ForecastWeatherFromDto on ForecastWeatherDto {
  ForecastWeather toDomain() {
    return ForecastWeather(
      updatedAt: current.lastUpdated,
      previsions: [
        ...forecast.forecastday.map(
          (dto) => ForecastDay(
            date: dto.date,
            temp: dto.day.avgtempC,
            weather: dto.day.condition.text,
          ),
        )
      ],
    );
  }
}
