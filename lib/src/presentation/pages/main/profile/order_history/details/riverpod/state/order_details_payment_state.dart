import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_details_payment_state.freezed.dart';

@freezed
class OrderDetailsPaymentState with _$OrderDetailsPaymentState {
  const factory OrderDetailsPaymentState({@Default(false) bool isLoading}) =
      _OrderDetailsPaymentStatee;

  const OrderDetailsPaymentState._();
}
