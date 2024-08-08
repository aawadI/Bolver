import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/order_history_state.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../repository/repository.dart';

class OrderHistoryNotifier extends StateNotifier<OrderHistoryState> {
  final OrdersRepository _ordersRepository;
  int _completedPage = 0;
  int _openPage = 0;
  int _canceledPage = 0;
  int _readyPage = 0;
  int _onTheWayPage = 0;
  bool _hasMoreCompleted = false;
  bool _hasMoreOpen = false;
  bool _hasMoreCanceled = false;
  bool _hasMoreReady = false;
  bool _hasMoreOnTheWay = false;

  OrderHistoryNotifier(this._ordersRepository)
      : super(const OrderHistoryState());

  Future<void> fetchMoreCanceledOrders() async {
    if (_hasMoreCanceled) {
      return;
    }
    state = state.copyWith(isMoreCanceledLoading: true);
    final response = await _ordersRepository.getCanceledOrders(++_canceledPage);
    response.when(
      success: (data) {
        final List<OrderData> newOrders = data.data ?? [];
        List<OrderData> orders = List.from(state.canceledOrders);
        orders.addAll(newOrders);
        state = state.copyWith(
          canceledOrders: orders,
          isMoreCanceledLoading: false,
        );
        _hasMoreCanceled = orders.length >= (data.meta?.total ?? 0);
      },
      failure: (fail) {
        _canceledPage--;
        state = state.copyWith(isMoreCanceledLoading: false);
        debugPrint('===> fetch more canceled orders fail $fail');
      },
    );
  }

  Future<void> initialFetchCanceledOrders() async {
    if (state.canceledOrders.isEmpty) {
      state = state.copyWith(isCanceledLoading: true);
    }
    _canceledPage = 0;
    _hasMoreCanceled = false;
    final response = await _ordersRepository.getCanceledOrders(++_canceledPage);
    response.when(
      success: (data) {
        final List<OrderData> orders = data.data ?? [];
        state = state.copyWith(
          canceledOrders: orders,
          isCanceledLoading: false,
          totalCanceledCount: data.meta?.total ?? 0,
        );
        _hasMoreCanceled = orders.length >= (data.meta?.total ?? 0);
      },
      failure: (fail) {
        state = state.copyWith(isCanceledLoading: false);
        _canceledPage--;
        debugPrint('==> get canceled orders fail: $fail');
      },
    );
  }

  Future<void> fetchMoreCompletedOrders() async {
    if (_hasMoreCompleted) {
      return;
    }
    state = state.copyWith(isMoreCompletedLoading: true);
    final response =
        await _ordersRepository.getCompletedOrders(++_completedPage);
    response.when(
      success: (data) {
        final List<OrderData> newOrders = data.data ?? [];
        List<OrderData> orders = List.from(state.completedOrders);
        orders.addAll(newOrders);
        state = state.copyWith(
          completedOrders: orders,
          isMoreCompletedLoading: false,
        );
        _hasMoreCompleted = orders.length >= (data.meta?.total ?? 0);
      },
      failure: (fail) {
        _completedPage--;
        state = state.copyWith(isMoreCompletedLoading: false);
        debugPrint('===> fetch more completed orders fail $fail');
      },
    );
  }

  Future<void> initialFetchCompletedOrders() async {
    if (state.completedOrders.isEmpty) {
      state = state.copyWith(isCompletedLoading: true);
    }
    _completedPage = 0;
    _hasMoreCompleted = false;
    final response =
        await _ordersRepository.getCompletedOrders(++_completedPage);
    response.when(
      success: (data) {
        final List<OrderData> orders = data.data ?? [];
        state = state.copyWith(
          completedOrders: orders,
          isCompletedLoading: false,
          isMoreCompletedLoading: false,
          totalCompletedCount: data.meta?.total ?? 0,
        );
        _hasMoreCompleted = orders.length >= (data.meta?.total ?? 0);
      },
      failure: (fail) {
        state = state.copyWith(isCompletedLoading: false,isMoreCompletedLoading:false);
        _completedPage--;
        debugPrint('==> get completed orders fail: $fail');
      },
    );
  }

  Future<void> fetchMoreOpenOrders() async {
    if (_hasMoreOpen) {
      return;
    }
    state = state.copyWith(isMoreOpenLoading: true);
    final response = await _ordersRepository.getOpenOrders(++_openPage);
    response.when(
      success: (data) {
        final List<OrderData> newOrders = data.data ?? [];
        List<OrderData> orders = List.from(state.openOrders);
        orders.addAll(newOrders);
        state = state.copyWith(openOrders: orders, isMoreOpenLoading: false);
        _hasMoreOpen = orders.length >= (data.meta?.total ?? 0);
      },
      failure: (fail) {
        _openPage--;
        state = state.copyWith(isMoreOpenLoading: false);
        debugPrint('===> fetch more open orders fail $fail');
      },
    );
  }

