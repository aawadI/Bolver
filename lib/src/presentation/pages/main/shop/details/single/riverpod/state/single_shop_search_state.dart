import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'single_shop_search_state.freezed.dart';

@freezed
class SingleShopSearchState with _$SingleShopSearchState {
  const factory SingleShopSearchState({
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default([]) List<ProductData> searchedProducts,
    @Default([]) List<BrandData> searchedBrands,
    @Default([]) List<CategoryData> searchedCategories,
    @Default('') String query,
  }) = _SingleShopSearchState;

  const SingleShopSearchState._();
}
