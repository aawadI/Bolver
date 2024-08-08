import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/single_shop_viewed_state.dart';
import '../notifier/single_shop_viewed_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final singleShopViewedProvider =
    StateNotifierProvider<SingleShopViewedNotifier, SingleShopViewedState>(
  (ref) => SingleShopViewedNotifier(productsRepository),
);
