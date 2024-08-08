import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'shop_details_search_filter_state.freezed.dart';

@freezed
class ShopDetailsSearchFilterState with _$ShopDetailsSearchFilterState {
  const factory ShopDetailsSearchFilterState({
    @Default(false) bool isLoading,
    @Default([]) List<BrandData> brands,
    @Default(10) int brandCount,
    @Default(0) int selectedBrandId,
  }) = _ShopDetailsSearchFilterState;

  const ShopDetailsSearchFilterState._();
}