import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/single_shop_state.dart';
import '../notifier/single_shop_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final singleShopProvider =
    StateNotifierProvider<SingleShopNotifier, SingleShopState>(
  (ref) => SingleShopNotifier(shopsRepository),
);
