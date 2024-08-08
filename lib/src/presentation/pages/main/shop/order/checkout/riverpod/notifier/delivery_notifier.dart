import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/delivery_state.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../repository/repository.dart';
import '../../../../../../../../core/constants/constants.dart';

class DeliveryNotifier extends StateNotifier<DeliveryState> {
  final OrdersRepository _ordersRepository;

  DeliveryNotifier(this._ordersRepository) : super(const DeliveryState());

  void updateUi() {
    state = state.copyWith();
  }

  void changeDelivery(int index) {
    state = state.copyWith(selectedDeliveryIndex: index);
  }

  void changeAddress(int index) {
    state = state.copyWith(addressIndex: index);
  }

  Future<void> fetchDeliveries() async {
    state = state.copyWith(isLoading: true);
    final response = await _ordersRepository.getDelivery();
    response.when(
      success: (data) {
        List<NewDeliveryData> deliveries = data.data ?? [];
        final List<CartProductData> cartProducts =
            LocalStorage.instance.getCartProducts();
        num weight = 0;
        for (final product in cartProducts) {
          weight += (product.selectedStock?.product?.category?.weight ?? 0) * (product.quantity ?? 0);
        }
        for (int i = 0; i < deliveries.length; i++) {
          final num? price = (deliveries[i].countries?.isNotEmpty ?? false)
              ? deliveries[i].countries![0].price
              : 0;
          deliveries[i] =
              deliveries[i].copyWith(localPrice: weight * (price ?? 0));
        }
        ShippingDeliveryVisibilityType visibilityType =
            ShippingDeliveryVisibilityType.cantOrder;
        if (deliveries.isNotEmpty) {
          bool hasPickup = false;
          for (int i = 0; i < deliveries.length; i++) {
            if (deliveries[i].type == 'pickup') {
              hasPickup = true;
            }
          }
          if (hasPickup) {
            if (deliveries.length > 1) {
              visibilityType = ShippingDeliveryVisibilityType.both;
            } else {
              visibilityType = ShippingDeliveryVisibilityType.onlyPickup;
            }
          } else {
            visibilityType = ShippingDeliveryVisibilityType.onlyDelivery;
          }
        }
        state = state.copyWith(
          isLoading: false,
          deliveries: deliveries,
          visibilityType: visibilityType,
        );
      },
      failure: (fail) {
        debugPrint('===> fetch deliveries fail $fail');
        state = state.copyWith(isLoading: false);
      },
    );
  }

  void changeDeliveryType(DeliveryTypeEnum deliveryType) {
    if (deliveryType == state.selectedDeliveryType) {
      return;
    }
    state = state.copyWith(selectedDeliveryType: deliveryType);
  }
}
