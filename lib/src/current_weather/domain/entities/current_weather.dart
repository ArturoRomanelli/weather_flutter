class CurrentWeather {
  const CurrentWeather({
    required this.temp,
    required this.weather,
    required this.updatedAt,
  });

  /// our current temperature
  final int temp;

  /// a human-readable text about the current weather
  final String weather;

  /// latest update of the weather condition
  final DateTime updatedAt;
}
