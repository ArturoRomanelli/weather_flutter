import 'package:flutter/material.dart';
import 'package:weather_flutter/theme/dark_theme.dart';
import 'package:weather_flutter/theme/light_theme.dart';

import '../router/router.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
