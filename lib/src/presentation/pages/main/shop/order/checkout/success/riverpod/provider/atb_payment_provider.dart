import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/atb_payment_state.dart';
import '../notifier/atb_payment_notifier.dart';
import '../../../../../../../../../core/di/dependency_manager.dart';

final atbPaymentProvider =
    StateNotifierProvider.autoDispose<AtbPaymentNotifier, AtbPaymentState>(
  (ref) => AtbPaymentNotifier(paymentsRepository),
);
