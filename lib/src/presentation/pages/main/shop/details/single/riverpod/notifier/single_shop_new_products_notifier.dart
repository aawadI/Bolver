import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/single_shop_new_products_state.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../repository/repository.dart';

class SingleShopNewProductsNotifier
    extends StateNotifier<SingleShopNewProductsState> {
  final ProductsRepository _productsRepository;

  SingleShopNewProductsNotifier(this._productsRepository)
      : super(const SingleShopNewProductsState());

  Future<void> fetchNewProducts({int? shopId}) async {
    state = state.copyWith(isLoading: true);
    final response = await _productsRepository
        .getProductsPaginate(page: 1, shopIds: [shopId ?? 0]);
    response.when(
      success: (data) {
        state = state.copyWith(products: data.data ?? [], isLoading: false);
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> fetch new products fail: $fail');
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
