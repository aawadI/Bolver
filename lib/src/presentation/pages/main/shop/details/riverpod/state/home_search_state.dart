import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'home_search_state.freezed.dart';

@freezed
class HomeSearchState with _$HomeSearchState {
  const factory HomeSearchState({
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default([]) List<ProductData> searchedProducts,
    @Default([]) List<ShopData> searchedShops,
    @Default([]) List<BrandData> searchedBrands,
    @Default([]) List<CategoryData> searchedCategories,
    @Default('') String query,
  }) = _HomeSearchState;

  const HomeSearchState._();
}