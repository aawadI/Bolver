import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'shop_details_state.freezed.dart';

@freezed
class ShopDetailsState with _$ShopDetailsState {
  const factory ShopDetailsState({
    @Default(false) bool isLoading,
    @Default(false) bool isViewedProductsLoading,
    @Default(false) bool isNewProductsLoading,
    @Default(false) bool isDeliveriesLoading,
    @Default(false) bool hasDelivery,
    @Default(false) bool isSaved,
    @Default(false) bool isLooksLoading,
    @Default([]) List<CategoryData> subCategories,
    @Default([]) List<ProductData> viewedProducts,
    @Default([]) List<ProductData> newProducts,
    @Default([]) List<String> deliveryTimes,
    @Default([]) List<LookLikeData> lookLikes,
    @Default([]) List<BannerData> looks,
    @Default('') String shopTitle,
    ShopData? shopData,
    DateTime? selectedDate,
  }) = _ShopDetailsState;

  const ShopDetailsState._();
}
