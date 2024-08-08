import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/saved_stores_state.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';

class SavedStoresNotifier extends StateNotifier<SavedStoresState> {
  final ShopsRepository _shopsRepository;
  Timer? _timer;

  SavedStoresNotifier(this._shopsRepository) : super(const SavedStoresState());

  void setQuery(String query) {
    state = state.copyWith(query: query.trim());
    if (state.query.isNotEmpty) {
      if (_timer?.isActive ?? false) {
        _timer?.cancel();
      }
      _timer = Timer(
        const Duration(milliseconds: 500),
        () {
          _searchShops();
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

  Future<void> _searchShops() async {
    state = state.copyWith(isSearchLoading: true, isSearching: true);
    final response = await _shopsRepository.searchShops(state.query);
    response.when(
      success: (data) {
        state = state.copyWith(
          isSearchLoading: false,
          searchedShops: data.data ?? [],
        );
      },
      failure: (fail) {
        state = state.copyWith(isSearchLoading: false);
        debugPrint('==> search shops failure: $fail');
      },
    );
  }

  Future<void> fetchSavedShops() async {
    final List<int> ids = LocalStorage.instance.getSavedShopsList();
    if (ids.isEmpty) {
      return;
    }
    state = state.copyWith(isLoading: true);
    final response = await _shopsRepository.getShopsByIds(ids);
    response.when(
      success: (data) async {
        state = state.copyWith(shops: data.data ?? [], isLoading: false);
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> fetch saved shops failure: $fail');
      },
    );
  }
}
