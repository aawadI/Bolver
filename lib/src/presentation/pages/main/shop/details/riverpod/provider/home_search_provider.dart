import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/home_search_state.dart';
import '../notifier/home_search_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final homeSearchProvider =
    StateNotifierProvider<HomeSearchNotifier, HomeSearchState>(
  (ref) => HomeSearchNotifier(productsRepository),
);
