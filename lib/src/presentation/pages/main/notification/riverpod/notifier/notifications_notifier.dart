import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/notifications_state.dart';
import '../../../../../../models/models.dart';
import '../../../../../../repository/repository.dart';

class NotificationsNotifier extends StateNotifier<NotificationsState> {
  final BlogsRepository _blogsRepository;
  int _page = 0;
  bool _hasMore = true;

  NotificationsNotifier(this._blogsRepository)
      : super(const NotificationsState());

  Future<void> fetchMoreNotifications() async {
    if (!_hasMore) {
      return;
    }
    state = state.copyWith(isMoreLoading: true);
    final response = await _blogsRepository.getBlogs(++_page, 'notification');
    response.when(
      success: (data) {
        final List<BlogData> notifications = data.data ?? [];
        state =
            state.copyWith(notifications: notifications, isMoreLoading: false);
        _hasMore = notifications.length >= 15;
      },
      failure: (fail) {
        state = state.copyWith(isMoreLoading: false);
        debugPrint('===> fetch more notifications $fail');
        _page--;
      },
    );
  }

  Future<void> initialFetchNotifications() async {
    if (state.notifications.isNotEmpty) {
      return;
    }
    _page = 0;
    _hasMore = true;
    state = state.copyWith(isLoading: true);
    final response = await _blogsRepository.getBlogs(++_page, 'notification');
    response.when(
      success: (data) {
        final List<BlogData> notifications = data.data ?? [];
        state = state.copyWith(notifications: notifications, isLoading: false);
        _hasMore = notifications.length >= 15;
      },
      failure: (fail) {
        debugPrint('===> initial fetch notifications fail $fail');
        state = state.copyWith(isLoading: false);
        _page--;
      },
    );
  }

  Future<void> fetchNotificationDetail(String uuid) async {
    state = state.copyWith(isDetailLoading: true);
    final response = await _blogsRepository.getDetails('notification', uuid);
    response.when(
      success: (data) {
        final BlogData notifications = data;
        state = state.copyWith(notificationDetail: notifications, isDetailLoading: false);
      },
      failure: (fail) {
        debugPrint('===> details fetch notifications fail $fail');
        state = state.copyWith(isDetailLoading: false);
        _page--;
      },
    );
  }
}
