import 'package:freezed_annotation/freezed_annotation.dart';

part 'atb_payment_state.freezed.dart';

@freezed
class AtbPaymentState with _$AtbPaymentState {
  const factory AtbPaymentState({@Default(false) bool isLoading}) =
      _AtbPaymentState;

  const AtbPaymentState._();
}
