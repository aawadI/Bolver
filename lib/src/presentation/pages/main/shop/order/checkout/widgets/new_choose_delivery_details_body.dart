import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'shipping_methods_modal.dart';
import 'addresses_modal_in_order_shipping.dart';
import '../../../../../../../core/utils/utils.dart';
import '../riverpod/provider/delivery_provider.dart';
import '../../../../../../components/components.dart';
import '../../../../../../../core/constants/constants.dart';

class NewChooseDeliveryDetailsBody extends ConsumerWidget {
  const NewChooseDeliveryDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(deliveryProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 15),
      child: state.selectedDeliveryType == DeliveryTypeEnum.delivery
          ? SingleChildScrollView(
              physics: const CustomBouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  20.verticalSpace,
                  SelectFromDialogButton(
                    prefixIcon: FlutterRemix.navigation_fill,
                    title: AppHelpers.getTranslation(TrKeys.deliveryAddress),
                    text: LocalStorage.instance.getNewAddresses().isNotEmpty
                        ? '${LocalStorage.instance.getNewAddresses()[state.addressIndex].title}'
                        : AppHelpers.getTranslation(TrKeys.addNewAddress),
                    onTap: () => AppHelpers.showCustomModalBottomSheet(
                      context: context,
                      modal: const AddressesModalInOrderShipping(),
                      isDarkMode: isDarkMode,
                    ),
                    isError: LocalStorage.instance.getNewAddresses().isEmpty,
                  ),
                  10.verticalSpace,
                  SelectFromDialogButton(
                    prefixIcon: FlutterRemix.creative_commons_nd_fill,
                    title: AppHelpers.getTranslation(TrKeys.deliveryMethod),
                    text: state.deliveries.isNotEmpty
                        ? '${state.deliveries[state.selectedDeliveryIndex].translation?.title}'
                        : '',
                    onTap: () => AppHelpers.showCustomModalBottomSheet(
                      context: context,
                      modal: const ShippingMethodsModal(),
                      isDarkMode: isDarkMode,
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}
