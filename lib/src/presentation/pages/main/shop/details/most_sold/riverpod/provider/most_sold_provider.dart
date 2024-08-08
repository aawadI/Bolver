import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/most_sold_state.dart';
import '../notifier/most_sold_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final mostSoldProvider =
    StateNotifierProvider.autoDispose<MostSoldNotifier, MostSoldState>(
  (ref) => MostSoldNotifier(productsRepository),
);
