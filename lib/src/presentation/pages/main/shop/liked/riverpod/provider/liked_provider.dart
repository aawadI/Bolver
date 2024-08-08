import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/liked_state.dart';
import '../notifier/liked_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final likedProvider = StateNotifierProvider<LikedNotifier, LikedState>(
  (ref) => LikedNotifier(productsRepository),
);
