import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/new_password_state.dart';
import '../notifier/new_password_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final newPasswordProvider =
    StateNotifierProvider<NewPasswordNotifier, NewPasswordState>(
  (ref) => NewPasswordNotifier(userRepository),
);
