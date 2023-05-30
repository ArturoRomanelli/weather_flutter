import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/entities/current_location.dart';
import '../state/current_weather_location.dart';
import 'location_results_widget.dart';

class LocationSearchBar extends HookConsumerWidget {
  const LocationSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: '');
    final focusNode = useFocusNode();
    final isSearchEmpty = useListenableSelector(controller, () => controller.text.isEmpty);

    Future<void> dialogBuilder() async {
      final result = await showDialog<CurrentLocation?>(
        context: context,
        builder: (_) => LocationResultsWidget(controller.text),
      );
      // ignore: use_build_context_synchronously
      if (!context.mounted) return;
      // TODO use focusNode to unfocus
      if (result == null) return;

      ref.read(currentLocationControllerProvider.notifier).state = result;
      controller.clear();
    }

    // Use a SearchBar instead: the requirement is to have the exact same behavior
    // it is not mandatory to follow the current UI closely
    return ListTile(
      trailing: Ink(
        decoration: ShapeDecoration(
          color: Colors.blue.shade100,
          shape: const CircleBorder(),
        ),
        child: IconButton(
          icon: const Icon(Icons.search),
          onPressed: dialogBuilder,
        ),
      ),
      title: TextField(
        controller: controller,
        onSubmitted: (_) => dialogBuilder(),
        decoration: InputDecoration(
          prefixIcon: isSearchEmpty
              ? null
              : IconButton(
                  onPressed: controller.clear,
                  icon: const Icon(Icons.close),
                ),
          label: const Text('Cerca la tua città...'),
        ),
      ),
    );
  }
}
