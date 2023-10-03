import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  static const String name = "buttons_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: Wrap(
          spacing: 5,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Button')),
            const ElevatedButton(
                onPressed: null, child: Text('Disabled button')),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.face),
              label: const Text('Elevated icon'),
            ),
            FilledButton(onPressed: () {}, child: const Text('Filled button')),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.access_alarm),
              label: const Text('Filled icon'),
            ),
            OutlinedButton(
                onPressed: () {}, child: const Text('Outlined button')),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.ramen_dining_outlined),
              label: const Text('Outlined icon'),
            ),
            TextButton(onPressed: () {}, child: const Text('Text button')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.abc_outlined),
                label: const Text('Text icon')),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.ice_skating),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colors.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white),
                //All is used for all the states of the button -> ex. splash
              ),
            ),
          ],
        ),
      ),
    );
  }
}
