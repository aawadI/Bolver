import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'home_most_sold_state.freezed.dart';

@freezed
class HomeMostSoldState with _$HomeMostSoldState {
  const factory HomeMostSoldState({
    @Default(false) bool isLoading,
    @Default([]) List<ProductData> products,
  }) = _HomeMostSoldState;

  const HomeMostSoldState._();
}