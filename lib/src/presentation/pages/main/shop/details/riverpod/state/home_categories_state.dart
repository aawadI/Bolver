import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'home_categories_state.freezed.dart';

@freezed
class HomeCategoriesState with _$HomeCategoriesState {
  const factory HomeCategoriesState({
    @Default(false) bool isLoading,
    @Default([]) List<CategoryData> categories,
    @Default([]) List<CategoryData> subCategories,
    @Default(0) int selectedCategoryId,
    CategoryData? selectedCategory,
  }) = _HomeCategoriesState;

  const HomeCategoriesState._();
}