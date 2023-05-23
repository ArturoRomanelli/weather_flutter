import '../dto/forecast_dto.dart';
import '../sources/forecast_weather_api.dart';

class ForecastWeatherRepository {
  const ForecastWeatherRepository(this.api);
  final ForecastWeatherApi api;

  Future<ForecastDto> getForecastWeather(String city, int days) async {
    final result = await api.current(city, days);

    return ForecastDto.fromJson(result);
  }
}
