class CurrentWeather {
  const CurrentWeather({
    required this.temp,
    required this.weather,
  });

  /// our current temperature
  final double temp;

  /// a human-readable text about the current weather
  final String weather;
}
