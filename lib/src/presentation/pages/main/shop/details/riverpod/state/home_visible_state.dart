import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_visible_state.freezed.dart';
@freezed
class HomeVisibleState with _$HomeVisibleState {
  const factory HomeVisibleState({
    @Default(false) bool isVisible,
  }) = _HomeVisibleState;

  const HomeVisibleState._();
}