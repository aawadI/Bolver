import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/presentation/pages/moyaser.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:moyasar/moyasar.dart';

import '../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../core/handlers/handlers.dart';
import '../../../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../repository/repository.dart';
import '../../../riverpod/notifier/order_notifier.dart';
import '../../../riverpod/state/order_state.dart';
import '../state/checkout_state.dart';

class CheckoutNotifier extends StateNotifier<CheckoutState> {
  final PaymentsRepository _paymentsRepository;
  final ShopsRepository _shopsRepository;
  final OrdersRepository _ordersRepository;
  final UserRepository _userRepository;

  CheckoutNotifier(
    this._paymentsRepository,
    this._shopsRepository,
    this._ordersRepository,
    this._userRepository,
  ) : super(
          const CheckoutState(),
        );

  void setActivePage(int index) {
    state = state.copyWith(activePage: index);
  }

  void setSelectedShopIndex(int index) {
    state = state.copyWith(selectedShopIndex: index);
  }

  Future<void> fetchShops(BuildContext context, List<ShopData> shops) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true);
      final List<SettingsData> settings =
          LocalStorage.instance.getSettingsList();
      bool isDelivery = false;
      for (final setting in settings) {
        if (setting.key == 'delivery') {
          isDelivery = setting.value == '0';
          break;
        }
      }
      if (isDelivery) {
        final response = await _shopsRepository.getOnlyDeliveries();
        response.when(
          success: (data) async {
            final List<CartProductData> cartProducts =
                LocalStorage.instance.getCartProducts();
            List<int> shopIds = [];
            for (final product in cartProducts) {
              shopIds.add(product.selectedStock?.product?.shopId ?? 0);
            }
            shopIds = shopIds.toSet().toList();
            List<ShopData> filtered = [];
            for (final shop in shops) {
              filtered.add(shop);
            }
            state = state.copyWith(shops: filtered, isLoading: false);
            setInitialShippingDeliveries(isDelivery, onlyDeliveries: data.data);
            fetchPayments(context);
            fetchProfileDetails(context);
          },
          failure: (failure) {
            state = state.copyWith(isLoading: false);
            if (failure == const NetworkExceptions.noInternetConnection()) {
              AppHelpers.showCheckFlash(
                context,
                AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
              );
            }
            debugPrint('==> get all shops failure: $failure');
          },
        );
      } else {
        final List<CartProductData> cartProducts =
            LocalStorage.instance.getCartProducts();
        List<int> shopIds = [];
        for (final product in cartProducts) {
          shopIds.add(product.shopID ?? 0);
        }
        shopIds = shopIds.toSet().toList();
        final response = await _shopsRepository.getShopsDeliveries(shopIds);
        response.when(
          success: (data) async {
            state = state.copyWith(shops: data.data ?? [], isLoading: false);
            setInitialShippingDeliveries(isDelivery);
            fetchPayments(context);
            fetchProfileDetails(context);
          },
          failure: (failure) {
            state = state.copyWith(isLoading: false);
            debugPrint('==> get shop deliveries failure: $failure');
          },
        );
      }
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }

  void setInitialShippingDeliveries(
    bool isDelivery, {
    List<ShopDelivery>? onlyDeliveries,
  }) {
    List<ShippingData> shippingDataList = [];
    for (final shop in state.shops) {
      ShippingDeliveryVisibilityType visibilityType =
          ShippingDeliveryVisibilityType.cantOrder;
      DeliveryTypeEnum? activeDelivery;
      List<ShopDelivery> shopDeliveries = [];
      final List<ShopDelivery> deliveries =
          isDelivery ? (onlyDeliveries ?? []) : (shop.deliveries ?? []);
      int pickupIndex = 0;
      if (deliveries.isNotEmpty) {
        bool hasPickup = false;
        for (int i = 0; i < deliveries.length; i++) {
          if (deliveries[i].type == 'pickup') {
            hasPickup = true;
            pickupIndex = i;
          } else {
            shopDeliveries.add(deliveries[i]);
          }
        }
        if (hasPickup) {
          if (deliveries.length > 1) {
            visibilityType = ShippingDeliveryVisibilityType.both;
            activeDelivery = DeliveryTypeEnum.delivery;
          } else {
            visibilityType = ShippingDeliveryVisibilityType.onlyPickup;
            activeDelivery = DeliveryTypeEnum.pickup;
          }
        } else {
          visibilityType = ShippingDeliveryVisibilityType.onlyDelivery;
          activeDelivery = DeliveryTypeEnum.delivery;
        }
        final bool hasDeliveries =
            visibilityType == ShippingDeliveryVisibilityType.onlyDelivery ||
                visibilityType == ShippingDeliveryVisibilityType.both;
        shippingDataList.add(
          ShippingData(
            shopId: shop.id ?? 0,
            openTime: shop.openTime ?? '',
            closeTime: shop.closeTime ?? '',
            visibilityType: visibilityType,
            activeDelivery: activeDelivery,
            shopDeliveries: hasDeliveries ? shopDeliveries : null,
            deliveryData: hasDeliveries
                ? DeliveryData(shopDelivery: shopDeliveries[0])
                : null,
            pickupData: PickupData(
              pickupIndex: pickupIndex,
              deliveryData: deliveries[pickupIndex],
            ),
          ),
        );
      } else {
        shippingDataList.add(
          ShippingData(
            shopId: shop.id ?? 0,
            openTime: shop.openTime ?? '',
            closeTime: shop.closeTime ?? '',
            visibilityType: ShippingDeliveryVisibilityType.cantOrder,
          ),
        );
      }
    }
    final List<AddressData> addresses = LocalStorage.instance.getNewAddresses();
    int addressIndex = 0;
    for (int i = 0; i < addresses.length; i++) {
      if (addresses[i].isDefault ?? false) {
        addressIndex = i;
        break;
      }
    }
    state = state.copyWith(
      shippingDataList: shippingDataList,
      addressIndex: addressIndex,
    );
  }

  void updateCoupons(BuildContext context) {
    // final address =
    //     LocalStorage.instance.getLocalAddressesList()[state.addressIndex];
    state = state.copyWith(
      applyCoupons: state.shops
          .map(
            (shop) => ApplyCouponData(
              shopId: shop.id ?? 0,
              coupon: '',
              isApplied: false,
              isError: false,
            ),
          )
          .toList(),
    );
  }

  void changeDeliveryType(DeliveryTypeEnum deliveryType, {ShopData? shop}) {
    final ShippingData shippingData =
        state.shippingDataList[state.selectedShopIndex];
    final List<ShippingData> newList = List.from(state.shippingDataList);
    newList[state.selectedShopIndex] =
        shippingData.copyWith(activeDelivery: deliveryType);
    state = state.copyWith(
        shippingDataList: newList,
        deliveryFee: shop?.price?.toDouble() ?? 0,
        deliveryTypeId: shop?.id ?? 1);
    checkContinueEnabled();
  }

  void checkContinueEnabled() {
    bool isContinueEnabled = false;
    if (state.pickUpDate.isNotEmpty) {
      isContinueEnabled = true;
    } else if (state.deliveryDate.isNotEmpty && state.deliveryTime.isNotEmpty) {
      isContinueEnabled = true;
    } else {
      isContinueEnabled = isContinueEnabled;
    }
    state = state.copyWith(isContinueEnabled: isContinueEnabled);
  }

  void checkPaymentValid(double totalAmount) {
    bool isPaymentValid = true;
    final num wallet = LocalStorage.instance.getWalletData()?.price ?? 0;
    final payment = state.payments[state.selectedPaymentIndex];
    if (payment.tag == 'wallet') {
      if (wallet < totalAmount) {
        isPaymentValid = false;
      }
    }
    state = state.copyWith(isPaymentValid: isPaymentValid);
  }

  void changeAddress(int index) {
    state = state.copyWith(addressIndex: index);
  }

  void setDeliveryDate(DateTime date) {
    final String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    state = state.copyWith(deliveryDate: formattedDate);
    checkContinueEnabled();
  }

  void setDeliveryTime(DateTime date) {
    final String formattedTime = DateFormat.Hm().format(date);
    state = state.copyWith(deliveryTime: formattedTime);
    checkContinueEnabled();
  }

  void setPickupDate(DateTime date) {
    final String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    state = state.copyWith(pickUpDate: formattedDate);
    checkContinueEnabled();
  }

  Future<void> getMarkers(LatLng latLng) async {
    state = state.copyWith(
      isStoreAddressLoading: true,
      initialLatLng: null,
      markers: {},
    );
    final customIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(38.4.r, 60.r)),
      AppAssets.pngIcStorePin,
    );
    const MarkerId markerId = MarkerId('storeMarkerId');
    final Marker marker = Marker(
      markerId: markerId,
      position: latLng,
      draggable: false,
      icon: customIcon,
    );
    final Map<MarkerId, Marker> markerData = {};
    markerData[markerId] = marker;
    state = state.copyWith(
      markers: markerData,
      initialLatLng: latLng,
      isStoreAddressLoading: false,
    );
  }

  Future<void> fetchPayments(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isPaymentsLoading: true);
      final response = await _paymentsRepository.getPayments();
      response.when(
        success: (data) {
          state = state.copyWith(
            payments: data.data ?? [],
            isPaymentsLoading: false,
          );
        },
        failure: (failure) {
          state = state.copyWith(isPaymentsLoading: false);
          debugPrint('==> get payments failure: $failure');
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

  Future<void> fetchProfileDetails(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isPaymentsLoading: true);
      final response = await _userRepository.getProfileDetails();
      response.when(
        success: (data) {
          state = state.copyWith(isPaymentsLoading: false);
          LocalStorage.instance.setWalletData(data.data?.wallet);
        },
        failure: (failure) {
          state = state.copyWith(isPaymentsLoading: false);
          if (failure == const NetworkExceptions.unauthorisedRequest()) {
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
          debugPrint('==> get profile details failure: $failure');
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

  void setSelectedPaymentIndex(int index) {
    state = state.copyWith(selectedPaymentIndex: index);
  }

  void showToast(context, status) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "Status: $status",
        style: const TextStyle(fontSize: 20),
      ),
    ));
  }

  void changeDelivery(int index) {
    final shippingData = state.shippingDataList[state.selectedShopIndex];
    final newDeliveryData = shippingData.deliveryData?.copyWith(
      shopDelivery: state
          .shippingDataList[state.selectedShopIndex].shopDeliveries?[index],
    );
    final newShippingData =
        shippingData.copyWith(deliveryData: newDeliveryData);
    final List<ShippingData> newList = List.from(state.shippingDataList);
    newList[state.selectedShopIndex] = newShippingData;
    state = state.copyWith(shippingDataList: newList);
  }

  Future<void> makeAnOrder(
    BuildContext context,
    OrderState orderState,
    OrderNotifier orderNotifier,
  ) async {
    // createPaypalPayment(
    //   context,
    //   (orderState.calculateResponse?.data?.orderTotal ?? 0) + state.deliveryFee,
    // );
    // await makeStripePayment(
    //     context,
    //     (orderState.calculateResponse?.data?.orderTotal ?? 0) +
    //         state.deliveryFee,
    //     1);
    // await makeRazorpayPayment(
    //   (orderState.calculateResponse?.data?.orderTotal ?? 0) + state.deliveryFee,
    // );
    // await makePayStackPayment(
    //   context,
    //   (orderState.calculateResponse?.data?.orderTotal ?? 0) + state.deliveryFee,
    // );
    // return;
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isCreatingOrder: true);
      final List<ShopTotalData> shopTotals = orderState.shopTotals;
      final List<ShippingData> shippingList = state.shippingDataList;
      List<ShopOrder> shopsOrder = [];
      int? shopID;
      int? deliveryAddressId;
      String? deliveryDate;
      String? deliveryTime;
      String? deliveryType;
      for (final shopTotal in shopTotals) {
        List<ProductOrder> products = [];
        for (final product in shopTotal.cartProducts) {
          shopID = product.shopID;
          final bool hasDiscount = product.selectedStock?.discount != null &&
              (product.selectedStock?.discount ?? 0) > 0;
          final productsPrice = (hasDiscount
                  ? ((product.selectedStock?.price ?? 0) -
                      (product.selectedStock?.discount ?? 0))
                  : product.selectedStock?.price ?? 0) *
              (product.quantity ?? 1);
          final productTax = (orderState.totalProductsTax);
          products.add(
            ProductOrder(
              shopId: shopID ?? 0,
              stockId: product.selectedStock?.id ?? 0,
              price: product.selectedStock?.price ?? 0,
              quantity: product.quantity ?? 0,
              tax: productTax,
              discount: (product.selectedStock?.discount ?? 0) *
                  (product.quantity ?? 1),
              totalPrice: productsPrice + productTax,
            ),
          );
        }
        for (final shipping in shippingList) {
          if (shipping.shopId == shopTotal.shopData.id) {
            deliveryAddressId = shipping.activeDelivery ==
                    DeliveryTypeEnum.delivery
                ? LocalStorage.instance.getNewAddresses()[state.addressIndex].id
                : null;
            deliveryDate = shipping.activeDelivery == DeliveryTypeEnum.delivery
                ? state.deliveryDate
                : state.pickUpDate;
            deliveryTime = shipping.activeDelivery == DeliveryTypeEnum.delivery
                ? state.deliveryTime
                : null;
            deliveryType = shipping.activeDelivery == DeliveryTypeEnum.delivery
                ? 'delivery'
                : 'pickup';
            break;
          }
        }
        shopsOrder.add(
          ShopOrder(
            shopId: shopID ?? 0,
            deliveryFee: state.deliveryFee,
            deliveryTypeId: state.deliveryTypeId,
            deliveryAddressId: deliveryAddressId,
            tax: shopTotal.onlyShopTax,
            products: products,
            deliveryDate: deliveryDate,
            deliveryTime: deliveryTime,
            coupon: state.coupon,
          ),
        );
        shopID = 0;
      }
      final orderBody = OrderBodyData(
        deliveryId: state.deliveryTypeId,
        coupon: state.coupon,
        deliveryType: deliveryType,
        userId: LocalStorage.instance.getUser()?.id ?? 0,
        total: orderState.totalAmount,
        currencyId: LocalStorage.instance.getSelectedCurrency()?.id ?? 0,
        currencyRate: LocalStorage.instance.getSelectedCurrency()?.rate ?? 0,
        note: state.comment,
        shops: shopsOrder,
      );
      checkData(orderBody);
      // return;
      final response = await _ordersRepository.createOrder(orderBody);
      response.when(
        success: (data) async {
          print(state.payments[state.selectedPaymentIndex].tag);
          switch (state.payments[state.selectedPaymentIndex].tag) {
            case 'paypal':
              // await createPaypalPayment(
              //   context,
              //   (data.data?.usdPrice ?? 0).toDouble(),
              //   data.data?.id,
              // );
              break;
            case 'cash':
              await createTransaction(context, data.data?.id);
              break;
            case 'wallet':
              await createTransaction(context, data.data?.id);
              break;

            case 'credit':
              {
                try {
                  var total = orderState.calculateResponse!.data!.orderTotal!;
                  var grandTotal = total + 1.0 + state.deliveryFee;
                  print("total : $grandTotal");
                  final paymentConfig = PaymentConfig(
                    publishableApiKey:
                        'pk_live_AcKnHdHtuRNUEB4Wv6vftyzdxhp1YBBaXaYx2Pks',
                    //'pk_test_Pn71T2T1L17Q17goFziUR9pdj5hRSUSGJeeSwdLT',
                    amount: grandTotal.toInt() * 100,
                    // SAR 257.58
                    description: 'order #${data.data?.id}',
                    applePay: ApplePayConfig(
                        merchantId: 'merchant.com.mizatak.appuser',
                        label: 'Bolver',
                        manual: false),
                    creditCard: CreditCardConfig(
                      saveCard: false,
                      manual: false,
                    ),
                  );
                  Future<void> onPaymentResult(result) async {
                    if (result is PaymentResponse) {
                      print("RESULT IS ${result.status.name}");
                      switch (result.status) {
                        case PaymentStatus.paid:
                          // handle success.
                          AppHelpers.showCheckFlash(
                            context,
                            'Payment Done Successfully',
                          );
                          await createTransaction(context, data.data?.id);
                          break;
                        // case PaymentStatus.authorized:
                        //   // handle authorization.
                        //   await createTransaction(context, data.data?.id);
                        //   break;
                        case PaymentStatus.failed:
                          // handle failure.
                          // await createTransaction(context, data.data?.id);
                          AppHelpers.showCheckFlash(
                            context,
                            'Payment Failed, Try Again',
                          );
                          print("Failed SUCCESSFULLY IS failed");
                          break;
                        default:
                          {
                            print(
                                "THIS IS DEFAULT and state is ${result.status.name}");
                          }
                      }
                    }
                    // handle failures.
                    if (result is ApiError) {
                      AppHelpers.showCheckFlash(
                        context,
                        "Api error is ${result.message}",
                      );
                      print("Api error is ${result.message}");
                    }
                    if (result is AuthError) {
                      AppHelpers.showCheckFlash(
                        context,
                        'Auth error : ${result.message}',
                      );
                      print('Auth error : ${result.message}');
                    }
                    if (result is ValidationError) {
                      AppHelpers.showCheckFlash(
                        context,
                        "Validation error : ${result.message}",
                      );
                      print("Validation error : ${result.message}");
                    }
                    if (result is PaymentCanceledError) {
                      AppHelpers.showCheckFlash(
                        context,
                        "Payment canceled error : ${result.message}",
                      );
                      print("Payment canceled error : ${result.message}");
                    }
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoyaserPayment(
                          onPaymentResult: onPaymentResult,
                          paymentConfig: paymentConfig),
                    ),
                  );
                  break;
                } catch (e) {
                  AppHelpers.showCheckFlash(
                    context,
                    'Error in $e',
                  );
                  break;
                }
              }
            case 'stripe':
              // await makeStripePayment(
              //   context,
              //   (orderState.calculateResponse?.data?.orderTotal ?? 0) +
              //       state.deliveryFee,
              //   data.data?.id,
              // );
              {
                try {
                  var total = orderState.calculateResponse!.data!.orderTotal!;
                  var grandTotal = total + 1.0 + state.deliveryFee;
                  print("total : $grandTotal");
                  final paymentConfig = PaymentConfig(
                    publishableApiKey:
                        'pk_test_Pn71T2T1L17Q17goFziUR9pdj5hRSUSGJeeSwdLT',
                    amount: grandTotal.toInt() * 100,
                    // SAR 257.58
                    description: 'order #${data.data?.id}',
                    applePay: ApplePayConfig(
                        merchantId: 'merchant.com.mizatak.appuser',
                        label: 'Bolver',
                        manual: false),
                    creditCard: CreditCardConfig(
                      saveCard: false,
                      manual: false,
                    ),
                  );
                  Future<void> onPaymentResult(result) async {
                    if (result is PaymentResponse) {
                      print("RESULT IS ${result.status.name}");
                      switch (result.status) {
                        case PaymentStatus.paid:
                          // handle success.
                          AppHelpers.showCheckFlash(
                            context,
                            'Payment Done Successfully',
                          );
                          await createTransaction(context, data.data?.id);
                          break;
                        // case PaymentStatus.authorized:
                        //   // handle authorization.
                        //   await createTransaction(context, data.data?.id);
                        //   break;
                        case PaymentStatus.failed:
                          // handle failure.
                          // await createTransaction(context, data.data?.id);
                          AppHelpers.showCheckFlash(
                            context,
                            'Payment Failed, Try Again',
                          );
                          print("Failed SUCCESSFULLY IS failed");
                          break;
                        default:
                          {
                            print(
                                "THIS IS DEFAULT and state is ${result.status.name}");
                          }
                      }
                    }
                    // handle failures.
                    if (result is ApiError) {
                      AppHelpers.showCheckFlash(
                        context,
                        "Api error is ${result.message}",
                      );
                      print("Api error is ${result.message}");
                    }
                    if (result is AuthError) {
                      AppHelpers.showCheckFlash(
                        context,
                        'Auth error is ${result.message}',
                      );
                      print('Auth error is ${result.message}');
                    }
                    if (result is ValidationError) {
                      AppHelpers.showCheckFlash(
                        context,
                        "Validation error is ${result.message}",
                      );
                      print("Validation error is ${result.message}");
                    }
                    if (result is PaymentCanceledError) {
                      AppHelpers.showCheckFlash(
                        context,
                        "Payment canceled error is ${result.message}",
                      );
                      print("Payment canceled error is ${result.message}");
                    }
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoyaserPayment(
                          onPaymentResult: onPaymentResult,
                          paymentConfig: paymentConfig),
                    ),
                  );
                  break;
                } catch (e) {
                  AppHelpers.showCheckFlash(
                    context,
                    'Error in $e',
                  );
                  break;
                }
              }
          }
        },
        failure: (failure) {
          state = state.copyWith(isCreatingOrder: false);
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
          } else if (failure == const NetworkExceptions.badRequest()) {
            AppHelpers.showCheckFlash(
              context,
              'Bad request!',
            );
          }
          debugPrint('==> create order failure: $failure');
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

  Future<void> createTransaction(BuildContext context, int? orderId) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      final transactionResponse = await _paymentsRepository.createTransaction(
        orderId: orderId ?? 0,
        paymentId: state.payments[state.selectedPaymentIndex].id ?? 0,
      );
      transactionResponse.when(
        success: (transactionData) {
          state = state.copyWith(isCreatingOrder: false);
          LocalStorage.instance.deleteCartProducts();
          context.pushRoute(const OrderHistoryRoute());
        },
        failure: (transactionFailure) {
          state = state.copyWith(isCreatingOrder: false);
          LocalStorage.instance.deleteCartProducts();
          context.pushRoute(const OrderHistoryRoute());
          AppHelpers.showCheckFlash(
            context,
            'Error with creating transaction!',
          );
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

  Future<void> makeRazorpayPayment(double amount) async {
    var options = {
      'key': "",
      'amount': (amount * 100).toStringAsFixed(2),
      'name': 'Githubit',
      'currency': LocalStorage.instance.getSelectedCurrency()?.title,
      'description': 'Order pay',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      state.razorpay?.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void checkData(OrderBodyData orderBody) {
    log('===> order body: $orderBody');
  }

  void setComment(String? value) {
    state = state.copyWith(comment: value?.trim());
  }

  void setShopCoupon(String coupon) {
    // final List<ApplyCouponData> applyCoupons = List.from(state.applyCoupons);
    // int index = 0;
    // for (int i = 0; i < applyCoupons.length; i++) {
    //   if (shopId == applyCoupons[i].shopId) {
    //     index = i;
    //     break;
    //   }
    // }
    // applyCoupons[index] =
    //     applyCoupons[index].copyWith(coupon: coupon, isError: false);
    state = state.copyWith(coupon: coupon);
  }

  void setShopCouponStatus(bool status, int shopId) {
    final List<ApplyCouponData> applyCoupons = List.from(state.applyCoupons);
    int index = 0;
    for (int i = 0; i < applyCoupons.length; i++) {
      if (shopId == applyCoupons[i].shopId) {
        index = i;
        break;
      }
    }
    applyCoupons[index] =
        applyCoupons[index].copyWith(isApplied: status, isError: !status);
    state = state.copyWith(applyCoupons: applyCoupons);
  }

  Future<void> checkCoupon(
    BuildContext context,
    OrderNotifier orderNotifier,
  ) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isCheckingCoupon: true);
      // for (final couponData in state.applyCoupons) {
      //   print(couponData.shopId);
      //   if (shopId == couponData.shopId) {
      //     coupon = couponData.coupon;
      //     break;
      //   }
      // }

      final response = await _ordersRepository.checkCoupon(
        coupon: state.coupon,
        shopId: 0,
      );
      response.when(
        success: (data) async {
          state = state.copyWith(
              isCheckingCoupon: false, isApplied: true, isError: false);
          setShopCouponStatus(true, 0);
          orderNotifier.setCoupon(
            data.data?.price ?? 0.0,
            data.data?.type == 'fix' ? CouponType.fix : CouponType.percent,
          );
        },
        failure: (failure) {
          state = state.copyWith(
              isCheckingCoupon: false, isApplied: false, isError: true);
          setShopCouponStatus(false, 0);
          debugPrint('==> check coupon failure: $failure');
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

  Future<void> checkCashback(BuildContext context, double amount) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isCheckingCashback: true);
      final response = await _ordersRepository.checkCashback(amount: amount);
      response.when(
        success: (data) async {
          state = state.copyWith(
            isCheckingCashback: false,
            cashbackAmount: (data.data?.price ?? 0).toDouble(),
          );
        },
        failure: (failure) {
          state = state.copyWith(isCheckingCashback: false);
          debugPrint('==> check cashback failure: $failure');
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

  // Future<void> createPaypalPayment(
  //   BuildContext context,
  //   double total,
  //   int? orderId,
  // ) async {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (BuildContext context) => UsePaypal(
  //         sandboxMode: false,
  //         clientId: 'clientIdPayPal',
  //         secretKey: 'secretKeyPayPal',
  //         returnURL: "https://goshops.com/",
  //         cancelURL: "https://goshops.com/",
  //         transactions: [
  //           {
  //             "amount": {
  //               "total": '$total',
  //               "currency": "USD",
  //             },
  //             "description": "The payment transaction description.",
  //           }
  //         ],
  //         note: "Contact us for any questions on your order.",
  //         onSuccess: (Map params) async {
  //           debugPrint("onSuccess: $params");
  //         },
  //         onError: (error) {
  //           debugPrint("onError: $error");
  //         },
  //         onCancel: (params) {
  //           debugPrint('cancelled: $params');
  //         },
  //       ),
  //     ),
  //   );
  // }

  // makeStripePayment(
  // context,
  // (orderState.calculateResponse?.data?.orderTotal ?? 0) +
  // state.deliveryFee,
  // data.data?.id,
  // );

  Future<void> makeStripePayment(
    BuildContext context,
    double amount,
    int? orderId,
  ) async {
    try {} catch (e) {
      debugPrint('Error: $e');
    }
  }

  // Future<void> makeStripePayment(
  //   BuildContext context,
  //   double amount,
  //   int? orderId,
  // ) async {
  //   try {
  //     Map<String, dynamic>? paymentIntentData =
  //         await createStripePaymentIntent(context, amount, orderId);
  //     if (paymentIntentData != null) {
  //       // await Stripe.instance.initPaymentSheet(
  //       //   paymentSheetParameters: SetupPaymentSheetParameters(
  //       //     merchantDisplayName: 'Prospects',
  //       //     customerId: paymentIntentData['customer'],
  //       //     paymentIntentClientSecret: paymentIntentData['client_secret'],
  //       //     customerEphemeralKeySecret: paymentIntentData['ephemeralKey'],
  //       //   ),
  //       // );
  //       // await Stripe.instance
  //       //     .presentPaymentSheet()
  //       //     .then((value) => createTransaction(context, orderId));
  //       debugPrint('===> stripe payment succeeded');
  //     }
  //   } catch (e) {
  //     AppHelpers.showCheckFlash(
  //       context,
  //       AppHelpers.getTranslation(TrKeys.errorOccurredWithPayingViaStripe),
  //     );
  //     createTransaction(context, orderId);
  //   }
  // }
  //
  // createStripePaymentIntent(
  //   BuildContext context,
  //   double amount,
  //   int? orderId,
  // ) async {
  //   try {
  //     Map<String, dynamic> body = {
  //       'amount': (amount * 100).toInt().toString(),
  //       'currency': LocalStorage.instance.getSelectedCurrency()?.title,
  //       'payment_method_types[]': 'card'
  //     };
  //     debugPrint('===> create stripe payment intent body: $body');
  //     var response = await http.post(
  //       Uri.parse('https://api.stripe.com/v1/payment_intents'),
  //       body: body,
  //       headers: {
  //         'Authorization': 'Bearer "',
  //         'Content-Type': 'application/x-www-form-urlencoded'
  //       },
  //     );
  //     debugPrint('===> create stripe paymant response body: ${response.body}');
  //     return jsonDecode(response.body);
  //   } catch (err) {
  //     debugPrint('===> error stripe payment error: $err');
  //   }
  // }

  bool checkIfWalletIsEnough(BuildContext context, OrderState orderState) {
    final bool isWallet =
        state.payments[state.selectedPaymentIndex].tag?.toLowerCase() ==
            'wallet'.toLowerCase();
    if (isWallet) {
      final orderAmount =
          (orderState.calculateResponse?.data?.orderTotal ?? 0) +
              state.deliveryFee;
      final walletAmount = LocalStorage.instance.getWalletData()?.price ?? 0;
      debugPrint('====> check if wallet is enough order amount: $orderAmount');
      debugPrint(
          '====> check if wallet is enough wallet amount: $walletAmount');
      if (orderAmount > walletAmount) {
        return false;
      }
    }
    return true;
  }
}
