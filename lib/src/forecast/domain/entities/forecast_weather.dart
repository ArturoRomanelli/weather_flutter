import 'forecast_day.dart';

class ForecastWeather {
  const ForecastWeather({
    required this.updatedAt,
    required this.previsions,
  });

  /// latest update of the weather conditions
  final DateTime updatedAt;

  /// list of forecasts of the next days
  final List<ForecastDay> previsions;
}
