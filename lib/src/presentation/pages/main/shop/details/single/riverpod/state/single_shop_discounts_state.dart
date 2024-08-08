import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'single_shop_discounts_state.freezed.dart';

@freezed
class SingleShopDiscountsState with _$SingleShopDiscountsState {
  const factory SingleShopDiscountsState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> products,
  }) = _SingleShopDiscountsState;

  const SingleShopDiscountsState._();
}
