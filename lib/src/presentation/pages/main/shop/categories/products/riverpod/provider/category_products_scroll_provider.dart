import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/category_products_scroll_state.dart';
import '../notifier/category_products_scroll_notifier.dart';

final categoryProductsScrollProvider = StateNotifierProvider<
    CategoryProductsScrollNotifier, CategoryProductsScrollState>(
  (ref) => CategoryProductsScrollNotifier(),
);
