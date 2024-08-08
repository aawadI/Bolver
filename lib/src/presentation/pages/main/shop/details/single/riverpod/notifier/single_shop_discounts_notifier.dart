import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/utils/utils.dart';
import '../state/single_shop_discounts_state.dart';
import '../../../../../../../../repository/repository.dart';

class SingleShopDiscountsNotifier
    extends StateNotifier<SingleShopDiscountsState> {
  final ProductsRepository _productsRepository;

  SingleShopDiscountsNotifier(this._productsRepository)
      : super(const SingleShopDiscountsState());

  Future<void> fetchDiscountProducts({int? shopId}) async {
    state = state.copyWith(isLoading: true, products: []);
    final response =
        await _productsRepository.getDiscountProducts(shopId: shopId);
    response.when(
      success: (data) {
        state = state.copyWith(products: data.data ?? [], isLoading: false);
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> fetch discount products fail: $fail');
      },
    );
  }

  Future<void> likeOrUnlikeProduct(int? productId) async {
    final List<int> likedProducts =
        LocalStorage.instance.getLikedProductsList();
    bool alreadyLiked = false;
    int indexLiked = 0;
    for (int i = 0; i < likedProducts.length; i++) {
      if (likedProducts[i] == productId) {
        alreadyLiked = true;
        indexLiked = i;
      }
    }
    if (alreadyLiked) {
      likedProducts.removeAt(indexLiked);
    } else {
      likedProducts.insert(0, productId ?? 0);
    }
    LocalStorage.instance.setLikedProductsList(likedProducts.toSet().toList());
    state = state.copyWith();
  }
}
