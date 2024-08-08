// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CheckoutState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isApplied => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get isStoreAddressLoading => throw _privateConstructorUsedError;
  bool get isPaymentsLoading => throw _privateConstructorUsedError;
  bool get isShopDeliveriesLoading => throw _privateConstructorUsedError;
  bool get isCreatingOrder => throw _privateConstructorUsedError;
  bool get isContinueEnabled => throw _privateConstructorUsedError;
  bool get isCalculationsLoading => throw _privateConstructorUsedError;
  bool get isCheckingCoupon => throw _privateConstructorUsedError;
  bool get isPaymentValid => throw _privateConstructorUsedError;
  bool get isAddressCreating => throw _privateConstructorUsedError;
  bool get isCheckingCashback => throw _privateConstructorUsedError;
  String get deliveryDate => throw _privateConstructorUsedError;
  String get pickUpDate => throw _privateConstructorUsedError;
  String get deliveryTime => throw _privateConstructorUsedError;
  String get coupon => throw _privateConstructorUsedError;
  int get activePage => throw _privateConstructorUsedError;
  int get selectedShopIndex => throw _privateConstructorUsedError;
  int get selectedPaymentIndex => throw _privateConstructorUsedError;
  int get addressIndex => throw _privateConstructorUsedError;
  int get deliveryTypeId => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get cashbackAmount => throw _privateConstructorUsedError;
  List<ShopData> get shops => throw _privateConstructorUsedError;
  List<ShippingData> get shippingDataList => throw _privateConstructorUsedError;
  List<PaymentData> get payments => throw _privateConstructorUsedError;
  List<ApplyCouponData> get applyCoupons => throw _privateConstructorUsedError;
  Map<MarkerId, Marker> get markers => throw _privateConstructorUsedError;
  LatLng? get initialLatLng => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  ProductCalculateResponse? get calculateResponse =>
      throw _privateConstructorUsedError;
  Razorpay? get razorpay => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckoutStateCopyWith<CheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
          CheckoutState value, $Res Function(CheckoutState) then) =
      _$CheckoutStateCopyWithImpl<$Res, CheckoutState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isApplied,
      bool isError,
      bool isStoreAddressLoading,
      bool isPaymentsLoading,
      bool isShopDeliveriesLoading,
      bool isCreatingOrder,
      bool isContinueEnabled,
      bool isCalculationsLoading,
      bool isCheckingCoupon,
      bool isPaymentValid,
      bool isAddressCreating,
      bool isCheckingCashback,
      String deliveryDate,
      String pickUpDate,
      String deliveryTime,
      String coupon,
      int activePage,
      int selectedShopIndex,
      int selectedPaymentIndex,
      int addressIndex,
      int deliveryTypeId,
      double deliveryFee,
      double cashbackAmount,
      List<ShopData> shops,
      List<ShippingData> shippingDataList,
      List<PaymentData> payments,
      List<ApplyCouponData> applyCoupons,
      Map<MarkerId, Marker> markers,
      LatLng? initialLatLng,
      String? comment,
      ProductCalculateResponse? calculateResponse,
      Razorpay? razorpay});
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res, $Val extends CheckoutState>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isApplied = null,
    Object? isError = null,
    Object? isStoreAddressLoading = null,
    Object? isPaymentsLoading = null,
    Object? isShopDeliveriesLoading = null,
    Object? isCreatingOrder = null,
    Object? isContinueEnabled = null,
    Object? isCalculationsLoading = null,
    Object? isCheckingCoupon = null,
    Object? isPaymentValid = null,
    Object? isAddressCreating = null,
    Object? isCheckingCashback = null,
    Object? deliveryDate = null,
    Object? pickUpDate = null,
    Object? deliveryTime = null,
    Object? coupon = null,
    Object? activePage = null,
    Object? selectedShopIndex = null,
    Object? selectedPaymentIndex = null,
    Object? addressIndex = null,
    Object? deliveryTypeId = null,
    Object? deliveryFee = null,
    Object? cashbackAmount = null,
    Object? shops = null,
    Object? shippingDataList = null,
    Object? payments = null,
    Object? applyCoupons = null,
    Object? markers = null,
    Object? initialLatLng = freezed,
    Object? comment = freezed,
    Object? calculateResponse = freezed,
    Object? razorpay = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isApplied: null == isApplied
          ? _value.isApplied
          : isApplied // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isStoreAddressLoading: null == isStoreAddressLoading
          ? _value.isStoreAddressLoading
          : isStoreAddressLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentsLoading: null == isPaymentsLoading
          ? _value.isPaymentsLoading
          : isPaymentsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isShopDeliveriesLoading: null == isShopDeliveriesLoading
          ? _value.isShopDeliveriesLoading
          : isShopDeliveriesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreatingOrder: null == isCreatingOrder
          ? _value.isCreatingOrder
          : isCreatingOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      isContinueEnabled: null == isContinueEnabled
          ? _value.isContinueEnabled
          : isContinueEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isCalculationsLoading: null == isCalculationsLoading
          ? _value.isCalculationsLoading
          : isCalculationsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckingCoupon: null == isCheckingCoupon
          ? _value.isCheckingCoupon
          : isCheckingCoupon // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentValid: null == isPaymentValid
          ? _value.isPaymentValid
          : isPaymentValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddressCreating: null == isAddressCreating
          ? _value.isAddressCreating
          : isAddressCreating // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckingCashback: null == isCheckingCashback
          ? _value.isCheckingCashback
          : isCheckingCashback // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      pickUpDate: null == pickUpDate
          ? _value.pickUpDate
          : pickUpDate // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTime: null == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      coupon: null == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as String,
      activePage: null == activePage
          ? _value.activePage
          : activePage // ignore: cast_nullable_to_non_nullable
              as int,
      selectedShopIndex: null == selectedShopIndex
          ? _value.selectedShopIndex
          : selectedShopIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedPaymentIndex: null == selectedPaymentIndex
          ? _value.selectedPaymentIndex
          : selectedPaymentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      addressIndex: null == addressIndex
          ? _value.addressIndex
          : addressIndex // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryTypeId: null == deliveryTypeId
          ? _value.deliveryTypeId
          : deliveryTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      cashbackAmount: null == cashbackAmount
          ? _value.cashbackAmount
          : cashbackAmount // ignore: cast_nullable_to_non_nullable
              as double,
      shops: null == shops
          ? _value.shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      shippingDataList: null == shippingDataList
          ? _value.shippingDataList
          : shippingDataList // ignore: cast_nullable_to_non_nullable
              as List<ShippingData>,
      payments: null == payments
          ? _value.payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentData>,
      applyCoupons: null == applyCoupons
          ? _value.applyCoupons
          : applyCoupons // ignore: cast_nullable_to_non_nullable
              as List<ApplyCouponData>,
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Map<MarkerId, Marker>,
      initialLatLng: freezed == initialLatLng
          ? _value.initialLatLng
          : initialLatLng // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      calculateResponse: freezed == calculateResponse
          ? _value.calculateResponse
          : calculateResponse // ignore: cast_nullable_to_non_nullable
              as ProductCalculateResponse?,
      razorpay: freezed == razorpay
          ? _value.razorpay
          : razorpay // ignore: cast_nullable_to_non_nullable
              as Razorpay?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckoutStateImplCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$$CheckoutStateImplCopyWith(
          _$CheckoutStateImpl value, $Res Function(_$CheckoutStateImpl) then) =
      __$$CheckoutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isApplied,
      bool isError,
      bool isStoreAddressLoading,
      bool isPaymentsLoading,
      bool isShopDeliveriesLoading,
      bool isCreatingOrder,
      bool isContinueEnabled,
      bool isCalculationsLoading,
      bool isCheckingCoupon,
      bool isPaymentValid,
      bool isAddressCreating,
      bool isCheckingCashback,
      String deliveryDate,
      String pickUpDate,
      String deliveryTime,
      String coupon,
      int activePage,
      int selectedShopIndex,
      int selectedPaymentIndex,
      int addressIndex,
      int deliveryTypeId,
      double deliveryFee,
      double cashbackAmount,
      List<ShopData> shops,
      List<ShippingData> shippingDataList,
      List<PaymentData> payments,
      List<ApplyCouponData> applyCoupons,
      Map<MarkerId, Marker> markers,
      LatLng? initialLatLng,
      String? comment,
      ProductCalculateResponse? calculateResponse,
      Razorpay? razorpay});
}

