import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/shop_details_search_filter_state.dart';
import '../../../../../../../core/di/dependency_manager.dart';
import '../notifier/shop_details_search_filter_notifier.dart';

final shopDetailsSearchFilterProvider = StateNotifierProvider<
    ShopDetailsSearchFilterNotifier, ShopDetailsSearchFilterState>(
  (ref) => ShopDetailsSearchFilterNotifier(brandsRepository),
);
