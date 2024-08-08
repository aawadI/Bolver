import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/utils/utils.dart';
import '../riverpod/provider/delivery_provider.dart';
import '../../../../../../components/components.dart';
import '../../../../../../../core/constants/constants.dart';

class NewShippingDeliveriesWidget extends StatelessWidget {
  const NewShippingDeliveriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(deliveryProvider);
          final event = ref.read(deliveryProvider.notifier);
          return Row(
            children: [
              if (state.visibilityType == ShippingDeliveryVisibilityType.both ||
                  state.visibilityType ==
                      ShippingDeliveryVisibilityType.onlyDelivery)
                RadioButton(
                  text: AppHelpers.getTranslation(TrKeys.delivery),
                  isSelected:
                      state.selectedDeliveryType == DeliveryTypeEnum.delivery,
                  onTap: () =>
                      event.changeDeliveryType(DeliveryTypeEnum.delivery),
                ),
              36.horizontalSpace,
              if (state.visibilityType == ShippingDeliveryVisibilityType.both ||
                  state.visibilityType ==
                      ShippingDeliveryVisibilityType.onlyPickup)
                RadioButton(
                  text: AppHelpers.getTranslation(TrKeys.pickup),
                  isSelected:
                      state.selectedDeliveryType == DeliveryTypeEnum.pickup,
                  onTap: () =>
                      event.changeDeliveryType(DeliveryTypeEnum.pickup),
                ),
            ],
          );
        },
      ),
    );
  }
}
