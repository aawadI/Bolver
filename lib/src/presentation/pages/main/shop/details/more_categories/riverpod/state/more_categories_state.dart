import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';

part 'more_categories_state.freezed.dart';

@freezed
class MoreCategoriesState with _$MoreCategoriesState {
  const factory MoreCategoriesState({
    @Default(false) bool isLoading,
    CategoryData? category,
  }) = _MoreCategoriesState;

  const MoreCategoriesState._();
}
