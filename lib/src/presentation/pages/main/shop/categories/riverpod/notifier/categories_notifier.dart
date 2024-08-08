import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/categories_state.dart';
import '../../../../../../../repository/repository.dart';

class CategoriesNotifier extends StateNotifier<CategoriesState> {
  final ProductsRepository _productsRepository;
  final CategoriesRepository _categoriesRepository;
  Timer? _timer;

  CategoriesNotifier(this._productsRepository, this._categoriesRepository)
      : super(const CategoriesState());

  Future<void> fetchCategories() async {
    state = state.copyWith(isLoading: true, categories: []);
    final response = await _categoriesRepository.getAllCategories();
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, categories: data.data ?? []);
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get categories failure: $fail');
      },
    );
  }

  void selectId(int id){
    state = state.copyWith(categoryId: id);
  }

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
