import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/liked_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';
import '../../../../../../../core/constants/constants.dart';

class LikedNotifier extends StateNotifier<LikedState> {
  final ProductsRepository _productsRepository;
  Timer? _timer;

  LikedNotifier(this._productsRepository) : super(const LikedState());

  void setQuery(String query) {
    if (state.query == query) {
      return;
    }
    state = state.copyWith(query: query.trim());
    if (state.query.isNotEmpty) {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          _searchProducts();
        },
      );
    } else {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          state = state.copyWith(isSearching: false);
        },
      );
    }
  }

  Future<void> _searchProducts() async {
    state = state.copyWith(isSearchLoading: true, isSearching: true);
    final response =
        await _productsRepository.searchNewProducts(query: state.query);
    response.when(
      success: (data) {
        state = state.copyWith(
          isSearchLoading: false,
          searchedProducts: data.products ?? [],
        );
      },
      failure: (activeFailure) {
        state = state.copyWith(isSearchLoading: false);
        debugPrint('==> search products failure: $activeFailure');
      },
    );
  }

  Future<void> fetchLikedProducts() async {
    final List<int> ids = LocalStorage.instance.getLikedProductsList();
    if (ids.isEmpty) {
      state = state.copyWith(likedProducts: []);
      return;
    }
    state = state.copyWith(isLikedProductsLoading: true, likedProducts: []);
    final response = await _productsRepository.getProductsByIds(ids);
    response.when(
      success: (data) {
        final List<ProductData> likedProducts = data.data ?? [];
        final List<ProductData> filtered = [];
        for (final productId in ids) {
          for (final likedProduct in likedProducts) {
            if (productId == likedProduct.id) {
              filtered.add(likedProduct);
            }
          }
        }
        state = state.copyWith(
          likedProducts: filtered,
          isLikedProductsLoading: false,
        );
      },
      failure: (failure) {
        state = state.copyWith(isLikedProductsLoading: false);
        debugPrint('==> get viewed products failure: $failure');
      },
    );
  }

  void setListAlignment(ListAlignment alignment) {
    state = state.copyWith(listAlignment: alignment);
  }

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
}
