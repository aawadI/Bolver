import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_customer/src/presentation/pages/main/shop/details/riverpod/notifier/home_all_product_notifier.dart';
import 'package:g_customer/src/presentation/pages/main/shop/details/riverpod/state/home_all_products_state.dart';

import '../../../../../../../core/di/dependency_manager.dart';

final homeAllProductsProvider =
    StateNotifierProvider<HomeAllProductNotifier, HomeAllProductsState>(
  (ref) => HomeAllProductNotifier(productsRepository),
);
