import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';
import '../../../../../../../../core/constants/constants.dart';

part 'category_products_state.freezed.dart';

@freezed
class CategoryProductsState with _$CategoryProductsState {
  const factory CategoryProductsState({
    @Default(false) bool isLoading,
    @Default(false) bool isSearching,
    @Default(false) bool isChangeTab,
    @Default(false) bool isSearchLoading,
    @Default(false) bool isMoreLoading,
    @Default(false) bool isFilterLoading,
    @Default([]) List<ProductData> products,
    @Default([]) List<ProductData> searchedProducts,
    @Default([]) List<ShopData> shops,
    @Default([]) List<ShopData> filterShops,
    @Default([]) List<BrandData> brands,
    @Default([]) List<BrandData> filterBrands,
    @Default([]) List<ExtraGroup> filterExtraGroups,
    @Default([]) List<CategoryData> filterCategories,
    @Default([]) List<ShopData> searchedShops,
    @Default([]) List<BrandData> searchedBrands,
    @Default([]) List<CategoryData> searchedCategories,
    @Default(0) int productsCount,
    @Default(0) num startPrice,
    @Default(0) num endPrice,
    @Default('') String query,
    @Default('') String categoryTitle,
    @Default(ListAlignment.vertically) ListAlignment listAlignment,
    @Default(RangeValues(0, 10)) RangeValues filterRange,
  }) = _CategoryProductsState;

  const CategoryProductsState._();
}
