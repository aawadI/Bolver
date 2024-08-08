import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/select_lang_state.dart';
import '../notifier/select_lang_notifier.dart';
import '../../../../../../core/di/dependency_manager.dart';

final selectLangProvider =
    StateNotifierProvider.autoDispose<SelectLangNotifier, SelectLangState>(
  (ref) => SelectLangNotifier(settingsRepository),
);
