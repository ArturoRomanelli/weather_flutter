import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';

import 'core/weather_app.dart';
import 'logs/provider_observer.dart';

void main() {
  hierarchicalLoggingEnabled = true;

  runApp(
    const ProviderScope(
      observers: [MyProviderObserver()],
      child: WeatherApp(),
    ),
  );
}
