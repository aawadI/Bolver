import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/home_categories_state.dart';
import '../notifier/home_categories_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final homeCategoriesProvider =
    StateNotifierProvider<HomeCategoriesNotifier, HomeCategoriesState>(
  (ref) => HomeCategoriesNotifier(categoriesRepository),
);
