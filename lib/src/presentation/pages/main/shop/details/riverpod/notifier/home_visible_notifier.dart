import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_customer/src/presentation/pages/main/shop/details/riverpod/state/home_visible_state.dart';

class HomeVisibleNotifier extends StateNotifier<HomeVisibleState> {
  HomeVisibleNotifier()
      : super(const HomeVisibleState());
  void setScrollVisible(bool visible) {
    state = state.copyWith(isVisible: visible);
  }
}
