import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_flutter_app/config/theme/app_theme.dart';

final isDarkProvider = StateProvider((ref) => false);

final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0);

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<AppTheme> {
  //Así el estado es un objeto de tipo AppTheme
  ThemeNotifier() : super(AppTheme());

  void changeMode() {
    state = state.copyWith(isDark: !state.isDark);
  }

  void changeTheme(int selectedColor) {
    state = state.copyWith(selectedColor: selectedColor);
  }
}
