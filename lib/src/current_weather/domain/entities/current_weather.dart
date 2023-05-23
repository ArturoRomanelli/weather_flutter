import 'location.dart';

class CurrentWeather {
  const CurrentWeather({
    required this.temp,
    required this.location,
  });

  /// our current temperature
  final double temp;

  /// the location of the forecast
  final Location location;
}
