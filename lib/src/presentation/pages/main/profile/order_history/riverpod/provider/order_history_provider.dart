import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/order_history_state.dart';
import '../notifier/order_history_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final orderHistoryProvider =
    StateNotifierProvider.autoDispose<OrderHistoryNotifier, OrderHistoryState>(
  (ref) => OrderHistoryNotifier(ordersRepository),
);
