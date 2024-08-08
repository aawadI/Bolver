import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/home_banners_state.dart';
import '../../../../../../repository/repository.dart';
import '../../../../../../core/constants/constants.dart';

class HomeBannersNotifier extends StateNotifier<HomeBannersState> {
  final BannersRepository _bannersRepository;

  HomeBannersNotifier(this._bannersRepository)
      : super(const HomeBannersState());

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

  void setActiveBanner(int index) {
    state = state.copyWith(bannerIndex: index);
  }
}
