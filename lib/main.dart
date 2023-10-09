import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_flutter_app/config/routing/app_router.dart';
import 'package:simple_flutter_app/config/theme/app_theme.dart';
import 'package:simple_flutter_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp.router(
      title: 'Simple App',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(
        selectedColor: ref.watch(selectedColorProvider),
        isDark: ref.watch(isDarkProvider),
      ).getTheme(),
    );
  }
}
