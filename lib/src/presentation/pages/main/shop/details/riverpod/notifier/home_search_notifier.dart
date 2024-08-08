import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/home_search_state.dart';
import '../../../../../../../repository/repository.dart';

class HomeSearchNotifier extends StateNotifier<HomeSearchState> {
  final ProductsRepository _productsRepository;
  Timer? _timer;

  HomeSearchNotifier(this._productsRepository) : super(const HomeSearchState());

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
          searchedShops: data.shops ?? [],
          searchedBrands: data.brands ?? [],
          searchedProducts: data.products ?? [],
          searchedCategories: data.categories ?? [],
        );
      },
      failure: (fail) {
        state = state.copyWith(isSearchLoading: false);
        debugPrint('==> search products failure: $fail');
      },
    );
  }
}
