import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../forecast/presentation/state/forecast_weather_state.dart';
import '../../../search/domain/presentation/state/current_weather_location.dart';
import '../state/current_weather_state.dart';
import '../state/home_loading_state.dart';

class CurrentWeatherPage extends HookConsumerWidget {
  const CurrentWeatherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeLoadingResult = ref.watch(homeLoadingProvider);
    final currentLocation = ref.watch(currentLocationProvider);

    final controller = useTextEditingController(text: '');
    final isSearchEmpty = useListenableSelector(controller, () => controller.text.isEmpty);

    return Scaffold(
      appBar: AppBar(title: Center(child: Text(currentLocation.cityName))),
      body: Column(
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              label: const Text('Cerca la tua città...'),
              prefixIcon: const Icon(Icons.search),
              suffixIcon: isSearchEmpty
                  ? null
                  : IconButton(
                      onPressed: controller.clear,
                      icon: const Icon(Icons.close),
                    ),
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...homeLoadingResult.when(
                  data: (data) {
                    final currentWeather = ref.watch(
                      currentWeatherProvider.select((value) => value.requireValue),
                    );
                    final forecastWeather = ref.watch(
                      forecastWeatherProvider.select((value) => value.requireValue),
                    );

                    return [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Text(
                            DateFormat.yMMMd().format(DateTime.now()),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(currentWeather.weather),
                      const SizedBox(height: 20),
                      Text(
                        '${currentWeather.temp}°C',
                        style: const TextStyle(fontSize: 75),
                      ),
                      Image.network(currentWeather.image),
                      const SizedBox(height: 20),
                      const Text('Il meteo di oggi!'),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 80,
                        width: 270,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 90,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.air,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        ' km/h',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Vento',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 90,
                                child: Center(
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.water_drop_outlined,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        '${currentWeather.humidity} %',
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      const Text(
                                        'Umidità',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 90,
                                child: Center(
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.thermostat,
                                        size: 50,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        '${currentWeather.perceivedtemp} °C',
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      const Text(
                                        'Temp. percepita',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const Spacer(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ];
                  },
                  error: (error, stackTrace) => [
                    const Icon(Icons.sentiment_very_dissatisfied),
                    const Text('Qualcosa è andato storto'),
                  ],
                  loading: () => [
                    const CircularProgressIndicator(),
                    const Text('Loading...'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
