import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';
import '../../../../../../../../core/constants/constants.dart';

part 'most_sold_state.freezed.dart';

@freezed
class MostSoldState with _$MostSoldState {
  const factory MostSoldState({
    @Default(false) bool isLoading,
    @Default(false) bool isMoreLoading,
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default([]) List<ProductData> products,
    @Default([]) List<ProductData> searchedProducts,
    @Default('') String query,
    @Default(ListAlignment.vertically) ListAlignment listAlignment,
  }) = _MostSoldState;

  const MostSoldState._();
}
