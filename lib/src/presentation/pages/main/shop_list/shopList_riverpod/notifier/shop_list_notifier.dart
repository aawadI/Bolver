import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/handlers/handlers.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../repository/repository.dart';
import '../state/shop_list_state.dart';

class ShopListNotifier extends StateNotifier<ShopListState> {
  final ShopsRepository _shopsRepository;
  final BannersRepository _bannersRepository;
  final CategoriesRepository _categoriesRepository;
  int call = 0;

  ShopListNotifier(this._bannersRepository, this._categoriesRepository,
      this._shopsRepository)
      : super(const ShopListState());

  Future<void> fetchBanners({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isBannersLoading: true);
      final response =
          await _bannersRepository.getBannersPaginate(BannerType.banner);
      response.when(
        success: (data) {
          state = state.copyWith(
            banners: data.data ?? [],
            isBannersLoading: false,
          );
        },
        failure: (failure) {
          state = state.copyWith(isBannersLoading: false);
          debugPrint('==> get banners failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  void setActiveBanner(int index) {
    state = state.copyWith(activeBanner: index);
  }

  Future<void> fetchCategories({VoidCallback? checkYourNetwork}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isCategoriesLoading: true);
      final response = await _categoriesRepository.getAllCategories();
      response.when(
        success: (data) {
          debugPrint(
              "_categoriesRepository : ${data.data!.first.translation!.title}");
          state = state.copyWith(
            categories: data.data ?? [],
            isCategoriesLoading: false,
          );
          debugPrint(
              "_categoriesRepository : ${state.categories.first.translation!.title}");
        },
        failure: (failure) {
          state = state.copyWith(isCategoriesLoading: false);
          debugPrint('==> get categories failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }

  Future<void> fetchSavedShops(BuildContext context) async {
    final List<int> ids = LocalStorage.instance.getSavedShopsList();
    if (ids.isEmpty) {
      state = state.copyWith(savedShops: []);
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isSavedShopsLoading: true);
      final response = await _shopsRepository.getShopsByIds(ids);
      response.when(
        success: (data) async {
          state = state.copyWith(
            savedShops: data.data ?? [],
            isSavedShopsLoading: false,
          );
        },
        failure: (failure) {
          state = state.copyWith(isSavedShopsLoading: false);
          if (failure == const NetworkExceptions.internalServerError()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.somethingWentWrongWithTheServer),
            );
          }
          debugPrint('==> fetch saved shops failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showCheckFlash(
          context,
          AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
        );
      }
    }
  }
}
