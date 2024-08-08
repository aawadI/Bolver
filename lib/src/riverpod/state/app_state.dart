import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/models.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(false) bool isDarkMode,
    @Default(true) bool isLtr,
    @Default(null) int? index,
    LanguageData? activeLanguage,
  }) = _AppState;

  const AppState._();
}
