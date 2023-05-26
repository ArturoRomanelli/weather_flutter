import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/weather_app.dart';
import 'logs/provider_observer.dart';

void main() {
  runApp(
    const ProviderScope(
      observers: [MyProviderObserver()],
      child: WeatherApp(),
    ),
  );
}
