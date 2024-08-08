import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../../../models/models.dart';
import '../../../../../../../../core/constants/constants.dart';

part 'delivery_state.freezed.dart';

@freezed
class DeliveryState with _$DeliveryState {
  const factory DeliveryState({
    @Default(false) bool isLoading,
    @Default([]) List<NewDeliveryData> deliveries,
    @Default(0) int addressIndex,
    @Default(0) int selectedDeliveryIndex,
    @Default(ShippingDeliveryVisibilityType.cantOrder)
        ShippingDeliveryVisibilityType visibilityType,
    @Default(DeliveryTypeEnum.delivery) DeliveryTypeEnum selectedDeliveryType,
  }) = _DeliveryState;

  const DeliveryState._();
}
