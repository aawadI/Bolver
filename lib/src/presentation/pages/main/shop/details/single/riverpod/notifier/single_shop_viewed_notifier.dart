import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/single_shop_viewed_state.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../repository/repository.dart';

class SingleShopViewedNotifier extends StateNotifier<SingleShopViewedState> {
  final ProductsRepository _productsRepository;

  SingleShopViewedNotifier(this._productsRepository)
      : super(const SingleShopViewedState());

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

  Future<void> fetchViewedProducts({int? shopId}) async {
    final List<int> ids = LocalStorage.instance.getViewedProductsList();
    if (ids.isEmpty) {
      return;
    }
    state = state.copyWith(isLoading: true);
    final response = await _productsRepository.getProductsByIds(ids);
    response.when(
      success: (data) {
        final List<ProductData> viewedProducts = data.data ?? [];
        final List<ProductData> filtered = [];
        for (final productId in ids) {
          for (final viewedProduct in viewedProducts) {
            if (productId == viewedProduct.id &&
                viewedProduct.shopId == shopId) {
              filtered.add(viewedProduct);
            }
          }
        }
        state = state.copyWith(products: filtered, isLoading: false);
      },
      failure: (failure) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get viewed products failure: $failure');
      },
    );
  }
}
