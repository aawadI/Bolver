import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../models/models.dart';

part 'notifications_state.freezed.dart';

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(false) bool isLoading,
    @Default(false) bool isDetailLoading,
    @Default(false) bool isMoreLoading,
    @Default([]) List<BlogData> notifications,
    BlogData? notificationDetail,
  }) = _NotificationsState;

  const NotificationsState._();
}