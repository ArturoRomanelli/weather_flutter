import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../state/current_weather_state.dart';

class CurrentWeatherPage extends HookConsumerWidget {
  const CurrentWeatherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeather = ref.watch(currentWeatherProvider);

    final controller = useTextEditingController(text: '');
    final isSearchEmpty = useListenableSelector(controller, () => controller.text.isEmpty);

    return Scaffold(
      appBar: AppBar(title: const Text('La mia App')),
      body: Center(
        child: Column(
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
            const Text('Il meteo di oggi!'),
            const SizedBox(height: 20),
            Image.network('<immagine>'),
            const SizedBox(height: 20),
            const Text('<previsione>'),
            const Text('<temperatura>')
          ],
        ),
      ),
    );
  }
}
