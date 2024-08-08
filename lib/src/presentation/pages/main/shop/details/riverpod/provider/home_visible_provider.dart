import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_customer/src/presentation/pages/main/shop/details/riverpod/notifier/home_visible_notifier.dart';
import 'package:g_customer/src/presentation/pages/main/shop/details/riverpod/state/home_visible_state.dart';

final homeVisibleProvider =
    StateNotifierProvider<HomeVisibleNotifier, HomeVisibleState>(
  (ref) => HomeVisibleNotifier(),
);
