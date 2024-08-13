import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../repository/repository.dart';
import '../state/category_products_state.dart';

class CategoryProductsNotifier extends StateNotifier<CategoryProductsState> {
  final ProductsRepository _productsRepository;
  final CategoriesRepository _categoriesRepository;
  int _page = 0;
  bool _hasMore = false;
  Timer? _timer;
  CategoryData? _selectedChildCategory;
  CategoryData? _parentCategory;
  List<int> _shopIds = [];
  List<int> _brandIds = [];
  List<int> _extrasIds = [];
  Map<String, dynamic>? _extraValues;
  bool _shouldIncludeRanges = false;

  CategoryProductsNotifier(this._productsRepository, this._categoriesRepository)
      : super(const CategoryProductsState());

  void clearFilters() {
    _shouldIncludeRanges = false;
    final List<ShopData> shops = List.from(state.shops);
    for (int i = 0; i < shops.length; i++) {
      shops[i] = shops[i].copyWith(visibility: false);
    }
    final List<BrandData> brands = List.from(state.brands);
    for (int i = 0; i < brands.length; i++) {
      brands[i] = brands[i].copyWith(isCheckedForFilter: false);
    }
    final List<ExtraGroup> groups = List.from(state.filterExtraGroups);
    for (int i = 0; i < groups.length; i++) {
      List<Extras> extras = groups[i].filterExtras ?? [];
      for (int j = 0; j < extras.length; j++) {
        extras[j] = extras[j].copyWith(isCheckedForFilter: false);
      }
      groups[i] = groups[i].copyWith(filterExtras: extras);
    }
    state = state.copyWith(
      shops: shops,
      brands: brands,
      filterExtraGroups: groups,
      filterRange: RangeValues(
        state.startPrice.toDouble(),
        state.endPrice.toDouble(),
      ),
    );
  }

  void setRange(RangeValues values) {
    state = state.copyWith(filterRange: values);
    _shouldIncludeRanges = true;
  }

  void setFetchedBrands() {
    state = state.copyWith(filterBrands: state.brands);
  }

  void searchBrand(String query) {
    List<BrandData> filtered = [];
    for (final brand in state.brands) {
      if (brand.title?.toLowerCase().contains(query.trim().toLowerCase()) ??
          false) {
        filtered.add(brand);
      }
    }
    state = state.copyWith(filterBrands: filtered);
  }

  void setFetchedShops() {
    state = state.copyWith(filterShops: state.shops);
  }

  void searchStore(String query) {
    List<ShopData> filtered = [];
    for (final shop in state.shops) {
      if (shop.translation?.title
              ?.toLowerCase()
              .contains(query.trim().toLowerCase()) ??
          false) {
        filtered.add(shop);
      }
    }
    state = state.copyWith(filterShops: filtered);
  }

  void _sortExtras() {
    List<ExtraGroup> filteredGroups = [];
    for (final group in state.filterExtraGroups) {
      _extraValues?.forEach(
        (key, value) {
          if (int.tryParse(key) == group.id) {
            final List<Extras> extras =
                (value as List).map((e) => Extras.fromJson(e)).toList();
            filteredGroups.add(group.copyWith(filterExtras: extras));
          }
        },
      );
    }
    state = state.copyWith(filterExtraGroups: filteredGroups);
  }

  Future<void> _fetchExtraGroups() async {
    final response = await _categoriesRepository.getExtraGroups();
    response.when(
      success: (data) {
        state = state.copyWith(filterExtraGroups: data.data ?? []);
        _sortExtras();
      },
      failure: (fail) {
        debugPrint('===> fetching extra groups fail $fail');
      },
    );
  }

