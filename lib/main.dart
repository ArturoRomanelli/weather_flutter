import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';

import 'core/init.dart';
import 'core/weather_app.dart';
import 'logs/my_provider_observer.dart';
import 'logs/riverpod_logger.dart';

void main() {
  hierarchicalLoggingEnabled = true;
  final (logger, errorLogger) = initRiverpodLoggers();
  init();

  runApp(
    ProviderScope(
      observers: [MyProviderObserver(logger: logger, errorLogger: errorLogger)],
      child: const WeatherApp(),
    ),
  );
}
