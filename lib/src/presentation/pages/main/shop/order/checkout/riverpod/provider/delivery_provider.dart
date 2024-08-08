import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/delivery_state.dart';
import '../notifier/delivery_notifier.dart';
import '../../../../../../../../core/di/dependency_manager.dart';

final deliveryProvider = StateNotifierProvider<DeliveryNotifier, DeliveryState>(
  (ref) => DeliveryNotifier(ordersRepository),
);
