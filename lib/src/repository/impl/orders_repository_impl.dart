import 'dart:convert';
import 'package:flutter/material.dart';

import '../repository.dart';
import '../../models/models.dart';
import '../../core/utils/utils.dart';
import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';

class OrdersRepositoryImpl extends OrdersRepository {

  @override
  Future<ApiResult<DeliveryResponse>> getDelivery() async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'lang': LocalStorage.instance.getLanguage()?.locale,
      'perPage': 10,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response =
          await client.get('/api/v1/rest/delivery', queryParameters: data);
      return ApiResult.success(data: DeliveryResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('===> get delivery error $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<CreateOrderResponse>> createOrder(
    OrderBodyData orderBody,
  ) async {
    Map<String, dynamic> orderBodyMap = {
      "note" : orderBody.note,
      'user_id': orderBody.userId,
      'total': orderBody.total,
      'currency_id': orderBody.currencyId,
      'rate': orderBody.currencyRate,
      "delivery_id": orderBody.deliveryId,
      if(orderBody.coupon?.isNotEmpty ?? false ) 'coupon': orderBody.coupon,

    };
    List<Map<String, dynamic>> shops = [];
    List<Map<String, dynamic>> products = [];
    for (final shop in orderBody.shops) {
      for (final product in shop.products) {
        if(shop.shopId == product.shopId) {
          products.add(
            {
              // 'product_id': product.stockId,
              'id' : product.stockId,
              'price': product.price,
              'qty': product.quantity,
              'tax': product.tax,
              'discount': product.discount,
              'total_price': product.totalPrice,
            },
          );
        }
      }
      shops.add(
        {
          'shop_id': shop.shopId,
          'delivery_fee': shop.deliveryFee,
          'delivery_type_id': shop.deliveryTypeId,
          if (shop.deliveryAddressId != null)
            'delivery_address_id': shop.deliveryAddressId,
          if (shop.deliveryDate != null) 'delivery_date': shop.deliveryDate,
          if (shop.deliveryTime != null) 'delivery_time': shop.deliveryTime,
          'delivery_type':  orderBody.deliveryType,
          'coupon': orderBody.coupon,
          'tax': shop.tax,
          'products': products,
        },
      );
      products = [];
    }
    // orderBodyMap['shops'] = shops;
    orderBodyMap.putIfAbsent('shops', () => shops);
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response =
      await client.post('/api/v1/dashboard/user/orders', data: orderBodyMap);
      return ApiResult.success(
        data: CreateOrderResponse.fromJson(response.data),
      );
    } catch (e, s) {
      debugPrint('==> order create failure: $e');
      debugPrint('==> order create failure: $s');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<OrderPaginateResponse>> getCompletedOrders(int page) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'page': page,
      'status': 'delivered',
      'perPage': 14,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/orders/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: OrderPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get completed orders failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<OrderPaginateResponse>> getOpenOrders(int page) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'page': page,
      'status': 'new',
      'perPage': 14,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/orders/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: OrderPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get open orders failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<OrderPaginateResponse>> getReadyOrders(int page) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'page': page,
      'status': 'ready',
      'perPage': 14,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/orders/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: OrderPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get open orders failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<OrderPaginateResponse>> getOnTheWayOrders(int page) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'page': page,
      'status': 'on_a_way',
      'perPage': 14,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/orders/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: OrderPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get open orders failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<OrderPaginateResponse>> getCanceledOrders(int page) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id,
      'page': page,
      'status': 'canceled',
      'perPage': 14,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/orders/paginate',
        queryParameters: data,
      );
      return ApiResult.success(
        data: OrderPaginateResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get canceled orders failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<SingleOrderResponse>> getSingleOrder(int orderId) async {
    final data = {
      'currency_id': LocalStorage.instance.getSelectedCurrency()?.id
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/orders/$orderId',
        queryParameters: data,
      );
      return ApiResult.success(
        data: SingleOrderResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> get single order failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<void>> addReview(
    int orderId, {
    required double rating,
    required String comment,
    required String name,
    bool isDeliveryReview = false,
  }) async {
    final data = {
      'rating': rating,
      'comment': comment,
      "id": orderId,
      "name": name
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.post(
        isDeliveryReview ? '/api/v1/dashboard/user/deliveryman/review/$orderId' : '/api/v1/dashboard/user/orders/review/$orderId',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> add order review failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<void>> cancelOrder(
    int orderId,
  ) async {
    final data = {
      'status': "canceled",
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      await client.post(
        '/api/v1/dashboard/user/orders/$orderId/status/change',
        data: data,
      );
      return const ApiResult.success(data: null);
    } catch (e) {
      debugPrint('==> add order review failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<CouponResponse>> checkCoupon({
    required String coupon,
    required int shopId,
  }) async {
    final data = {
      'coupon': coupon,
      'user_id': LocalStorage.instance.getUser()?.id,
     // 'shop_id': shopId,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/rest/coupons/check',
        data: data,
      );
      return ApiResult.success(data: CouponResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> check coupon failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<CashbackResponse>> checkCashback({
    required double amount,
  }) async {
    final data = {'amount': amount};
    debugPrint('===> check cashback request ${jsonEncode(data)}');
    try {
      final client = inject<HttpService>().client(requireAuth: false);
      final response = await client.post(
        '/api/v1/rest/cashback/check',
        data: data,
      );
      return ApiResult.success(data: CashbackResponse.fromJson(response.data));
    } catch (e) {
      debugPrint('==> check cashback failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