  void toggleBrand(int index) {
    List<BrandData> filterBrands = List.from(state.filterBrands);
    List<BrandData> brands = List.from(state.brands);
    filterBrands[index] = filterBrands[index].copyWith(
      isCheckedForFilter: !(filterBrands[index].isCheckedForFilter ?? false),
    );
    int mainIndex = 0;
    for (int i = 0; i < brands.length; i++) {
      if (filterBrands[index].id == brands[i].id) {
        mainIndex = i;
      }
    }
    brands[mainIndex] = brands[mainIndex].copyWith(
        isCheckedForFilter: filterBrands[index].isCheckedForFilter ?? false);
    state = state.copyWith(filterBrands: filterBrands, brands: brands);
  }

  void toggleExtrasItem(Extras extras, int groupIndex) {
    List<Extras> groupExtras =
        state.filterExtraGroups[groupIndex].filterExtras ?? [];
    if (groupExtras.isEmpty) {
      return;
    }
    int extrasIndex = 0;
    for (int i = 0; i < groupExtras.length; i++) {
      if (groupExtras[i].id == extras.id) {
        extrasIndex = i;
      }
    }
    groupExtras[extrasIndex] = groupExtras[extrasIndex].copyWith(
      isCheckedForFilter:
          !(groupExtras[extrasIndex].isCheckedForFilter ?? false),
    );
    List<ExtraGroup> groups = List.from(state.filterExtraGroups);
    groups[groupIndex] = groups[groupIndex].copyWith(filterExtras: groupExtras);
    state = state.copyWith(filterExtraGroups: groups);
  }

  void setSelectedShop(int index) {
    List<ShopData> filterShops = List.from(state.filterShops);
    List<ShopData> shops = List.from(state.shops);
    filterShops[index] = filterShops[index].copyWith(
      visibility: !(filterShops[index].visibility ?? false),
    );
    int mainIndex = 0;
    for (int i = 0; i < shops.length; i++) {
      if (filterShops[index].id == shops[i].id) {
        mainIndex = i;
      }
    }
    shops[mainIndex] = shops[mainIndex]
        .copyWith(visibility: filterShops[index].visibility ?? false);
    state = state.copyWith(filterShops: filterShops, shops: shops);
  }

  Future<void> fetchCategoryFilters(CategoryData? category) async {
    state = state.copyWith(isFilterLoading: true);
    final response = await _categoriesRepository.getCategoryFilters(
      categoryId: (category?.children?.isEmpty ?? false)
          ? category?.parentId
          : category?.id,
    );
    if (category?.id != _parentCategory?.id) {
      return;
    }
    response.when(
      success: (data) {
        state = state.copyWith(
          isFilterLoading: false,
          filterShops: data.shops ?? [],
          shops: data.shops ?? [],
          filterBrands: data.brands ?? [],
          brands: data.brands ?? [],
          filterCategories: data.categories ?? [],
          startPrice: data.minPrice ?? 0,
          endPrice: data.maxPrice ?? 0,
          filterRange: RangeValues(
            (data.minPrice ?? 0).toDouble(),
            (data.maxPrice ?? 0).toDouble(),
          ),
        );
        _extraValues = data.extraValues;
        _fetchExtraGroups();
      },
      failure: (fail) {
        state = state.copyWith(isFilterLoading: false);
        debugPrint('===> fetch category filters fail $fail');
        _fetchExtraGroups();
      },
    );
  }

