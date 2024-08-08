import '../models/models.dart';
import '../core/handlers/handlers.dart';

abstract class OrdersRepository {

  Future<ApiResult<DeliveryResponse>> getDelivery();

  Future<ApiResult<CreateOrderResponse>> createOrder(OrderBodyData orderBody);

  Future<ApiResult<OrderPaginateResponse>> getCompletedOrders(int page);

  Future<ApiResult<OrderPaginateResponse>> getOpenOrders(int page);

  Future<ApiResult<OrderPaginateResponse>> getReadyOrders(int page);

  Future<ApiResult<OrderPaginateResponse>> getOnTheWayOrders(int page);

  Future<ApiResult<OrderPaginateResponse>> getCanceledOrders(int page);

  Future<ApiResult<SingleOrderResponse>> getSingleOrder(int orderId);

  Future<ApiResult<void>> addReview(
    int orderId, {
    required double rating,
    required String comment,
    required String name,
     bool isDeliveryReview = false,
  });

  Future<ApiResult<void>> cancelOrder(int orderId);

  Future<ApiResult<CouponResponse>> checkCoupon({
    required String coupon,
    required int shopId,
  });

  Future<ApiResult<CashbackResponse>> checkCashback({required double amount});
}
