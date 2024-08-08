import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/order_details_state.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../repository/repository.dart';
import '../../../../../../../../core/handlers/handlers.dart';
import '../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../core/routes/app_router.gr.dart';

class OrderDetailsNotifier extends StateNotifier<OrderDetailsState> {
  final OrdersRepository _ordersRepository;

  OrderDetailsNotifier(this._ordersRepository)
      : super(const OrderDetailsState());

  void setRating(double value) {
    state = state.copyWith(rating: value);
  }

  void setReviewText(String value) {
    state = state.copyWith(reviewText: value);
  }

  Future<void> fetchOrderDetails(int orderId) async {
    state = state.copyWith(isLoading: true, orderResponse: null);
    final response = await _ordersRepository.getSingleOrder(orderId);
    response.when(
      success: (data) {
        state = state.copyWith(
          orderResponse: data,
          shopOrderDetails: data.data?.details ?? [],
          isLoading: false,
          isCancelable: _checkOrderCancelable(data.data?.details ?? []),
          canLeaveFeedback: _checkCanLeaveFeedback(data.data?.details ?? []),
        );
        calculateTotals();
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get order details fail $fail');
      },
    );
  }

  bool _checkOrderCancelable(List<ShopOrderDetails> orderDetails) {
    for (final orderDetail in orderDetails) {
      if (AppHelpers.getOrderStatus(orderDetail.status) !=
              OrderStatus.newOrder &&
          AppHelpers.getOrderStatus(orderDetail.status) !=
              OrderStatus.accepted) {
        return false;
      }
    }
    return true;
  }

  bool _checkCanLeaveFeedback(List<ShopOrderDetails> orderDetails) {
    for (final orderDetail in orderDetails) {
      if (AppHelpers.getOrderStatus(orderDetail.status) !=
          OrderStatus.delivered) {
        return false;
      }
    }
    return true;
  }

  void changeActiveShopIndex(int index, PageController? pageController) {
    state = state.copyWith(activeShopIndex: index);
    if (pageController != null) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    }
  }

  void calculateTotals() {
    double totalProductPrice = 0;
    double totalDiscount = 0;
    double totalProductTax = 0;
    double totalShopTax = 0;
    double coupon = 0;
    double deliveryFee = 0;
    for (final shopOrder in state.shopOrderDetails) {
      totalShopTax += shopOrder.tax ?? 0;
      coupon += shopOrder.coupon?.price ?? 0;
      deliveryFee += shopOrder.deliveryFee ?? 0;
      final List<OrderStocks> orderStocks = shopOrder.orderStocks ?? [];
      for (final orderStock in orderStocks) {
        final bool hasDiscount =
            orderStock.discount != null && (orderStock.discount ?? 0) > 0;
        totalProductTax += orderStock.tax ?? 0;
        totalDiscount += hasDiscount ? (orderStock.discount ?? 0) : 0;
        totalProductPrice +=
            (orderStock.originPrice ?? 0) * (orderStock.quantity ?? 1);
      }
    }
    state = state.copyWith(
      totalProductPrice: totalProductPrice,
      discount: totalDiscount,
      totalProductTax: totalProductTax,
      totalShopTax: totalShopTax,
      coupon: coupon,
      deliveryFee: deliveryFee,
      totalAmount: totalProductPrice +
          totalProductTax +
          totalShopTax +
          deliveryFee -
          coupon,
    );
  }

  Future<void> addReview(BuildContext context,{bool isDeliveryReview = false}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isReviewing: true);
      UserData user = LocalStorage.instance.getUser() ?? UserData();
      final response = await _ordersRepository.addReview(
        state.orderResponse?.data?.id ?? 0,
        rating: state.rating,
        comment: state.reviewText,
        name: user.firstname ?? '',
      );
      response.when(
        success: (data) async {
          state = state.copyWith(isReviewing: false);
          context.popRoute();
          fetchOrderDetails(state.orderResponse?.data?.id ?? 0);
          Navigator.pop(context);
        },
        failure: (failure) {
          state = state.copyWith(isReviewing: false);
          if (failure == const NetworkExceptions.internalServerError()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.somethingWentWrongWithTheServer),
            );
          } else if (failure == const NetworkExceptions.unauthorisedRequest()) {
            LocalStorage.instance.deleteToken();
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.youNeedToLoginFirst),
            );
            context.router.pushAndPopUntil(
              const LoginRoute(),
              predicate: (route) => false,
            );
          }
          debugPrint('==> add order review failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  Future<void> cancelOrder(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isCancelLoading: true);
      final response = await _ordersRepository.cancelOrder(
        state.orderResponse?.data?.id ?? 0,
      );
      response.when(
        success: (data) async {
          state = state.copyWith(isCancelLoading: false);
          context.replaceRoute(const ShopMainRoute());
          fetchOrderDetails(state.orderResponse?.data?.id ?? 0);
        },
        failure: (failure) {
          state = state.copyWith(isCancelLoading: false);
          if (failure == const NetworkExceptions.internalServerError()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.somethingWentWrongWithTheServer),
            );
          } else if (failure == const NetworkExceptions.unauthorisedRequest()) {
            LocalStorage.instance.deleteToken();
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.youNeedToLoginFirst),
            );
            context.router.pushAndPopUntil(
              const LoginRoute(),
              predicate: (route) => false,
            );
          }
          debugPrint('==> add order review failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }
}
