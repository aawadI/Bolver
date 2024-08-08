import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../../models/models.dart';
import '../../../../../../../../../core/constants/constants.dart';

part 'brand_details_state.freezed.dart';

@freezed
class BrandDetailsState with _$BrandDetailsState {
  const factory BrandDetailsState({
    @Default(false) bool isLoading,
    @Default(false) bool isProductsLoading,
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default(false) bool isMoreLoading,
    @Default([]) List<ProductData> products,
    @Default([]) List<ProductData> searchedProducts,
    @Default(0) int productsCount,
    @Default('') String query,
    @Default(ListAlignment.vertically) ListAlignment listAlignment,
    BrandData? brand,
  }) = _BrandDetailsState;

  const BrandDetailsState._();
}