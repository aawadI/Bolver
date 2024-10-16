import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../../../../../../../models/models.dart';

part 'checkout_state.freezed.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState({
    @Default(false) bool isLoading,
    @Default(false) bool isApplied,
    @Default(false) bool isError,
    @Default(false) bool isStoreAddressLoading,
    @Default(false) bool isPaymentsLoading,
    @Default(false) bool isShopDeliveriesLoading,
    @Default(false) bool isCreatingOrder,
    @Default(false) bool isGift,
    @Default(false) bool isContinueEnabled,
    @Default(false) bool isCalculationsLoading,
    @Default(false) bool isCheckingCoupon,
    @Default(false) bool isPaymentValid,
    @Default(false) bool isAddressCreating,
    @Default(false) bool isCheckingCashback,
    @Default('') String deliveryDate,
    @Default('') String pickUpDate,
    @Default('') String deliveryTime,
    @Default('') String coupon,
    @Default(0) int activePage,
    @Default(0) int selectedShopIndex,
    @Default(0) int selectedPaymentIndex,
    @Default(0) int addressIndex,
    @Default(0) int deliveryTypeId,
    @Default(0) double deliveryFee,
    @Default(0) double cashbackAmount,
    @Default([]) List<ShopData> shops,
    @Default([]) List<ShippingData> shippingDataList,
    @Default([]) List<PaymentData> payments,
    @Default([]) List<ApplyCouponData> applyCoupons,
    @Default({}) Map<MarkerId, Marker> markers,
    LatLng? initialLatLng,
    String? comment,
    ProductCalculateResponse? calculateResponse,
    Razorpay? razorpay,
  }) = _CheckoutState;

  const CheckoutState._();
}