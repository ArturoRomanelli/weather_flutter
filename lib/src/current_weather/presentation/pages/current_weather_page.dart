// ignore_for_file: use_colored_box

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../forecast/presentation/state/forecast_weather_state.dart';
import '../../../search/presentation/state/locations_search.dart';
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
          ListTile(
            leading: isSearchEmpty
                ? null
                : IconButton(
                    onPressed: controller.clear,
                    icon: const Icon(Icons.close),
                  ),
            trailing: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => _dialogBuilder(context, controller.text),
            ),
            title: TextField(
              controller: controller,
              decoration: const InputDecoration(
                label: Text('Cerca la tua città...'),
              ),
            ),
          ),
          Flexible(
            child: ListView(
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
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Center(
                            child: Text(
                              // TODO spiegare
                              DateFormat.yMMMd().format(DateTime.now()),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(child: Text(currentWeather.weather)),
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          '${currentWeather.temp}°C',
                          style: const TextStyle(fontSize: 75),
                        ),
                      ),
                      Image.network(
                        currentWeather.image,
                        height: 80,
                        fit: BoxFit.fitHeight,
                      ),
                      const SizedBox(height: 20),
                      const Center(child: Text('Il meteo di oggi!')),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: _WeatherIcon(
                                icon: Icons.air,
                                title: '${currentWeather.wind} km/h',
                                subtitle: 'Vento',
                              ),
                            ),
                            Expanded(
                              child: _WeatherIcon(
                                icon: Icons.water_drop_outlined,
                                title: '${currentWeather.humidity} %',
                                subtitle: 'Umidità',
                              ),
                            ),
                            Expanded(
                              child: _WeatherIcon(
                                icon: Icons.thermostat,
                                title: '${currentWeather.perceivedtemp} °C',
                                subtitle: 'Temp. percepita',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (final element in forecastWeather.previsions)
                                ForecastBox(
                                  temp: element.temp,
                                  image: element.image,
                                  date: element.date,
                                )
                            ],
                          ),
                        ),
                      ),
                    ];
                  },
                  error: (error, stackTrace) => [
                    const Icon(Icons.sentiment_very_dissatisfied),
                    const Text('Qualcosa è andato storto'),
                  ],
                  loading: () => [
                    const Center(child: CircularProgressIndicator()),
                    const SizedBox(height: 20),
                    const Center(child: Text('Loading...')),
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

Future<void> _dialogBuilder(BuildContext context, String search) {
  return showDialog<void>(
    context: context,
    builder: (_) => _LocationResultsWidget(search),
  );
}

class _LocationResultsWidget extends HookConsumerWidget {
  const _LocationResultsWidget(this.query);
  final String query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locations = ref.watch(searchLocationsProvider(query));
    final selectedLocation = useState('...');

    return AlertDialog(
      title: const Text('Stavi cercando...'),
      content: locations.when(
        data: (data) => const Text(''), // usa lista con ListTile
        error: (error, stackTrace) => const Center(child: Text("C'è stato un errore")),
        loading: () => const Text('Caricamento...'),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          onPressed: context.pop,
          child: const Text('Annulla'),
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          onPressed: locations.isLoading ? null : () => context.pop('lo stato che sto cambiando'),
          child: const Text('Seleziona'),
        ),
      ],
    );
  }
}

class ForecastBox extends StatelessWidget {
  const ForecastBox({
    super.key,
    required this.temp,
    required this.image,
    required this.date,
  });

  final double temp;
  final String image;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final sizeFactor = MediaQuery.of(context).textScaleFactor;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 8,
        ),
        child: Column(
          children: [
            AutoSizeText(
              '$temp °C',
              maxLines: 1,
              style: textTheme.labelLarge?.copyWith(
                color: Colors.white,
                fontSize: Theme.of(context).textTheme.labelLarge?.fontSize ?? 0 / sizeFactor,
              ),
            ),
            Image.network(
              image,
            ),
            AutoSizeText(
              DateFormat.MMMd().format(date),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.labelSmall?.copyWith(
                color: Colors.white,
                fontSize: 10 / sizeFactor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WeatherIcon extends StatelessWidget {
  const _WeatherIcon({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final sizeFactor = MediaQuery.of(context).textScaleFactor;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 48 / sizeFactor,
              color: Colors.white,
            ),
            AutoSizeText(
              title,
              maxLines: 1,
              style: textTheme.labelLarge?.copyWith(
                color: Colors.white,
                fontSize: textTheme.labelLarge?.fontSize ?? 0 / sizeFactor,
              ),
            ),
            AutoSizeText(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.labelSmall?.copyWith(
                color: Colors.white,
                fontSize: 10 / sizeFactor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
