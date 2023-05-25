import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CurrentWeatherPage extends HookWidget {
  const CurrentWeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            Image.network('<immagine>'),
            const Text('<previsione>'),
            const Text('<temperatura>')
          ],
        ),
      ),
    );
  }
}
