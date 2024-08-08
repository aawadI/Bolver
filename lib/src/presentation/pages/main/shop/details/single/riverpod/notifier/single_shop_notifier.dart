import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/single_shop_state.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../repository/repository.dart';

class SingleShopNotifier extends StateNotifier<SingleShopState> {
  final ShopsRepository _shopsRepository;

  SingleShopNotifier(this._shopsRepository) : super(const SingleShopState());

  List<String> _getDeliveryHours(String? openTime, String? closeTime) {
    if ((openTime?.length ?? 0) < 5 || (closeTime?.length ?? 0) < 2) {
      return [];
    }
    List<String> hours = [];
    final int openHour = int.parse(openTime!.substring(3, 5)) == 0
        ? int.parse(openTime.substring(0, 2))
        : int.parse(openTime.substring(0, 2)) + 1;
    final int closeHour = int.parse(closeTime!.substring(0, 2));
    for (int i = openHour; i < closeHour; i++) {
      hours.add('$i:00 - ${i + 1}:00');
    }
    return hours;
  }

  void setDeliveryDate(DateTime date) {
    state = state.copyWith(selectedDate: date);
  }

  void saveOrDeleteStore() {
    final List<int> ids = LocalStorage.instance.getSavedShopsList();
    bool alreadySaved = false;
    int indexSaved = 0;
    for (int i = 0; i < ids.length; i++) {
      if (ids[i] == state.shop?.id) {
        alreadySaved = true;
        indexSaved = i;
        break;
      }
    }
    if (alreadySaved) {
      ids.removeAt(indexSaved);
    } else {
      ids.insert(0, state.shop?.id ?? 0);
    }
    LocalStorage.instance.setSavedShopsList(ids);
    checkIsSaved();
  }

  void checkIsSaved() {
    final List<int> ids = LocalStorage.instance.getSavedShopsList();
    bool isSaved = false;
    for (final id in ids) {
      if (id == state.shop?.id) {
        isSaved = true;
      }
    }
    state = state.copyWith(isSaved: isSaved);
  }

  Future<void> fetchShopDetails({ShopData? shop, VoidCallback? failed}) async {
    state = state.copyWith(isLoading: true);
    final response = await _shopsRepository.getSingleShop(uuid: shop?.uuid);
    response.when(
      success: (data) {
        state = state.copyWith(
          isLoading: false,
          shop: data.data,
          deliveryTimes:
              _getDeliveryHours(data.data?.openTime, data.data?.closeTime),
        );
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> shop details fail: $fail');
      },
    );
  }
}
