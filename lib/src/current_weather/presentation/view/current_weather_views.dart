import 'package:intl/intl.dart';

import '../../domain/entities/current_weather.dart';

extension HumidityView on CurrentWeather {
  String get formattedHumidity {
    final integerHumidity = humidity.round();
    return '$integerHumidity %';
  }

  // TODO create more views as needed
}

void suggestion() {
  // TODO read this https://api.flutter.dev/flutter/intl/NumberFormat-class.html
  final formatter = NumberFormat();
}
