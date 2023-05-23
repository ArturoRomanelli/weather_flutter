import '../../data/repository/current_weather_repository.dart';
import '../adapters/current_weather_from_dto.dart';
import '../entities/current_weather.dart';
import '../entities/location.dart';

class CurrentWeatherService {
  const CurrentWeatherService(this.repository);

  final CurrentWeatherRepository repository;

  Future<CurrentWeather> getCurrentWeather(Location location) async {
    final result = await repository.getCurrentWeather(location.cityName);

    return result.toDomain();
  }
}
