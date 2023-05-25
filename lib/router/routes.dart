import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../src/current_weather/presentation/pages/current_weather_page.dart';
import '../src/forecast/presentation/pages/forecast_weather_page.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CurrentWeatherPage();
  }
}

@TypedGoRoute<ForecastRoute>(path: '/forecast')
class ForecastRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ForecastWeatherPage();
  }
}
