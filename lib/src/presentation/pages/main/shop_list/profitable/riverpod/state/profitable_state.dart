import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';
import '../../../../../../../core/constants/constants.dart';

part 'profitable_state.freezed.dart';

@freezed
class ProfitableState with _$ProfitableState {
  const factory ProfitableState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default([]) List<ProductData> products,
    @Default([]) List<ProductData> searchedProducts,
    @Default('') String query,
    @Default(ListAlignment.vertically) ListAlignment listAlignment,
  }) = _ProfitableState;

  const ProfitableState._();
}
