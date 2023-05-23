import '../../data/repository/forecast_weather_repository.dart';
import '../adapters/forecast_weather_from_dto.dart';
import '../entities/forecast_weather.dart';
import '../entities/location.dart';

class ForecastWeatherService {
  const ForecastWeatherService(this.repository);
  final ForecastWeatherRepository repository;

  Future<ForecastWeather> getForecastWeather(Location location, int days) async {
    final result = await repository.getForecastWeather(location.cityName, days);

    return result.toDomain();
  }
}
