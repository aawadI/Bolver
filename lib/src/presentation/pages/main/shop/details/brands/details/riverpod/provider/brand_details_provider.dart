import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/brand_details_state.dart';
import '../notifier/brand_details_notifier.dart';
import '../../../../../../../../../core/di/dependency_manager.dart';

final brandDetailsProvider =
    StateNotifierProvider.autoDispose<BrandDetailsNotifier, BrandDetailsState>(
  (ref) => BrandDetailsNotifier(brandsRepository, productsRepository),
);
