import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/saved_stores_state.dart';
import '../notifier/saved_stores_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final savedStoresProvider =
    StateNotifierProvider.autoDispose<SavedStoresNotifier, SavedStoresState>(
  (ref) => SavedStoresNotifier(shopsRepository),
);
