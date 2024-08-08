import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/utils/utils.dart';
import '../state/home_discounts_state.dart';
import '../../../../../../../repository/repository.dart';

class HomeDiscountsNotifier extends StateNotifier<HomeDiscountsState> {
  final ProductsRepository _productsRepository;

  HomeDiscountsNotifier(this._productsRepository)
      : super(const HomeDiscountsState());

  Future<void> fetchDiscountProducts() async {
    state = state.copyWith(isLoading: true, products: []);
    final response = await _productsRepository.getDiscountProducts();
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
