import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_flutter_app/presentation/providers/counter_provider.dart';
import 'package:simple_flutter_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  static const String name = 'Counter Screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counterValue = ref.watch(counterProvider);
    final bool isDark = ref.watch(isDarkProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(isDarkProvider.notifier).update((state) => !state);
            },
            icon: isDark
                ? const Icon(Icons.dark_mode)
                : const Icon(Icons.light_mode),
          )
        ],
      ),
      body: Center(
        child: Text(
          'Value: $counterValue',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Dentro de acciones no se recomienda usar watch() sino read()
          ref.read(counterProvider.notifier).state++;
          // ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