/// @nodoc
class __$$CheckoutStateImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CheckoutStateImpl>
    implements _$$CheckoutStateImplCopyWith<$Res> {
  __$$CheckoutStateImplCopyWithImpl(
      _$CheckoutStateImpl _value, $Res Function(_$CheckoutStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isApplied = null,
    Object? isError = null,
    Object? isStoreAddressLoading = null,
    Object? isPaymentsLoading = null,
    Object? isShopDeliveriesLoading = null,
    Object? isCreatingOrder = null,
    Object? isContinueEnabled = null,
    Object? isCalculationsLoading = null,
    Object? isCheckingCoupon = null,
    Object? isPaymentValid = null,
    Object? isAddressCreating = null,
    Object? isCheckingCashback = null,
    Object? deliveryDate = null,
    Object? pickUpDate = null,
    Object? deliveryTime = null,
    Object? coupon = null,
    Object? activePage = null,
    Object? selectedShopIndex = null,
    Object? selectedPaymentIndex = null,
    Object? addressIndex = null,
    Object? deliveryTypeId = null,
    Object? deliveryFee = null,
    Object? cashbackAmount = null,
    Object? shops = null,
    Object? shippingDataList = null,
    Object? payments = null,
    Object? applyCoupons = null,
    Object? markers = null,
    Object? initialLatLng = freezed,
    Object? comment = freezed,
    Object? calculateResponse = freezed,
    Object? razorpay = freezed,
  }) {
    return _then(_$CheckoutStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isApplied: null == isApplied
          ? _value.isApplied
          : isApplied // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isStoreAddressLoading: null == isStoreAddressLoading
          ? _value.isStoreAddressLoading
          : isStoreAddressLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentsLoading: null == isPaymentsLoading
          ? _value.isPaymentsLoading
          : isPaymentsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isShopDeliveriesLoading: null == isShopDeliveriesLoading
          ? _value.isShopDeliveriesLoading
          : isShopDeliveriesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreatingOrder: null == isCreatingOrder
          ? _value.isCreatingOrder
          : isCreatingOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      isContinueEnabled: null == isContinueEnabled
          ? _value.isContinueEnabled
          : isContinueEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isCalculationsLoading: null == isCalculationsLoading
          ? _value.isCalculationsLoading
          : isCalculationsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckingCoupon: null == isCheckingCoupon
          ? _value.isCheckingCoupon
          : isCheckingCoupon // ignore: cast_nullable_to_non_nullable
              as bool,
      isPaymentValid: null == isPaymentValid
          ? _value.isPaymentValid
          : isPaymentValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddressCreating: null == isAddressCreating
          ? _value.isAddressCreating
          : isAddressCreating // ignore: cast_nullable_to_non_nullable
              as bool,
      isCheckingCashback: null == isCheckingCashback
          ? _value.isCheckingCashback
          : isCheckingCashback // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as String,
      pickUpDate: null == pickUpDate
          ? _value.pickUpDate
          : pickUpDate // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryTime: null == deliveryTime
          ? _value.deliveryTime
          : deliveryTime // ignore: cast_nullable_to_non_nullable
              as String,
      coupon: null == coupon
          ? _value.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as String,
      activePage: null == activePage
          ? _value.activePage
          : activePage // ignore: cast_nullable_to_non_nullable
              as int,
      selectedShopIndex: null == selectedShopIndex
          ? _value.selectedShopIndex
          : selectedShopIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedPaymentIndex: null == selectedPaymentIndex
          ? _value.selectedPaymentIndex
          : selectedPaymentIndex // ignore: cast_nullable_to_non_nullable
              as int,
      addressIndex: null == addressIndex
          ? _value.addressIndex
          : addressIndex // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryTypeId: null == deliveryTypeId
          ? _value.deliveryTypeId
          : deliveryTypeId // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      cashbackAmount: null == cashbackAmount
          ? _value.cashbackAmount
          : cashbackAmount // ignore: cast_nullable_to_non_nullable
              as double,
      shops: null == shops
          ? _value._shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      shippingDataList: null == shippingDataList
          ? _value._shippingDataList
          : shippingDataList // ignore: cast_nullable_to_non_nullable
              as List<ShippingData>,
      payments: null == payments
          ? _value._payments
          : payments // ignore: cast_nullable_to_non_nullable
              as List<PaymentData>,
      applyCoupons: null == applyCoupons
          ? _value._applyCoupons
          : applyCoupons // ignore: cast_nullable_to_non_nullable
              as List<ApplyCouponData>,
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Map<MarkerId, Marker>,
      initialLatLng: freezed == initialLatLng
          ? _value.initialLatLng
          : initialLatLng // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      calculateResponse: freezed == calculateResponse
          ? _value.calculateResponse
          : calculateResponse // ignore: cast_nullable_to_non_nullable
              as ProductCalculateResponse?,
      razorpay: freezed == razorpay
          ? _value.razorpay
          : razorpay // ignore: cast_nullable_to_non_nullable
              as Razorpay?,
    ));
  }
}