  Future<void> filterProducts({
    required List<BrandData> selectedBrands,
    required List<Extras> selectedExtras,
    required bool sortPrice,
  }) async {
    _page = 0;
    _hasMore = false;
    state = state.copyWith(isLoading: true, productsCount: 0, products: []);
    _shopIds = [];
    for (final shop in AppHelpers.getCheckedShops(state.shops)) {
      _shopIds.add(shop.id ?? 0);
    }
    _shopIds = _shopIds.toSet().toList();
    _brandIds = [];
    for (final brand in selectedBrands) {
      _brandIds.add(brand.id ?? 0);
    }
    _brandIds = _brandIds.toSet().toList();
    _extrasIds = [];
    for (final extras in selectedExtras) {
      _extrasIds.add(extras.id ?? 0);
    }
    _extrasIds = _extrasIds.toSet().toList();
    final response = await _productsRepository.getProductsPaginate(
      sortPrice: sortPrice,
      page: ++_page,
      categoryId: _parentCategory?.children?.isEmpty ?? false
          ? _parentCategory?.id
          : null,
      parentCategoryId: _parentCategory?.children?.isEmpty ?? false
          ? _parentCategory?.parentId
          : _parentCategory?.id,
      childCategory: _selectedChildCategory,
      shopIds: _shopIds.isEmpty ? null : _shopIds,
      brandIds: _brandIds.isEmpty ? null : _brandIds,
      extrasIds: _extrasIds.isEmpty ? null : _extrasIds,
      minPrice: _shouldIncludeRanges ? state.filterRange.start : null,
      maxPrice: _shouldIncludeRanges ? state.filterRange.end : null,
    );
    response.when(
      success: (data) {
        final List<ProductData> products = data.data ?? [];
        state = state.copyWith(
          products: products,
          isLoading: false,
          productsCount: data.meta?.total ?? 0,
        );
        _hasMore = products.length >= (data.meta?.total ?? 0);
      },
      failure: (fail) {
        debugPrint('===> filter products fail $fail');
        state = state.copyWith(isLoading: false);
        _page--;
      },
    );
  }

  // Future<void> setChildCategory(CategoryData? category) async {
  //   _selectedChildCategory = category;
  //   _hasMore = false;
  //   _page = 0;
  //   state = state.copyWith(
  //     isLoading: true,
  //     productsCount: 0,
  //     products: [],
  //     categoryTitle: category == null
  //         ? (_parentCategory?.translation?.title ?? '')
  //         : (category.translation?.title ?? ''),
  //   );
  //   final response = await _productsRepository.getProductsPaginate(
  //     page: ++_page,
  //     categoryId: _parentCategory?.children?.isEmpty ?? false
  //         ? _parentCategory?.id
  //         : null,
  //     parentCategoryId: _parentCategory?.children?.isEmpty ?? false
  //         ? _parentCategory?.parentId
  //         : _parentCategory?.id,
  //     childCategory: _selectedChildCategory,
  //     shopIds: _shopIds.isEmpty ? null : _shopIds,
  //     brandIds: _brandIds.isEmpty ? null : _brandIds,
  //     extrasIds: _extrasIds.isEmpty ? null : _extrasIds,
  //     minPrice: _shouldIncludeRanges ? state.filterRange.start : null,
  //     maxPrice: _shouldIncludeRanges ? state.filterRange.end : null,
  //   );
  //   response.when(
  //     success: (data) {
  //       final List<ProductData> products = data.data ?? [];
  //       state = state.copyWith(
  //         products: products,
  //         isLoading: false,
  //         productsCount: data.meta?.total ?? 0,
  //       );
  //       _hasMore = products.length >= (data.meta?.total ?? 0);
  //     },
  //     failure: (fail) {
  //       state = state.copyWith(isLoading: false);
  //       debugPrint('===> set child category products $fail');
  //     },
  //   );
  // }
  Future<void> setChildCategory(CategoryData? category) async {
    _selectedChildCategory = category;
    _hasMore = false;
    _page = 0;
    state = state.copyWith(
      isLoading: true,
      productsCount: 0,
      products: [],
      categoryTitle: category == null
          ? (_parentCategory?.translation?.title ?? '')
          : (category.translation?.title ?? ''),
    );
    final response = await _productsRepository.getProductsPaginate(
      page: ++_page,
      categoryId: _parentCategory?.children?.isEmpty ?? false
          ? _parentCategory?.id
          : null,
      parentCategoryId: _parentCategory?.children?.isEmpty ?? false
          ? _parentCategory?.parentId
          : _parentCategory?.id,
      childCategory: _selectedChildCategory,
      shopIds: _shopIds.isEmpty ? null : _shopIds,
      brandIds: _brandIds.isEmpty ? null : _brandIds,
      extrasIds: _extrasIds.isEmpty ? null : _extrasIds,
      minPrice: _shouldIncludeRanges ? state.filterRange.start : null,
      maxPrice: _shouldIncludeRanges ? state.filterRange.end : null,
    );
    response.when(
      success: (data) {
        final List<ProductData> products = data.data ?? [];
        List<ProductData> filteredProducts;
        if (category != null) {
          filteredProducts = products
              .where((product) => product.categoryId == category.id)
              .toList();
        } else {
          filteredProducts = products;
        }
        state = state.copyWith(
          products: filteredProducts,
          isLoading: false,
          productsCount: data.meta?.total ?? 0,
        );
        _hasMore = filteredProducts.length >= (data.meta?.total ?? 0);
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('===> set child category products $fail');
      },
    );
  }

