import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../riverpod/provider/checkout_provider.dart';
import 'addresses_modal_in_order_shipping.dart';

class ChooseDeliveryDetailsBody extends ConsumerWidget {
  const ChooseDeliveryDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkoutProvider);
    final notifier = ref.read(checkoutProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 15),
      child: state.shippingDataList[state.selectedShopIndex].activeDelivery ==
              DeliveryTypeEnum.pickup
          ? Column(
              children: [
                20.verticalSpace,
                SelectFromDialogButton(
                  prefixIcon: FlutterRemix.navigation_fill,
                  title: AppHelpers.getTranslation(TrKeys.storeAddress),
                  text: LocalStorage.instance.getNewAddresses().isNotEmpty ?
                      '${LocalStorage.instance.getNewAddresses()[state.addressIndex].title}' : AppHelpers.getTranslation(TrKeys.addNewAddress),
                  onTap: () {
                    AppHelpers.showCustomModalBottomSheet(
                      context: context,
                      modal: const AddressesModalInOrderShipping(),
                      isDarkMode: isDarkMode,
                    );
                  },
                ),
                // SelectFromDialogButton(
                //   prefixIcon: FlutterRemix.map_pin_2_fill,
                //   title: AppHelpers.getTranslation(TrKeys.storeAddress),
                //   text: state.shops[state.selectedShopIndex].translation
                //           ?.address ??
                //       AppHelpers.getTranslation(TrKeys.storeAddress),
                //   onTap: () {
                //     final Location? location =
                //         state.shops[state.selectedShopIndex].location;
                //     final initialLatLng = LatLng(
                //       location?.latitude ?? AppConstants.demoLatitude,
                //       location?.longitude ?? AppConstants.demoLongitude,
                //     );
                //     notifier.getMarkers(initialLatLng);
                //     // showCupertinoModalBottomSheet(
                //     //   context: context,
                //     //   expand: false,
                //     //   builder: (context) => const StoreAddressModal(),
                //     // );
                //     showModalBottomSheet(
                //       context: context,
                //       builder: (context) => const StoreAddressModal(),
                //     );
                //   },
                // ),
                10.verticalSpace,
                SelectFromDialogButton(
                  prefixIcon: FlutterRemix.map_pin_2_fill,
                  title: AppHelpers.getTranslation(TrKeys.pickupDate),
                  text: state.pickUpDate.isNotEmpty
                      ? state.pickUpDate
                      : AppHelpers.getTranslation(TrKeys.selectPickupDate),
                  onTap: () {
                    // showCupertinoModalBottomSheet(
                    //   context: context,
                    //   expand: false,
                    //   builder: (context) => const PickupDatePickerModal(),
                    // );
                    AppHelpers.showCustomModalBottomSheet(
                        context: context,
                        modal: DatePickerModal(
                          isDarkMode: isDarkMode,
                          onDateSaved: (date) =>
                              notifier.setPickupDate(date),
                        ),
                        isDarkMode: isDarkMode);
                  },
                ),
                20.verticalSpace,
              ],
            )
          : SingleChildScrollView(
              physics: const CustomBouncingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  20.verticalSpace,
                  SelectFromDialogButton(
                    prefixIcon: FlutterRemix.navigation_fill,
                    title: AppHelpers.getTranslation(TrKeys.deliveryAddress),
                    text:
                    LocalStorage.instance.getNewAddresses().isNotEmpty ?
                    '${LocalStorage.instance.getNewAddresses()[state.addressIndex].title}' : AppHelpers.getTranslation(TrKeys.addNewAddress),
                    onTap: () {
                      AppHelpers.showCustomModalBottomSheet(
                        context: context,
                        modal: const AddressesModalInOrderShipping(),
                        isDarkMode: isDarkMode,
                      );
                    },
                  ),
                  // 10.verticalSpace,
                  // SelectFromDialogButton(
                  //   prefixIcon: FlutterRemix.creative_commons_nd_fill,
                  //   title: AppHelpers.getTranslation(TrKeys.deliveryMethod),
                  //   text:
                  //       '${state.shippingDataList[state.selectedShopIndex].deliveryData?.shopDelivery?.translation?.title}',
                  //   onTap: () {
                  //     AppHelpers.showCustomModalBottomSheet(
                  //       context: context,
                  //       modal: const ShippingMethodsModal(),
                  //       isDarkMode: isDarkMode,
                  //     );
                  //   },
                  // ),
                  10.verticalSpace,
                  SelectFromDialogButton(
                    prefixIcon: FlutterRemix.calendar_fill,
                    title: AppHelpers.getTranslation(TrKeys.deliveryDate),
                    text: state.deliveryDate.isNotEmpty
                        ? state.deliveryDate
                        : AppHelpers.getTranslation(TrKeys.selectDeliveryDate),
                    onTap: () {
                      // showCupertinoModalBottomSheet(
                      //   context: context,
                      //   expand: false,
                      //   builder: (context) => DatePickerModal(
                      //     onDateSaved: (date) => notifier.setDeliveryDate(date),
                      //   ),
                      // );
                      AppHelpers.showCustomModalBottomSheet(
                          context: context,
                          modal: DatePickerModal(
                            isDarkMode: isDarkMode,
                            onDateSaved: (date) =>
                                notifier.setDeliveryDate(date),
                          ),
                          isDarkMode: isDarkMode);
                    },
                  ),
                  10.verticalSpace,
                  SelectFromDialogButton(
                    prefixIcon: FlutterRemix.time_fill,
                    title: AppHelpers.getTranslation(TrKeys.deliveryTime),
                    text: state.deliveryTime.isNotEmpty
                        ? state.deliveryTime
                        : AppHelpers.getTranslation(TrKeys.selectDeliveryTime),
                    onTap: () {
                      // showCupertinoModalBottomSheet(
                      //   context: context,
                      //   expand: false,
                      //   builder: (context) => TimePickerModal(
                      //     onSaved: (time) {
                      //       notifier.setDeliveryTime(time);
                      //       context.popRoute();
                      //     },
                      //     openTime: state
                      //         .shippingDataList[state.selectedShopIndex]
                      //         .openTime,
                      //     closeTime: state
                      //         .shippingDataList[state.selectedShopIndex]
                      //         .closeTime,
                      //   ),
                      // );
                      AppHelpers.showCustomModalBottomSheet(
                          context: context,
                          modal: TimePickerModal(
                            isDarkMode: isDarkMode,
                            onSaved: (time) {
                              notifier.setDeliveryTime(time);
                              context.popRoute();
                            },
                            openTime: state
                                .shippingDataList[state.selectedShopIndex]
                                .openTime,
                            closeTime: state
                                .shippingDataList[state.selectedShopIndex]
                                .closeTime,
                          ),
                          isDarkMode: isDarkMode);
                    },
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
    );
  }
}
