import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/viewed_products_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../repository/repository.dart';
import '../../../../../../../core/handlers/handlers.dart';
import '../../../../../../../core/constants/constants.dart';

class ViewedProductsNotifier extends StateNotifier<ViewedProductsState> {
  final ProductsRepository _productsRepository;
  Timer? _timer;

  ViewedProductsNotifier(this._productsRepository)
      : super(const ViewedProductsState());

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
          shops: data.shops ?? [],
          brands: data.brands ?? [],
          searchedProducts: data.products ?? [],
          categories: data.categories ?? [],
        );
      },
      failure: (fail) {
        state = state.copyWith(isSearchLoading: false);
        debugPrint('==> search products failure: $fail');
      },
    );
  }

  Future<void> fetchViewedProducts(BuildContext context,{int? shopId}) async {
    final List<int> ids = LocalStorage.instance.getViewedProductsList();
    if (ids.isEmpty) {
      return;
    }
    state = state.copyWith(isViewedProductsLoading: true, viewedProducts: []);
    final response = await _productsRepository.getProductsByIds(ids);
    response.when(
      success: (data) async {
        final List<ProductData> viewedProducts = data.data ?? [];
        final List<ProductData> filtered = [];
        for (final productId in ids) {
          for (final viewedProduct in viewedProducts) {
            if (productId == viewedProduct.id) {
              filtered.add(viewedProduct);
            }
          }
        }
        state = state.copyWith(
          viewedProducts: filtered,
          isViewedProductsLoading: false,
        );
        checkViewedProductIds();
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
  }

  Future<void> filterProducts() async {
    state = state.copyWith(isViewedProductsLoading: true);
    List<ProductData> filtered = [];
    for (final product in state.viewedProducts) {
      filtered.add(product);
    }
    state = state.copyWith(isViewedProductsLoading: false);
  }

  void setListAlignment(ListAlignment alignment) {
    state = state.copyWith(listAlignment: alignment);
  }

  void checkViewedProductIds() {
    final List<int> productIds = LocalStorage.instance.getViewedProductsList();
    final List<int> newProductIds = [];
    for (final product in state.viewedProducts) {
      for (final id in productIds) {
        if (id == product.id) {
          newProductIds.add(id);
          break;
        }
      }
    }
    LocalStorage.instance.setViewedProductsList(newProductIds);
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
}
