import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'home_discounts_state.freezed.dart';

@freezed
class HomeDiscountsState with _$HomeDiscountsState {
  const factory HomeDiscountsState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> products,
  }) = _HomeDiscountsState;

  const HomeDiscountsState._();
}