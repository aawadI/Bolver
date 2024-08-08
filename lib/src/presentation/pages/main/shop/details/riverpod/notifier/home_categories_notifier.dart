import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/home_categories_state.dart';
import '../../../../../../../repository/repository.dart';

class HomeCategoriesNotifier extends StateNotifier<HomeCategoriesState> {
  final CategoriesRepository _categoriesRepository;

  HomeCategoriesNotifier(this._categoriesRepository)
      : super(const HomeCategoriesState());

  void setSelectedCategory(int categoryId) {
    final selected =
        state.categories.firstWhere((element) => element.id == categoryId);
    state = state.copyWith(
      selectedCategory: selected,
      subCategories: selected.children ?? [],
    );
  }



  void clearFilters() {
    state = state.copyWith(selectedCategoryId: 0);
  }

  void setSelectedCategoryId(int id) {
    state = state.copyWith(selectedCategoryId: id);
  }

  Future<void> fetchCategories() async {
    state = state.copyWith(isLoading: true);
    final response = await _categoriesRepository.getAllCategories();
    response.when(
      success: (data) {
        state = state.copyWith(categories: data.data ?? [], isLoading: false);
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> fetch categories fail: $fail');
      },
    );
  }
}
