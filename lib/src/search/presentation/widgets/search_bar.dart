import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../current_location/domain/entities/current_location.dart';
import '../../../current_location/presentation/state/current_weather_location.dart';
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
      focusNode.unfocus();
      if (result == null) return;

      ref.read(currentLocationControllerProvider.notifier).updateLocation(result);
      controller.clear();
    }

    return SearchBar(
      focusNode: focusNode,
      controller: controller,
      backgroundColor: MaterialStateProperty.all(Theme.of(context).scaffoldBackgroundColor),
      trailing: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Ink(
            decoration: ShapeDecoration(
              color: Theme.of(context).primaryColor,
              shape: const CircleBorder(),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: dialogBuilder,
            ),
          ),
        ),
      ],
      leading: isSearchEmpty
          ? null
          : IconButton(
              onPressed: controller.clear,
              icon: const Icon(Icons.close),
            ),
      hintText: 'Cerca la tua città...',
    );
  }
}
