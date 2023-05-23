import '../dto/forecast_weather_dto.dart';
import '../sources/forecast_weather_api.dart';

class ForecastWeatherRepository {
  const ForecastWeatherRepository(this.api);
  final ForecastWeatherApi api;

  Future<ForecastWeatherDto> getForecastWeather(String city, int days) async {
    final result = await api.forecast(
      q: city,
      days: days,
    );

    return ForecastWeatherDto.fromJson(result);
  }
}
