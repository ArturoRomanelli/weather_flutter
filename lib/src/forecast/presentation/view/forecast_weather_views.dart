import 'package:intl/intl.dart';
import 'package:weather_flutter/src/forecast/domain/entities/forecast_day.dart';

extension TemperatureView on ForecastDay {
  String get formattedTemperature {
    final oneDecimalFormat = NumberFormat('##0.#');
    final formattedTemp = oneDecimalFormat.format(temp);
    return '$formattedTemp °C';
  }
}
