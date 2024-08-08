import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/address_modal_state.dart';
import '../notifier/address_modal_notifier.dart';

final addressModalProvider =
    StateNotifierProvider<AddressModalNotifier, AddressModalState>(
  (ref) => AddressModalNotifier(),
);
