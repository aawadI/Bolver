import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'single_shop_most_sold_state.freezed.dart';

@freezed
class SingleShopMostSoldState with _$SingleShopMostSoldState {
  const factory SingleShopMostSoldState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> products,
  }) = _SingleShopMostSoldState;

  const SingleShopMostSoldState._();
}
