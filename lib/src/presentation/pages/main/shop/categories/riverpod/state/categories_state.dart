import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState({
    @Default(false) bool isLoading,
    @Default(false) bool isSearching,
    @Default(false) bool isSearchLoading,
    @Default([]) List<ProductData> searchedProducts,
    @Default([]) List<CategoryData> searchedCategories,
    @Default([]) List<CategoryData> categories,
    @Default('') String query,
    @Default(null) int? categoryId,
  }) = _CategoriesState;

  const CategoriesState._();
}
