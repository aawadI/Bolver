import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/new_address_state.dart';
import '../notifier/new_address_notifier.dart';
import '../../../../../../../core/di/dependency_manager.dart';

final newAddressProvider =
    StateNotifierProvider.autoDispose<NewAddressNotifier, NewAddressState>(
  (ref) => NewAddressNotifier(addressesRepository),
);
