import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/discounts_state.dart';
import '../notifier/discounts_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final discountsProvider =
    StateNotifierProvider.autoDispose<DiscountsNotifier, DiscountsState>(
  (ref) => DiscountsNotifier(productsRepository),
);
