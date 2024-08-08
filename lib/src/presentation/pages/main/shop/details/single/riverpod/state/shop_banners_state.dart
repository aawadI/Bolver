import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'shop_banners_state.freezed.dart';

@freezed
class ShopBannersState with _$ShopBannersState {
  const factory ShopBannersState({
    @Default(false) bool isLoading,
    @Default([]) List<BannerData> banners,
    @Default(0) int bannerIndex,
  }) = _ShopBannersState;

  const ShopBannersState._();
}