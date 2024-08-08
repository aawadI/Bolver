import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/di/dependency_manager.dart';
import '../notifier/more_categories_notifier.dart';
import '../state/more_categories_state.dart';

final moreCategoriesProvider =
    StateNotifierProvider<MoreCategoriesNotifier, MoreCategoriesState>(
  (ref) => MoreCategoriesNotifier(categoriesRepository),
);
