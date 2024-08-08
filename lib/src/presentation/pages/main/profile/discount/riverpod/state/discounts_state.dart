import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';
import '../../../../../../../core/constants/constants.dart';

part 'discounts_state.freezed.dart';

@freezed
class DiscountsState with _$DiscountsState {
  const factory DiscountsState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default([]) List<ProductData> products,
    @Default([]) List<ProductData> searchedProducts,
    @Default('') String query,
    @Default(ListAlignment.vertically) ListAlignment listAlignment,
  }) = _DiscountsState;

  const DiscountsState._();
}
