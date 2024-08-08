import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/brand_details_state.dart';
import '../../../../../../../../../models/models.dart';
import '../../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../../repository/repository.dart';
import '../../../../../../../../../core/constants/constants.dart';

class BrandDetailsNotifier extends StateNotifier<BrandDetailsState> {
  final BrandsRepository _brandsRepository;
  final ProductsRepository _productsRepository;
  int _page = 0;
  bool _hasMore = true;
  Timer? _timer;

  BrandDetailsNotifier(this._brandsRepository, this._productsRepository)
      : super(const BrandDetailsState());

  Future<void> fetchMoreProducts(BrandData brand) async {
    if (!_hasMore || state.isMoreLoading) {
      return;
    }
    state = state.copyWith(isMoreLoading: true);
    final response = await _productsRepository.getProductsPaginate(
      page: ++_page,
      brandIds: [brand.id ?? 0],
    );
    response.when(
      success: (data) {
        List<ProductData> products = List.from(state.products);
        final List<ProductData> newProducts = data.data ?? [];
        products.addAll(newProducts);
        state = state.copyWith(isMoreLoading: false, products: products);
        _hasMore = newProducts.length >= 10;
      },
      failure: (fail) {
        state = state.copyWith(isMoreLoading: false);
        _page--;
        debugPrint('===> fetching more products fail $fail');
      },
    );
  }

  Future<void> initialFetchProducts(BrandData brand) async {
    _hasMore = true;
    _page = 0;
    state = state.copyWith(isProductsLoading: true);
    final response = await _productsRepository.getProductsPaginate(
      brandIds: [brand.id ?? 0],
      page: ++_page,
    );
    response.when(
      success: (data) {
        final List<ProductData> products = data.data ?? [];
        state = state.copyWith(
          products: products,
          isProductsLoading: false,
          productsCount: data.meta?.total ?? 0,
        );
        _hasMore = products.length >= 10;
      },
      failure: (fail) {
        state = state.copyWith(isProductsLoading: false);
        debugPrint('==> get products fail: $fail');
        _page--;
      },
    );
  }

  Future<void> fetchBrandDetails(BrandData brand) async {
    state = state.copyWith(isLoading: true);
    final response = await _brandsRepository.getSingleBrand(brand.id);
    response.when(
      success: (data) {
        state = state.copyWith(brand: data.data, isLoading: false);
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> get single brand fail: $fail');
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
          searchedProducts: data.products ?? [],
        );
      },
      failure: (fail) {
        state = state.copyWith(isSearchLoading: false);
        debugPrint('==> search products fail: $fail');
      },
    );
  }

  void setListAlignment(ListAlignment alignment) {
    state = state.copyWith(listAlignment: alignment);
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
