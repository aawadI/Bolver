import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/brands_state.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../repository/repository.dart';

class BrandsNotifier extends StateNotifier<BrandsState> {
  final BrandsRepository _brandsRepository;
  int _page = 0;
  bool _hasMore = true;
  Timer? _timer;

  BrandsNotifier(this._brandsRepository) : super(const BrandsState());

  Future<void> fetchMoreBrands() async {
    if (!_hasMore || state.isMoreLoading) {
      return;
    }
    state = state.copyWith(isMoreLoading: true);
    final response = await _brandsRepository.getBrandsPaginate(++_page);
    response.when(
      success: (data) {
        List<BrandData> brands = List.from(state.brands);
        final List<BrandData> newBrands = data.data ?? [];
        brands.addAll(newBrands);
        state = state.copyWith(brands: brands, isMoreLoading: false);
        _hasMore = newBrands.length >= 18;
      },
      failure: (fail) {
        state = state.copyWith(isMoreLoading: false);
        debugPrint('===> fetch more brands fail $fail');
        _page--;
      },
    );
  }

  Future<void> initialFetchBrands() async {
    _hasMore = true;
    _page = 0;
    state = state.copyWith(isLoading: true);
    final response = await _brandsRepository.getBrandsPaginate(++_page);
    response.when(
      success: (data) {
        final List<BrandData> brands = data.data ?? [];
        state = state.copyWith(brands: brands, isLoading: false);
        _hasMore = brands.length >= 18;
      },
      failure: (fail) {
        _page--;
        state = state.copyWith(isLoading: false);
        debugPrint('===> initial fetch brands fail $fail');
      },
    );
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
          _searchBrands();
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

  Future<void> _searchBrands() async {
    state = state.copyWith(isSearchLoading: true, isSearching: true);
    final response = await _brandsRepository.searchBrands(state.query);
    response.when(
      success: (data) {
        state = state.copyWith(
          isSearchLoading: false,
          searchedBrands: data.data ?? [],
        );
      },
      failure: (fail) {
        state = state.copyWith(isSearchLoading: false);
        debugPrint('==> search brands fail: $fail');
      },
    );
  }
}