/// @nodoc

class _$CheckoutStateImpl extends _CheckoutState {
  const _$CheckoutStateImpl(
      {this.isLoading = false,
      this.isApplied = false,
      this.isError = false,
      this.isStoreAddressLoading = false,
      this.isPaymentsLoading = false,
      this.isShopDeliveriesLoading = false,
      this.isCreatingOrder = false,
      this.isContinueEnabled = false,
      this.isCalculationsLoading = false,
      this.isCheckingCoupon = false,
      this.isPaymentValid = false,
      this.isAddressCreating = false,
      this.isCheckingCashback = false,
      this.deliveryDate = '',
      this.pickUpDate = '',
      this.deliveryTime = '',
      this.coupon = '',
      this.activePage = 0,
      this.selectedShopIndex = 0,
      this.selectedPaymentIndex = 0,
      this.addressIndex = 0,
      this.deliveryTypeId = 0,
      this.deliveryFee = 0,
      this.cashbackAmount = 0,
      final List<ShopData> shops = const [],
      final List<ShippingData> shippingDataList = const [],
      final List<PaymentData> payments = const [],
      final List<ApplyCouponData> applyCoupons = const [],
      final Map<MarkerId, Marker> markers = const {},
      this.initialLatLng,
      this.comment,
      this.calculateResponse,
      this.razorpay})
      : _shops = shops,
        _shippingDataList = shippingDataList,
        _payments = payments,
        _applyCoupons = applyCoupons,
        _markers = markers,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isApplied;
  @override
  @JsonKey()
  final bool isError;
  @override
  @JsonKey()
  final bool isStoreAddressLoading;
  @override
  @JsonKey()
  final bool isPaymentsLoading;
  @override
  @JsonKey()
  final bool isShopDeliveriesLoading;
  @override
  @JsonKey()
  final bool isCreatingOrder;
  @override
  @JsonKey()
  final bool isContinueEnabled;
  @override
  @JsonKey()
  final bool isCalculationsLoading;
  @override
  @JsonKey()
  final bool isCheckingCoupon;
  @override
  @JsonKey()
  final bool isPaymentValid;
  @override
  @JsonKey()
  final bool isAddressCreating;
  @override
  @JsonKey()
  final bool isCheckingCashback;
  @override
  @JsonKey()
  final String deliveryDate;
  @override
  @JsonKey()
  final String pickUpDate;
  @override
  @JsonKey()
  final String deliveryTime;
  @override
  @JsonKey()
  final String coupon;
  @override
  @JsonKey()
  final int activePage;
  @override
  @JsonKey()
  final int selectedShopIndex;
  @override
  @JsonKey()
  final int selectedPaymentIndex;
  @override
  @JsonKey()
  final int addressIndex;
  @override
  @JsonKey()
  final int deliveryTypeId;
  @override
  @JsonKey()
  final double deliveryFee;
  @override
  @JsonKey()
  final double cashbackAmount;
  final List<ShopData> _shops;
  @override
  @JsonKey()
  List<ShopData> get shops {
    if (_shops is EqualUnmodifiableListView) return _shops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shops);
  }

  final List<ShippingData> _shippingDataList;
  @override
  @JsonKey()
  List<ShippingData> get shippingDataList {
    if (_shippingDataList is EqualUnmodifiableListView)
      return _shippingDataList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shippingDataList);
  }

  final List<PaymentData> _payments;
  @override
  @JsonKey()
  List<PaymentData> get payments {
    if (_payments is EqualUnmodifiableListView) return _payments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payments);
  }

  final List<ApplyCouponData> _applyCoupons;
  @override
  @JsonKey()
  List<ApplyCouponData> get applyCoupons {
    if (_applyCoupons is EqualUnmodifiableListView) return _applyCoupons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_applyCoupons);
  }

  final Map<MarkerId, Marker> _markers;
  @override
  @JsonKey()
  Map<MarkerId, Marker> get markers {
    if (_markers is EqualUnmodifiableMapView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_markers);
  }

  @override
  final LatLng? initialLatLng;
  @override
  final String? comment;
  @override
  final ProductCalculateResponse? calculateResponse;
  @override
  final Razorpay? razorpay;

  @override
  String toString() {
    return 'CheckoutState(isLoading: $isLoading, isApplied: $isApplied, isError: $isError, isStoreAddressLoading: $isStoreAddressLoading, isPaymentsLoading: $isPaymentsLoading, isShopDeliveriesLoading: $isShopDeliveriesLoading, isCreatingOrder: $isCreatingOrder, isContinueEnabled: $isContinueEnabled, isCalculationsLoading: $isCalculationsLoading, isCheckingCoupon: $isCheckingCoupon, isPaymentValid: $isPaymentValid, isAddressCreating: $isAddressCreating, isCheckingCashback: $isCheckingCashback, deliveryDate: $deliveryDate, pickUpDate: $pickUpDate, deliveryTime: $deliveryTime, coupon: $coupon, activePage: $activePage, selectedShopIndex: $selectedShopIndex, selectedPaymentIndex: $selectedPaymentIndex, addressIndex: $addressIndex, deliveryTypeId: $deliveryTypeId, deliveryFee: $deliveryFee, cashbackAmount: $cashbackAmount, shops: $shops, shippingDataList: $shippingDataList, payments: $payments, applyCoupons: $applyCoupons, markers: $markers, initialLatLng: $initialLatLng, comment: $comment, calculateResponse: $calculateResponse, razorpay: $razorpay)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isApplied, isApplied) ||
                other.isApplied == isApplied) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.isStoreAddressLoading, isStoreAddressLoading) ||
                other.isStoreAddressLoading == isStoreAddressLoading) &&
            (identical(other.isPaymentsLoading, isPaymentsLoading) ||
                other.isPaymentsLoading == isPaymentsLoading) &&
            (identical(
                    other.isShopDeliveriesLoading, isShopDeliveriesLoading) ||
                other.isShopDeliveriesLoading == isShopDeliveriesLoading) &&
            (identical(other.isCreatingOrder, isCreatingOrder) ||
                other.isCreatingOrder == isCreatingOrder) &&
            (identical(other.isContinueEnabled, isContinueEnabled) ||
                other.isContinueEnabled == isContinueEnabled) &&
            (identical(other.isCalculationsLoading, isCalculationsLoading) ||
                other.isCalculationsLoading == isCalculationsLoading) &&
            (identical(other.isCheckingCoupon, isCheckingCoupon) ||
                other.isCheckingCoupon == isCheckingCoupon) &&
            (identical(other.isPaymentValid, isPaymentValid) ||
                other.isPaymentValid == isPaymentValid) &&
            (identical(other.isAddressCreating, isAddressCreating) ||
                other.isAddressCreating == isAddressCreating) &&
            (identical(other.isCheckingCashback, isCheckingCashback) ||
                other.isCheckingCashback == isCheckingCashback) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.pickUpDate, pickUpDate) ||
                other.pickUpDate == pickUpDate) &&
            (identical(other.deliveryTime, deliveryTime) ||
                other.deliveryTime == deliveryTime) &&
            (identical(other.coupon, coupon) || other.coupon == coupon) &&
            (identical(other.activePage, activePage) ||
                other.activePage == activePage) &&
            (identical(other.selectedShopIndex, selectedShopIndex) ||
                other.selectedShopIndex == selectedShopIndex) &&
            (identical(other.selectedPaymentIndex, selectedPaymentIndex) ||
                other.selectedPaymentIndex == selectedPaymentIndex) &&
            (identical(other.addressIndex, addressIndex) ||
                other.addressIndex == addressIndex) &&
            (identical(other.deliveryTypeId, deliveryTypeId) ||
                other.deliveryTypeId == deliveryTypeId) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.cashbackAmount, cashbackAmount) ||
                other.cashbackAmount == cashbackAmount) &&
            const DeepCollectionEquality().equals(other._shops, _shops) &&
            const DeepCollectionEquality()
                .equals(other._shippingDataList, _shippingDataList) &&
            const DeepCollectionEquality().equals(other._payments, _payments) &&
            const DeepCollectionEquality()
                .equals(other._applyCoupons, _applyCoupons) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            (identical(other.initialLatLng, initialLatLng) ||
                other.initialLatLng == initialLatLng) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.calculateResponse, calculateResponse) ||
                other.calculateResponse == calculateResponse) &&
            (identical(other.razorpay, razorpay) ||
                other.razorpay == razorpay));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isLoading,
        isApplied,
        isError,
        isStoreAddressLoading,
        isPaymentsLoading,
        isShopDeliveriesLoading,
        isCreatingOrder,
        isContinueEnabled,
        isCalculationsLoading,
        isCheckingCoupon,
        isPaymentValid,
        isAddressCreating,
        isCheckingCashback,
        deliveryDate,
        pickUpDate,
        deliveryTime,
        coupon,
        activePage,
        selectedShopIndex,
        selectedPaymentIndex,
        addressIndex,
        deliveryTypeId,
        deliveryFee,
        cashbackAmount,
        const DeepCollectionEquality().hash(_shops),
        const DeepCollectionEquality().hash(_shippingDataList),
        const DeepCollectionEquality().hash(_payments),
        const DeepCollectionEquality().hash(_applyCoupons),
        const DeepCollectionEquality().hash(_markers),
        initialLatLng,
        comment,
        calculateResponse,
        razorpay
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutStateImplCopyWith<_$CheckoutStateImpl> get copyWith =>
      __$$CheckoutStateImplCopyWithImpl<_$CheckoutStateImpl>(this, _$identity);
}

