import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/di/dependency_manager.dart';
import '../notifier/profitable_notifier.dart';
import '../state/profitable_state.dart';

final profitableProvider =
    StateNotifierProvider.autoDispose<ProfitableNotifier, ProfitableState>(
  (ref) => ProfitableNotifier(productsRepository),
);
