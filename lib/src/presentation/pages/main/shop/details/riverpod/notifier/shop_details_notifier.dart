import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/shop_details_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';
import '../../../../../../../core/handlers/handlers.dart';
import '../../../../../../../core/constants/constants.dart';

class ShopDetailsNotifier extends StateNotifier<ShopDetailsState> {
  final ProductsRepository _productsRepository;
  final BannersRepository _bannersRepository;
  final ShopsRepository _shopsRepository;

  ShopDetailsNotifier(
    this._productsRepository,
    this._bannersRepository,
    this._shopsRepository,
  ) : super(const ShopDetailsState());

  List<String> getDeliveryHours(String openTime, String closeTime) {
    List<String> hours = [];
    final int openHour = int.parse(openTime.substring(3, 5)) == 0
        ? int.parse(openTime.substring(0, 2))
        : int.parse(openTime.substring(0, 2)) + 1;
    final int closeHour = int.parse(closeTime.substring(0, 2));
    for (int i = openHour; i < closeHour; i++) {
      hours.add('$i:00 - ${i + 1}:00');
    }
    return hours;
  }

  Future<void> likeOrUnlikeProduct(int? productId) async {
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

  Future<void> fetchShopDetails(
    BuildContext context, {
    VoidCallback? fetched,
    ShopData? shop,
  }) async {
    state = state.copyWith(shopTitle: shop?.translation?.title ?? '');
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLoading: true, shopData: null);
      final response = await _shopsRepository.getSingleShop(uuid: shop?.uuid);
      response.when(
        success: (data) {
          state = state.copyWith(
            isLoading: false,
            shopData: data.data,
            deliveryTimes: getDeliveryHours(
              data.data?.openTime ?? '',
              data.data?.closeTime ?? '',
            ),
            shopTitle: data.data?.translation?.title ?? state.shopTitle,
          );
          checkIsSaved();
          fetchNewProducts(context);
          fetchViewedProducts(context);
          fetched?.call();
          fetchLooks(context, shopId: data.data?.id);
        },
        failure: (failure) {
          state = state.copyWith(isLoading: false);
          if (failure == const NetworkExceptions.noInternetConnection()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
            );
          } else if (failure == const NetworkExceptions.notFound('Not found')) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.notFound),
            );
          }
          checkIsSaved();
          fetchNewProducts(context);
          fetchViewedProducts(context);
          fetched?.call();
          fetchLooks(context);
          debugPrint('==> get single shop failure: $failure');
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

  Future<void> fetchShopDeliveries(BuildContext context, int? shopId) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isDeliveriesLoading: true);
      final response = await _shopsRepository.getShopsDeliveries([shopId ?? 0]);
      response.when(
        success: (data) async {
          final List<ShopDelivery> deliveries = data.data?[0].deliveries ?? [];
          if (deliveries.isNotEmpty) {
            bool hasDelivery = false;
            for (final delivery in deliveries) {
              if (delivery.type != 'pickup') {
                hasDelivery = true;
                break;
              }
            }
            state = state.copyWith(
              hasDelivery: hasDelivery,
              isDeliveriesLoading: false,
            );
          }
          state = state.copyWith(
            hasDelivery: false,
            isDeliveriesLoading: false,
          );
        },
        failure: (activeFailure) {
          state = state.copyWith(isDeliveriesLoading: false);
          debugPrint('==> get deliveries failure: $activeFailure');
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

  Future<void> fetchViewedProducts(BuildContext context) async {
    final List<int> ids = LocalStorage.instance.getViewedProductsList();
    if (ids.isEmpty) {
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isViewedProductsLoading: true, viewedProducts: []);
      final response = await _productsRepository.getProductsByIds(ids);
      response.when(
        success: (data) async {
          final List<ProductData> viewedProducts = data.data ?? [];
          final List<ProductData> filtered = [];
          for (final productId in ids) {
            for (final viewedProduct in viewedProducts) {
              if (productId == viewedProduct.id &&
                  viewedProduct.shopId == state.shopData?.id) {
                filtered.add(viewedProduct);
              }
            }
          }
          state = state.copyWith(
            viewedProducts: filtered,
            isViewedProductsLoading: false,
          );
        },
        failure: (failure) {
          state = state.copyWith(isViewedProductsLoading: false);
          if (failure == const NetworkExceptions.internalServerError()) {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.somethingWentWrongWithTheServer),
            );
          }
          debugPrint('==> get viewed products failure: $failure');
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

  void checkIsSaved() {
    final List<int> ids = LocalStorage.instance.getSavedShopsList();
    bool isSaved = false;
    for (final id in ids) {
      if (id == state.shopData?.id) {
        isSaved = true;
      }
    }
    state = state.copyWith(isSaved: isSaved);
  }

  Future<void> fetchNewProducts(BuildContext context) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(
        isNewProductsLoading: true,
        newProducts: [],
      );
      final response =
          await _productsRepository.getNewProducts(shopId: state.shopData?.id);
      response.when(
        success: (data) async {
          state = state.copyWith(
            newProducts: data.data ?? [],
            isNewProductsLoading: false,
          );
        },
        failure: (failure) {
          state = state.copyWith(isNewProductsLoading: false);
          debugPrint('==> fetch new products failure: $failure');
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

  void setDeliveryDate(DateTime date) {
    state = state.copyWith(selectedDate: date);
  }

  Future<void> fetchLooks(BuildContext context, {int? shopId}) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      state = state.copyWith(isLooksLoading: true);
      final response = await _bannersRepository
          .getBannersPaginate(BannerType.look, shopId: shopId);
      response.when(
        success: (data) {
          final List<BannerData> looks = data.data ?? [];
          final List<LookLikeData> lookLikes = [];
          for (int i = 0; i < looks.length; i++) {
            lookLikes.add(LookLikeData(index: i, isLiking: false));
          }
          state = state.copyWith(
            looks: looks,
            isLooksLoading: false,
            lookLikes: lookLikes,
          );
        },
        failure: (failure) {
          state = state.copyWith(isLooksLoading: false);
          debugPrint('==> get looks failure: $failure');
        },
      );
    } else {
      if (mounted) {
        AppHelpers.showNoConnectionSnackBar(context);
      }
    }
  }

  Future<void> likeLook(
    int lookIndex, {
    VoidCallback? checkYourNetwork,
    VoidCallback? youNeedToLoginFirst,
  }) async {
    if (LocalStorage.instance.getToken().isEmpty) {
      youNeedToLoginFirst?.call();
      return;
    }
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      List<LookLikeData> lookLikes = List.from(state.lookLikes);
      lookLikes[lookIndex] = LookLikeData(index: lookIndex, isLiking: true);
      state = state.copyWith(lookLikes: lookLikes);
      final response =
          await _bannersRepository.likeBanner(state.looks[lookIndex].id);
      response.when(
        success: (data) {
          List<LookLikeData> lookLikes = List.from(state.lookLikes);
          lookLikes[lookIndex] =
              LookLikeData(index: lookIndex, isLiking: false);
          state = state.copyWith(lookLikes: lookLikes);
        },
        failure: (failure) {
          List<LookLikeData> lookLikes = List.from(state.lookLikes);
          lookLikes[lookIndex] =
              LookLikeData(index: lookIndex, isLiking: false);
          state = state.copyWith(lookLikes: lookLikes);
          if (failure == const NetworkExceptions.unauthorisedRequest()) {
            youNeedToLoginFirst?.call();
          }
          debugPrint('==> like look failure: $failure');
        },
      );
    } else {
      checkYourNetwork?.call();
    }
  }
}
