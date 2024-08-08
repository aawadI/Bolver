import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/search_address_state.dart';
import '../notifier/search_address_notifier.dart';

final searchAddressProvider = StateNotifierProvider.autoDispose<
    SearchAddressNotifier, SearchAddressState>(
  (ref) => SearchAddressNotifier(),
);
