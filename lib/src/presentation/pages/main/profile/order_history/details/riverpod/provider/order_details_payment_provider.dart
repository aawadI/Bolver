import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/order_details_payment_state.dart';
import '../notifier/order_details_payment_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final orderDetailsPaymentProvider = StateNotifierProvider.autoDispose<
    OrderDetailsPaymentNotifier, OrderDetailsPaymentState>(
  (ref) => OrderDetailsPaymentNotifier(paymentsRepository),
);
