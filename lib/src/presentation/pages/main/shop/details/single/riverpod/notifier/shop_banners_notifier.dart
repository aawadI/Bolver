import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/shop_banners_state.dart';
import '../../../../../../../../repository/repository.dart';
import '../../../../../../../../core/constants/constants.dart';

class ShopBannersNotifier extends StateNotifier<ShopBannersState> {
  final BannersRepository _bannersRepository;

  ShopBannersNotifier(this._bannersRepository)
      : super(const ShopBannersState());

  void setIndex(int index) {
    state = state.copyWith(bannerIndex: index);
  }

  Future<void> fetchBanners() async {
    state = state.copyWith(isLoading: true);
    final response =
        await _bannersRepository.getBannersPaginate(BannerType.banner);
    response.when(
      success: (data) {
        state = state.copyWith(banners: data.data ?? [], isLoading: false);
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> fetch banners fail: $fail');
      },
    );
  }
}
