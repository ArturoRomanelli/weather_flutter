import '../entities/current_weather.dart';
import '../entities/location.dart';

abstract class CurrentWeatherService {
  CurrentWeather getCurrentWeather(Location location);
}
