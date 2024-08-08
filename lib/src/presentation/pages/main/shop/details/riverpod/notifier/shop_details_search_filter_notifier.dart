import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/shop_details_search_filter_state.dart';
import '../../../../../../../repository/repository.dart';

class ShopDetailsSearchFilterNotifier
    extends StateNotifier<ShopDetailsSearchFilterState> {
  final BrandsRepository _brandsRepository;

  ShopDetailsSearchFilterNotifier(this._brandsRepository)
      : super(const ShopDetailsSearchFilterState());

  void increaseBrandCount() {
    if (state.brandCount + 10 < state.brands.length) {
      state = state.copyWith(brandCount: state.brandCount + 10);
    } else {
      state = state.copyWith(
          brandCount:
              state.brandCount + (state.brands.length - state.brandCount));
    }
  }

  void setSelectedBrandId(int? id) {
    state = state.copyWith(selectedBrandId: id ?? 0);
  }

  void clearFilters() {
    state = state.copyWith(selectedBrandId: 0);
  }

  Future<void> fetchBrands() async {
    state = state.copyWith(isLoading: true);
    final response = await _brandsRepository.getAllBrands();
    response.when(
      success: (data) {
        state = state.copyWith(isLoading: false, brands: data.data ?? []);
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> fetch brands fail: $fail');
      },
    );
  }
}
