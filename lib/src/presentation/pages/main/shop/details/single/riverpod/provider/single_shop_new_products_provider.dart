import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/single_shop_new_products_state.dart';
import '../notifier/single_shop_new_products_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final singleShopNewProductsProvider = StateNotifierProvider<
    SingleShopNewProductsNotifier, SingleShopNewProductsState>(
  (ref) => SingleShopNewProductsNotifier(productsRepository),
);