  Future<void> initialFetchOpenOrders() async {
    if (state.openOrders.isEmpty) {
      state = state.copyWith(isOpenLoading: true);
    }
    _openPage = 0;
    _hasMoreOpen = false;
    final response = await _ordersRepository.getOpenOrders(++_openPage);
    response.when(
      success: (data) {
        final List<OrderData> orders = data.data ?? [];
        state = state.copyWith(
          openOrders: orders,
          isOpenLoading: false,
          totalOpenCount: data.meta?.total ?? 0,
        );
        _hasMoreOpen = orders.length >= (data.meta?.total ?? 0);
      },
      failure: (fail) {
        state = state.copyWith(isOpenLoading: false);
        _openPage--;
        debugPrint('==> get open orders fail: $fail');
      },
    );
  }

  Future<void> initialFetchReadyOrders() async {
    if (state.readyOrders.isEmpty) {
      state = state.copyWith(isReadyLoading: true);
    }
    _readyPage = 0;
    _hasMoreReady = false;
    final response = await _ordersRepository.getReadyOrders(++_readyPage);
    response.when(
      success: (data) {
        final List<OrderData> orders = data.data ?? [];
        state = state.copyWith(
          readyOrders: orders,
          isReadyLoading: false,
          totalReadyCount: data.meta?.total ?? 0,
        );
        _hasMoreReady = orders.length >= (data.meta?.total ?? 0);
      },
      failure: (fail) {
        state = state.copyWith(isReadyLoading: false);
        _readyPage--;
        debugPrint('==> get ready orders fail: $fail');
      },
    );
  }

  Future<void> fetchMoreReadyOrders() async {
    if (_hasMoreReady) {
      return;
    }
    state = state.copyWith(isMoreReadyLoading: true);
    final response = await _ordersRepository.getReadyOrders(++_readyPage);
    response.when(
      success: (data) {
        final List<OrderData> readyOrder = data.data ?? [];
        List<OrderData> orders = List.from(state.readyOrders);
        orders.addAll(readyOrder);
        state = state.copyWith(readyOrders: orders, isMoreReadyLoading: false);
        _hasMoreReady = orders.length >= (data.meta?.total ?? 0);
      },
      failure: (fail) {
        _readyPage--;
        state = state.copyWith(isMoreReadyLoading: false);
        debugPrint('===> fetch more ready orders fail $fail');
      },
    );
  }

  Future<void> initialFetchOnTheWayOrders() async {
    if (state.onTheWayOrders.isEmpty) {
      state = state.copyWith(isOnTheWayLoading: true);
    }
    _onTheWayPage = 0;
    _hasMoreOnTheWay = false;
    final response = await _ordersRepository.getOnTheWayOrders(++_onTheWayPage);
    response.when(
      success: (data) {
        final List<OrderData> orders = data.data ?? [];
        state = state.copyWith(
          onTheWayOrders: orders,
          isOnTheWayLoading: false,
          totalOnTheWayCount: data.meta?.total ?? 0,
        );
        _hasMoreOnTheWay = orders.length >= (data.meta?.total ?? 0);
      },
      failure: (fail) {
        state = state.copyWith(isOnTheWayLoading: false);
        _onTheWayPage--;
        debugPrint('==> get onTheWay orders fail: $fail');
      },
    );
  }

  Future<void> fetchMoreOnTheWayOrders() async {
    if (_hasMoreOnTheWay) {
      return;
    }
    state = state.copyWith(isMoreOnTheWayLoading: true);
    final response = await _ordersRepository.getOnTheWayOrders(++_onTheWayPage);
    response.when(
      success: (data) {
        final List<OrderData> onTheWayOrder = data.data ?? [];
        List<OrderData> orders = List.from(state.readyOrders);
        orders.addAll(onTheWayOrder);
        state = state.copyWith(onTheWayOrders: orders, isMoreOnTheWayLoading: false);
        _hasMoreOnTheWay = orders.length >= (data.meta?.total ?? 0);
      },
      failure: (fail) {
        _onTheWayPage--;
        state = state.copyWith(isMoreOnTheWayLoading: false);
        debugPrint('===> fetch more on the way orders fail $fail');
      },
    );
  }

  Future<void> changeActiveTab(int index) async {
    state = state.copyWith(activeTab: index);
  }
}
