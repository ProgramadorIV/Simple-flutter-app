import 'package:flutter/material.dart';

class UIControlScreen extends StatelessWidget {
  const UIControlScreen({super.key});

  static const name = 'ui_controls_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI controls'),
      ),
      body: const _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum WhichCameFirst { egg, chicken, trex }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = true;
  WhichCameFirst? selected;
  bool firstPlate = false;
  bool secondPlate = false;
  bool dessert = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          value: isDeveloper,
          title: const Text('Developer mode'),
          subtitle: const Text('Additional controls'),
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),
        ExpansionTile(
          title: const Text('data'),
          subtitle: Text(selected.toString()),
          children: [
            RadioListTile(
              value: WhichCameFirst.chicken,
              title: const Text('Chicken'),
              groupValue: selected,
              onChanged: (value) => setState(() {
                selected = WhichCameFirst.chicken;
              }),
            ),
            RadioListTile(
              value: WhichCameFirst.egg,
              title: const Text('Egg'),
              groupValue: selected,
              onChanged: (value) => setState(() {
                selected = WhichCameFirst.egg;
              }),
            ),
            RadioListTile(
              value: WhichCameFirst.trex,
              title: const Text('T. Rex'),
              groupValue: selected,
              onChanged: (value) => setState(() {
                selected = WhichCameFirst.trex;
              }),
            ),
          ],
        ),
        ExpansionTile(
          title: const Text('Desired food'),
          children: [
            CheckboxListTile(
              title: const Text('Want first plate'),
              value: firstPlate,
              onChanged: (value) => setState(() {
                firstPlate = !firstPlate;
              }),
            ),
            CheckboxListTile(
              title: const Text('Want second plate'),
              value: secondPlate,
              onChanged: (value) => setState(() {
                secondPlate = !secondPlate;
              }),
            ),
            CheckboxListTile(
              title: const Text('Want dessert'),
              value: dessert,
              onChanged: (value) => setState(() {
                dessert = !dessert;
              }),
            ),
          ],
        ),
      ],
    );
  }
}
