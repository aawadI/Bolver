import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/di/dependency_manager.dart';
import '../notifier/home_discounts_notifier.dart';
import '../state/home_discounts_state.dart';

final homeDiscountsProvider =
    StateNotifierProvider<HomeDiscountsNotifier, HomeDiscountsState>(
  (ref) => HomeDiscountsNotifier(productsRepository),
);
