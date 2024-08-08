import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/home_banners_state.dart';
import '../notifier/home_banners_notifier.dart';
import '../../../../../../core/di/dependency_manager.dart';

final homeBannersProvider =
    StateNotifierProvider<HomeBannersNotifier, HomeBannersState>(
  (ref) => HomeBannersNotifier(bannersRepository),
);
