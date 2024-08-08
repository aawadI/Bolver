import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/di/dependency_manager.dart';
import '../notifier/home_most_sold_notifier.dart';
import '../state/home_most_sold_state.dart';

final homeMostSoldProvider =
    StateNotifierProvider<HomeMostSoldNotifier, HomeMostSoldState>(
  (ref) => HomeMostSoldNotifier(productsRepository),
);
