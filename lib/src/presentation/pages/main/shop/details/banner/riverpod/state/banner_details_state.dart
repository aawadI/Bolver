import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';
import '../../../../../../../../core/constants/constants.dart';

part 'banner_details_state.freezed.dart';

@freezed
class BannerDetailsState with _$BannerDetailsState {
  const factory BannerDetailsState({
    @Default(false) bool isLoading,
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default([]) List<ProductData> products,
    @Default([]) List<ProductData> searchedProducts,
    @Default([]) List<CategoryData> searchedCategories,
    @Default([]) List<BrandData> searchedBrands,
    @Default([]) List<ShopData> searchedShops,
    @Default(0) int productsCount,
    @Default('') String query,
    @Default(ListAlignment.vertically) ListAlignment listAlignment,
  }) = _BannerDetailsState;

  const BannerDetailsState._();
}