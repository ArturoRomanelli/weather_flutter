import '../../data/dto/current_weather_dto.dart';
import '../entities/current_weather.dart';

extension CurrentWeatherFromDto on CurrentWeatherDto {
  CurrentWeather toDomain() => CurrentWeather(
        temp: current.tempC,
        weather: current.condition.text,
        updatedAt: current.lastUpdated,
      );
}
