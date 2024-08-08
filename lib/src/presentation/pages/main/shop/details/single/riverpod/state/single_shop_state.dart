import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'single_shop_state.freezed.dart';

@freezed
class SingleShopState with _$SingleShopState {
  const factory SingleShopState({
    @Default(false) bool isLoading,
    @Default(false) bool isSaved,
    @Default([]) List<String> deliveryTimes,
    ShopData? shop,
    DateTime? selectedDate,
  }) = _SingleShopState;

  const SingleShopState._();
}
