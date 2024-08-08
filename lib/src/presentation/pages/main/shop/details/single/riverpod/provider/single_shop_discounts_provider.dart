import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../core/di/dependency_manager.dart';
import '../notifier/single_shop_discounts_notifier.dart';
import '../state/single_shop_discounts_state.dart';

final singleShopDiscountsProvider = StateNotifierProvider<
    SingleShopDiscountsNotifier, SingleShopDiscountsState>(
  (ref) => SingleShopDiscountsNotifier(productsRepository),
);
