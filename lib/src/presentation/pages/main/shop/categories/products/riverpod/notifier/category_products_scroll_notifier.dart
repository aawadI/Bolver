import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/category_products_scroll_state.dart';

class CategoryProductsScrollNotifier
    extends StateNotifier<CategoryProductsScrollState> {
  CategoryProductsScrollNotifier() : super(const CategoryProductsScrollState());

  void setScrollVisible(bool visible) {
    state = state.copyWith(isVisible: visible);
  }
}
