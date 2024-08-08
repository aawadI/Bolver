import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/home_most_sold_state.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';

class HomeMostSoldNotifier extends StateNotifier<HomeMostSoldState> {
  final ProductsRepository _productsRepository;

  HomeMostSoldNotifier(this._productsRepository)
      : super(const HomeMostSoldState());

  Future<void> fetchMostSoldProducts() async {
    state = state.copyWith(isLoading: true, products: []);
    final response = await _productsRepository.getMostSoldProducts(page: 1);
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, products: data.data ?? []);
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> fetch most sold products fail: $fail');
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
