import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'single_shop_viewed_state.freezed.dart';

@freezed
class SingleShopViewedState with _$SingleShopViewedState {
  const factory SingleShopViewedState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> products,
  }) = _SingleShopViewedState;

  const SingleShopViewedState._();
}
