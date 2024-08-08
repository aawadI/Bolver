import '../core/handlers/handlers.dart';
import '../models/models.dart';

abstract class PaymentsRepository {
  Future<ApiResult<AtbPaymentResponse>> getAtbPayment(int? transactionId);

  Future<ApiResult<PaymentsResponse>> getPayments();

  Future<ApiResult<SingleOrderResponse>> createTransaction({
    required int orderId,
    required int paymentId,
  });
}
