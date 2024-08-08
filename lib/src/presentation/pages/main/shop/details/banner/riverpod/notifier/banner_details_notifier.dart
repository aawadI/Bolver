import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/banner_details_state.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../repository/repository.dart';
import '../../../../../../../../core/constants/constants.dart';

class BannerDetailsNotifier extends StateNotifier<BannerDetailsState> {
  final BannersRepository _bannersRepository;
  final ProductsRepository _productsRepository;
  Timer? _timer;

  BannerDetailsNotifier(this._bannersRepository, this._productsRepository)
      : super(const BannerDetailsState());

  Future<void> fetchBannerProducts(BuildContext context, int? id) async {
    state = state.copyWith(
      isLoading: true,
      productsCount: 0,
      products: [],
    );
    final response = await _bannersRepository.getBannerProducts(id);
    response.when(
      success: (data) {
        state = state.copyWith(
          products: data.data ?? [],
          productsCount: data.meta?.total ?? 0,
          isLoading: false,
        );
      },
      failure: (failure) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get banner products failure: $failure');
      },
    );
  }

  void setQuery(BuildContext context, String query) {
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
          _searchProducts(context);
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

  Future<void> _searchProducts(BuildContext context) async {
    state = state.copyWith(isSearchLoading: true, isSearching: true);
    final response =
        await _productsRepository.searchNewProducts(query: state.query);
    response.when(
      success: (data) {
        state = state.copyWith(
          isSearchLoading: false,
          searchedProducts: data.products ?? [],
          searchedShops: data.shops ?? [],
          searchedCategories: data.categories ?? [],
          searchedBrands: data.brands ?? [],
        );
      },
      failure: (fail) {
        state = state.copyWith(isSearchLoading: false);
        debugPrint('==> search products failure: $fail');
      },
    );
  }

  void setListAlignment(ListAlignment alignment) {
    state = state.copyWith(listAlignment: alignment);
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
