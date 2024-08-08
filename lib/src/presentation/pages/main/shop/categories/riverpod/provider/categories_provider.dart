import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/categories_state.dart';
import '../notifier/categories_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final categoriesProvider =
    StateNotifierProvider<CategoriesNotifier, CategoriesState>(
  (ref) => CategoriesNotifier(productsRepository, categoriesRepository),
);
