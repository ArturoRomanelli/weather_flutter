import '../dto/current_weather_dto.dart';
import '../sources/current_weather_api.dart';

class CurrentWeatherRepository {
  const CurrentWeatherRepository(this.api);
  final CurrentWeatherApi api;

  Future<CurrentWeatherDto> getCurrentWeather(String city) async {
    final result = await api.current(city);

    return CurrentWeatherDto.fromJson(result);
  }
}
