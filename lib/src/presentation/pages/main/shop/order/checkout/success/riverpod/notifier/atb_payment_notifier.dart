import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../state/atb_payment_state.dart';
import '../../../../../../../../../repository/repository.dart';

class AtbPaymentNotifier extends StateNotifier<AtbPaymentState> {
  final PaymentsRepository _paymentsRepository;

  AtbPaymentNotifier(this._paymentsRepository) : super(const AtbPaymentState());

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
        } else {
          redirected?.call();
        }
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('===> fetch atb payment fail $fail');
      },
    );
  }
}
