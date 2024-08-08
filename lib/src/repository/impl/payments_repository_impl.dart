import 'dart:convert';

import 'package:flutter/material.dart';

import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';
import '../../core/utils/utils.dart';
import '../../models/models.dart';
import '../repository.dart';

class PaymentsRepositoryImpl extends PaymentsRepository {
  @override
  Future<ApiResult<AtbPaymentResponse>> getAtbPayment(
      int? transactionId) async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response =
          await client.put('/api/v1/payments/payment-atb/$transactionId');
      return ApiResult.success(
        data: AtbPaymentResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get atb payment failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<PaymentsResponse>> getPayments() async {
    final data = {'lang': LocalStorage.instance.getLanguage()?.locale};
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response =
          await client.get('/api/v1/rest/payments', queryParameters: data);
      return ApiResult.success(
        data: PaymentsResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get payments failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<SingleOrderResponse>> createTransaction({
    required int orderId,
    required int paymentId,
  }) async {
    final data = {'payment_sys_id': paymentId, "status": 'paid'};
    debugPrint('===> create transaction body: ${jsonEncode(data)}');
    debugPrint('===> create transaction order id: $orderId');
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/payments/order/$orderId/transactions',
        data: data,
      );
      return ApiResult.success(
        data: SingleOrderResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> create transaction failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
