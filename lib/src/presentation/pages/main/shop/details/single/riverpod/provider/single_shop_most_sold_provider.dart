import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/single_shop_most_sold_state.dart';
import '../notifier/single_shop_most_sold_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final singleShopMostSoldProvider =
    StateNotifierProvider<SingleShopMostSoldNotifier, SingleShopMostSoldState>(
  (ref) => SingleShopMostSoldNotifier(productsRepository),
);
