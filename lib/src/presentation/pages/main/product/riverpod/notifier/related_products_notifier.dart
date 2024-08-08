import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/related_products_state.dart';
import '../../../../../../models/models.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../repository/repository.dart';

class RelatedProductsNotifier extends StateNotifier<RelatedProductsState> {
  final ProductsRepository _productsRepository;

  RelatedProductsNotifier(this._productsRepository)
      : super(const RelatedProductsState());

  void likeOrUnlikeProduct(int? productId) {
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

  Future<void> fetchRelatedProducts({ProductData? product}) async {
    state = state.copyWith(isLoading: true, products: []);
    final response = await _productsRepository.getProductsPaginate(
      page: 1,
      childCategory: product?.category,
      shopIds: product?.shopId != null ? [product!.shopId!] : null,
      brandIds: product?.brandId != null ? [product!.brandId!] : null,
    );
    response.when(
      success: (data) {
        final List<ProductData> relatedProducts = data.data ?? [];
        final List<ProductData> filtered = [];
        for (final related in relatedProducts) {
          if (related.id == product?.id) {
            continue;
          }
          filtered.add(related);
        }
        state = state.copyWith(products: filtered, isLoading: false);
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get related products failure: $fail');
      },
    );
  }
}
