import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/single_shop_search_state.dart';
import '../notifier/single_shop_search_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final singleShopSearchProvider = StateNotifierProvider.autoDispose<
    SingleShopSearchNotifier, SingleShopSearchState>(
  (ref) => SingleShopSearchNotifier(productsRepository),
);