abstract class _CheckoutState extends CheckoutState {
  const factory _CheckoutState(
      {final bool isLoading,
      final bool isApplied,
      final bool isError,
      final bool isStoreAddressLoading,
      final bool isPaymentsLoading,
      final bool isShopDeliveriesLoading,
      final bool isCreatingOrder,
      final bool isContinueEnabled,
      final bool isCalculationsLoading,
      final bool isCheckingCoupon,
      final bool isPaymentValid,
      final bool isAddressCreating,
      final bool isCheckingCashback,
      final String deliveryDate,
      final String pickUpDate,
      final String deliveryTime,
      final String coupon,
      final int activePage,
      final int selectedShopIndex,
      final int selectedPaymentIndex,
      final int addressIndex,
      final int deliveryTypeId,
      final double deliveryFee,
      final double cashbackAmount,
      final List<ShopData> shops,
      final List<ShippingData> shippingDataList,
      final List<PaymentData> payments,
      final List<ApplyCouponData> applyCoupons,
      final Map<MarkerId, Marker> markers,
      final LatLng? initialLatLng,
      final String? comment,
      final ProductCalculateResponse? calculateResponse,
      final Razorpay? razorpay}) = _$CheckoutStateImpl;
  const _CheckoutState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isApplied;
  @override
  bool get isError;
  @override
  bool get isStoreAddressLoading;
  @override
  bool get isPaymentsLoading;
  @override
  bool get isShopDeliveriesLoading;
  @override
  bool get isCreatingOrder;
  @override
  bool get isContinueEnabled;
  @override
  bool get isCalculationsLoading;
  @override
  bool get isCheckingCoupon;
  @override
  bool get isPaymentValid;
  @override
  bool get isAddressCreating;
  @override
  bool get isCheckingCashback;
  @override
  String get deliveryDate;
  @override
  String get pickUpDate;
  @override
  String get deliveryTime;
  @override
  String get coupon;
  @override
  int get activePage;
  @override
  int get selectedShopIndex;
  @override
  int get selectedPaymentIndex;
  @override
  int get addressIndex;
  @override
  int get deliveryTypeId;
  @override
  double get deliveryFee;
  @override
  double get cashbackAmount;
  @override
  List<ShopData> get shops;
  @override
  List<ShippingData> get shippingDataList;
  @override
  List<PaymentData> get payments;
  @override
  List<ApplyCouponData> get applyCoupons;
  @override
  Map<MarkerId, Marker> get markers;
  @override
  LatLng? get initialLatLng;
  @override
  String? get comment;
  @override
  ProductCalculateResponse? get calculateResponse;
  @override
  Razorpay? get razorpay;
  @override
  @JsonKey(ignore: true)
  _$$CheckoutStateImplCopyWith<_$CheckoutStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
