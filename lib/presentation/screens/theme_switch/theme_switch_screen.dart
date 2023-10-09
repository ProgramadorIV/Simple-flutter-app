import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_flutter_app/presentation/providers/theme_provider.dart';

class ThemeSwitchScreen extends ConsumerWidget {
  const ThemeSwitchScreen({super.key});

  static const name = 'theme_switch_name';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Switcher'),
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
      body: const _ThemeSwitchView(),
    );
  }
}

class _ThemeSwitchView extends ConsumerWidget {
  const _ThemeSwitchView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(selectedColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];

        return RadioListTile(
          value: index,
          groupValue: selectedColor,
          title: Text(
            'Color sample',
            style: TextStyle(color: color),
          ),
          activeColor: color,
          onChanged: (value) {
            ref.read(selectedColorProvider.notifier).state = index;
          },
        );
      },
    );
  }
}
