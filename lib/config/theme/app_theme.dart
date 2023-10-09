import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.teal,
  Colors.pink,
  Colors.yellow,
  Colors.orange,
];

class AppTheme {
  final int selectedColor;
  final bool isDark;

  AppTheme({this.selectedColor = 0, this.isDark = false})
      : assert(selectedColor >= 0, 'Color selected must be over 0'),
        assert(selectedColor < colorList.length,
            'Selected color can not exceed ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      brightness: isDark ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(centerTitle: false));
}
