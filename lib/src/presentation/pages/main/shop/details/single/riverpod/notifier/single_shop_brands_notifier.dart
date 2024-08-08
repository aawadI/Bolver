import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/single_shop_brands_state.dart';
import '../../../../../../../../repository/repository.dart';

class SingleShopBrandsNotifier extends StateNotifier<SingleShopBrandsState> {
  final BrandsRepository _brandsRepository;

  SingleShopBrandsNotifier(this._brandsRepository)
      : super(const SingleShopBrandsState());

  Future<void> fetchBrands({int? shopId}) async {
    state = state.copyWith(isLoading: true);
    final response =
        await _brandsRepository.getBrandsPaginate(1, shopId: shopId);
    response.when(
      success: (data) {
        state = state.copyWith(brands: data.data ?? [], isLoading: false);
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> fetch brands fail: $fail');
      },
    );
  }
}
