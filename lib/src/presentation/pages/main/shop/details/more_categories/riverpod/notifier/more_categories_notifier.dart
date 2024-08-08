import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/more_categories_state.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../../repository/repository.dart';

class MoreCategoriesNotifier extends StateNotifier<MoreCategoriesState> {
  final CategoriesRepository _categoriesRepository;

  MoreCategoriesNotifier(this._categoriesRepository)
      : super(const MoreCategoriesState());

  Future<void> fetchCategoryDetails({required CategoryData category}) async {
    state = state.copyWith(isLoading: true);
    final response =
        await _categoriesRepository.getCategoryDetails(uuid: category.uuid);
    response.when(
      success: (data) {
        state = state.copyWith(category: data.data, isLoading: false);
      },
      failure: (fail) {
        state = state.copyWith(isLoading: false);
        debugPrint('==> fetch categories details fail: $fail');
      },
    );
  }
}
