import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/order_details_payment_state.dart';
import '../../../../../../../../repository/repository.dart';

class OrderDetailsPaymentNotifier
    extends StateNotifier<OrderDetailsPaymentState> {
  final PaymentsRepository _paymentsRepository;

  OrderDetailsPaymentNotifier(this._paymentsRepository)
      : super(const OrderDetailsPaymentState());

  Future<void> fetchAtbPayment({
    int? transactionId,
    VoidCallback? redirected,
  }) async {
    state = state.copyWith(isLoading: true);
    final response = await _paymentsRepository.getAtbPayment(transactionId);
    response.when(
      success: (data) async {
        state = state.copyWith(isLoading: false);
        if (!await launchUrl(Uri.parse(data.url ?? ''))) {
          throw 'Could not launch';
        }
        redirected?.call();
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('===> fetch atb payment fail $fail');
      },
    );
  }
}
