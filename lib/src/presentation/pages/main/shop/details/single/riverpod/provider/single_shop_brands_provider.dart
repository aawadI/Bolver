import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/single_shop_brands_state.dart';
import '../notifier/single_shop_brands_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final singleShopBrandsProvider =
    StateNotifierProvider<SingleShopBrandsNotifier, SingleShopBrandsState>(
  (ref) => SingleShopBrandsNotifier(brandsRepository),
);
