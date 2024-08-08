import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';
import '../../../../../../../core/constants/constants.dart';

part 'viewed_products_state.freezed.dart';

@freezed
class ViewedProductsState with _$ViewedProductsState {
  const factory ViewedProductsState({
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default(false) bool isViewedProductsLoading,
    @Default('') String query,
    @Default([]) List<ProductData> searchedProducts,
    @Default([]) List<ProductData> viewedProducts,
    @Default([]) List<CategoryData> categories,
    @Default([]) List<BrandData> brands,
    @Default([]) List<ShopData> shops,
    @Default(ListAlignment.vertically) ListAlignment listAlignment,
  }) = _ViewedProductsState;

  const ViewedProductsState._();
}