  Future<void> fetchMoreProducts(RefreshController refreshController) async {
    if (_hasMore || state.isMoreLoading) {
      refreshController.loadNoData();
      return;
    }
    // state = state.copyWith(isMoreLoading: true);
    final response = await _productsRepository.getProductsPaginate(
      page: ++_page,
      parentCategoryId: _parentCategory?.id,
      childCategory: _selectedChildCategory,
      shopIds: _shopIds.isEmpty ? null : _shopIds,
      brandIds: _brandIds.isEmpty ? null : _brandIds,
      extrasIds: _extrasIds.isEmpty ? null : _extrasIds,
      minPrice: _shouldIncludeRanges ? state.filterRange.start : null,
      maxPrice: _shouldIncludeRanges ? state.filterRange.end : null,
    );
    response.when(
      success: (data) {
        List<ProductData> products = List.from(state.products);
        final List<ProductData> newProducts = data.data ?? [];
        products.addAll(newProducts);
        state = state.copyWith(products: products);
        _hasMore = products.length >= (data.meta?.total ?? 0);
        refreshController.loadComplete();
      },
      failure: (fail) {
        // state = state.copyWith(isMoreLoading: false);
        _page--;
        refreshController.loadFailed();
        debugPrint('===> fetching more products fail $fail');
      },
    );
  }

  Future<void> initialFetchProducts(CategoryData? category) async {
    _page = 0;
    _hasMore = false;
    _selectedChildCategory = null;
    _parentCategory = category;
    _shopIds = [];
    _extraValues = null;
    _shouldIncludeRanges = false;
    state = state.copyWith(
      isLoading: true,
      productsCount: 0,
      products: [],
      categoryTitle: category?.translation?.title ??
          AppHelpers.getTranslation(TrKeys.noTitle),
      isSearching: false,
      isSearchLoading: false,
      searchedProducts: [],
      filterShops: [],
      filterBrands: [],
      filterExtraGroups: [],
      filterCategories: [],
    );
    final response = await _productsRepository.getProductsPaginate(
        page: ++_page,
        parentCategoryId: (category?.children?.isEmpty ?? false)
            ? category?.parentId
            : category?.id,
        categoryId:
            (category?.children?.isEmpty ?? false) ? category?.id : null);
    response.when(
      success: (data) {
        final List<ProductData> products = data.data ?? [];
        state = state.copyWith(
          products: products,
          isLoading: false,
          productsCount: data.meta?.total ?? 0,
        );
        _hasMore = products.length >= state.productsCount;
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('===> initial fetch products $fail');
      },
    );
  }

  changeTabView() {
    state = state.copyWith(isChangeTab: !state.isChangeTab);
  }

  void updateProducts() {
    _page = 0;
    _hasMore = true;
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
          searchedShops: data.shops ?? [],
          searchedBrands: data.brands ?? [],
          searchedCategories: data.categories ?? [],
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
