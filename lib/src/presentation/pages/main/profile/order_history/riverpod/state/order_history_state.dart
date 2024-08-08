import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../models/models.dart';

part 'order_history_state.freezed.dart';

@freezed
class OrderHistoryState with _$OrderHistoryState {
  const factory OrderHistoryState({
    @Default(0) int activeTab,
    @Default(0) int totalCompletedCount,
    @Default(0) int totalOpenCount,
    @Default(0) int totalCanceledCount,
    @Default(0) int totalReadyCount,
    @Default(0) int totalOnTheWayCount,
    @Default(false) bool isCompletedLoading,
    @Default(false) bool isOpenLoading,
    @Default(false) bool isCanceledLoading,
    @Default(false) bool isReadyLoading,
    @Default(false) bool isOnTheWayLoading,
    @Default(false) bool isMoreCompletedLoading,
    @Default(false) bool isMoreOpenLoading,
    @Default(false) bool isMoreCanceledLoading,
    @Default(false) bool isMoreReadyLoading,
    @Default(false) bool isMoreOnTheWayLoading,
    @Default([]) List<OrderData> completedOrders,
    @Default([]) List<OrderData> openOrders,
    @Default([]) List<OrderData> canceledOrders,
    @Default([]) List<OrderData> readyOrders,
    @Default([]) List<OrderData> onTheWayOrders,
  }) = _OrderHistoryState;

  const OrderHistoryState._();
}