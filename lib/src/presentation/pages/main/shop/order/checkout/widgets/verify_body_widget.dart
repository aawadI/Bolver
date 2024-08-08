import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../models/data/shop_data.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import '../../riverpod/provider/order_provider.dart';
import '../../widgets/total_order_calculations_widget.dart';
import '../riverpod/provider/checkout_provider.dart';
import 'verify_shop_item_widget.dart';

class VerifyBodyWidget extends ConsumerWidget {
  const VerifyBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkoutProvider);
    final orderState = ref.watch(orderProvider);
    final notifier = ref.read(checkoutProvider.notifier);
    final orderNotifier = ref.read(orderProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    ShopData? shopData;
    return orderState.isLoading
        ? JumpingDots(
            radius: 7,
            color: isDarkMode ? AppColors.white : AppColors.black,
          )
        : Stack(
            children: [
              SingleChildScrollView(
                physics: const CustomBouncingScrollPhysics(),
                primary: true,
                child: Column(
                  children: [
                    21.verticalSpace,
                    ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: orderState.shopTotals.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final shopTotal = orderState.shopTotals[index];
                        final shopID = orderState
                            .shopTotals[index].cartProducts.first.shopID;
                        for (var element in orderState.allShops) {
                          if (element.id == shopID) {
                            shopData = element;
                          }
                        }
                        return VerifyShopItemWidget(
                          shopData: shopData,
                          shopTotal: shopTotal,
                        );
                      },
                    ),
                    24.verticalSpace,
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 15),
                      child: OutlinedBorderTextField(
                        label:
                            AppHelpers.getTranslation(TrKeys.dicountCopoun),
                        // '${AppHelpers.getTranslation(TrKeys.couponFor)} ${AppHelpers.getTranslation(TrKeys.order)}',
                        onChanged: (String coupon) =>
                            notifier.setShopCoupon(coupon),
                        isError: state.isError,
                        readOnly: state.isApplied,
                        suffixIcon: IconButton(
                          splashRadius: 20.r,
                          icon: Icon(
                            FlutterRemix.check_double_fill,
                            size: 22.r,
                            color: state.isApplied
                                ? AppColors.accentGreen
                                : isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                          ),
                          onPressed: state.isApplied
                              ? null
                              : () {
                                  notifier.checkCoupon(
                                    context,
                                    orderNotifier,
                                  );
                                },
                        ),
                      ),
                    ),
                    24.verticalSpace,
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 15),
                      child: OutlinedBorderTextField(
                        label: AppHelpers.getTranslation(TrKeys.orderComment),
                        onChanged: notifier.setComment,
                      ),
                    ),
                    16.verticalSpace,
                    TotalOrderCalculationsWidget(
                      coupon: orderState.coupon,
                      deliveryFee: state.deliveryFee,
                      cashback: state.cashbackAmount,
                    ),
                    40.verticalSpace,
                  ],
                ),
              ),
              BlurLoadingWidget(
                isLoading: state.isCreatingOrder ||
                    state.isCheckingCoupon ||
                    state.isCheckingCashback,
              ),
            ],
          );
  }
}
