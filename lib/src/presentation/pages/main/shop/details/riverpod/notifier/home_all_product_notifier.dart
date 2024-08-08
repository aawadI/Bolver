import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_customer/src/models/data/all_product_data.dart';

import '../../../../../../../core/utils/utils.dart';
import '../state/home_all_products_state.dart';
import '../../../../../../../repository/repository.dart';

class HomeAllProductNotifier extends StateNotifier<HomeAllProductsState> {
  final ProductsRepository _productsRepository;
  int _page = 1;
  bool _hasMore = false;

  HomeAllProductNotifier(this._productsRepository)
      : super(const HomeAllProductsState());

  Future<void> fetchAllProducts() async {
    state = state.copyWith(isLoading: true, products: []);
    final response = await _productsRepository.getAllProducts();
    response.when(
      success: (data) {
        state = state.copyWith(products: data.data ?? [], isLoading: false, totalProductsCount: (data.meta?.total ?? 0));
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> fetch discount products fail: $fail');
      },
    );
  }


  Future<void> fetchMoreProducts() async {
    if (_hasMore || state.isMoreLoading) {
      return;
    }
    state = state.copyWith(isMoreLoading: true);
    final response =
    await _productsRepository.getAllProducts(page: ++_page);
    response.when(
      success: (data) {
        List<AllProductData> products = List.from(state.products);
        final List<AllProductData> newProducts = data.data ?? [];
        products.addAll(newProducts);
        state = state.copyWith(products: products, isMoreLoading: false , totalProductsCount: (data.meta?.total ?? 0));
        _hasMore = products.length >= (data.meta?.total ?? 0);
      },
      failure: (fail) {
        state = state.copyWith(isMoreLoading: false);
        debugPrint('===> fetch more products fail $fail');
        _page--;
      },
    );
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
