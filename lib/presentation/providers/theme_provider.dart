import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_flutter_app/config/theme/app_theme.dart';

final isDarkProvider = StateProvider((ref) => false);

final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0);
