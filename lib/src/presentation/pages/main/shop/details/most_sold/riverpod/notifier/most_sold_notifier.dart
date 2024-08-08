import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/most_sold_state.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../repository/repository.dart';
import '../../../../../../../../core/constants/constants.dart';

class MostSoldNotifier extends StateNotifier<MostSoldState> {
  final ProductsRepository _productsRepository;
  int _page = 0;
  bool _hasMore = true;
  Timer? _timer;

  MostSoldNotifier(this._productsRepository) : super(const MostSoldState());

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
      failure: (fail) {
        state = state.copyWith(isSearchLoading: false);
        debugPrint('==> search products fail: $fail');
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

  Future<void> fetchMoreProducts({int? shopId}) async {
    if (!_hasMore || state.isMoreLoading) {
      return;
    }
    state = state.copyWith(isMoreLoading: true);
    final response =
        await _productsRepository.getMostSoldProducts(page: ++_page,shopId: shopId);
    response.when(
      success: (data) {
        List<ProductData> products = List.from(state.products);
        final List<ProductData> newProducts = data.data ?? [];
        products.addAll(newProducts);
        state = state.copyWith(products: products, isMoreLoading: false);
        _hasMore = newProducts.length >= 10;
      },
      failure: (fail) {
        state = state.copyWith(isMoreLoading: false);
        debugPrint('===> fetch more products fail $fail');
        _page--;
      },
    );
  }

  Future<void> initialFetchProducts({int? shopId}) async {
    _page = 0;
    _hasMore = true;
    state = state.copyWith(isLoading: true);
    final response =
        await _productsRepository.getMostSoldProducts(page: ++_page,shopId: shopId);
    response.when(
      success: (data) {
        final List<ProductData> products = data.data ?? [];
        state = state.copyWith(products: products, isLoading: false);
        _hasMore = products.length >= 10;
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        _page--;
        debugPrint('===> initial fetch products fail $fail');
      },
    );
  }
}
