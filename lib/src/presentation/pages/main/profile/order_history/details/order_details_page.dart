import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import 'riverpod/provider/order_details_payment_provider.dart';
import 'riverpod/provider/order_details_provider.dart';
import 'widgets/expandable_shop_order_item.dart';
import 'widgets/order_review_modal.dart';
import 'widgets/order_shop_totals_widget.dart';

class OrderDetailsPage extends ConsumerStatefulWidget {
  final int orderId;
  final String date;

  const OrderDetailsPage({Key? key, required this.orderId, required this.date})
      : super(key: key);

  @override
  ConsumerState<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends ConsumerState<OrderDetailsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(orderDetailsProvider.notifier)
          .fetchOrderDetails(widget.orderId),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderDetailsProvider);
    final event = ref.read(orderDetailsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.mainBack,
        extendBody: true,
        appBar: AppBar(
          backgroundColor:
              isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          elevation: 0,
          leading: IconButton(
            splashRadius: 18.r,
            onPressed: context.popRoute,
            icon: Icon(
              isLtr
                  ? FlutterRemix.arrow_left_s_line
                  : FlutterRemix.arrow_right_s_line,
              size: 24.r,
              color: isDarkMode ? AppColors.white : AppColors.black,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              Container(
                height: 29.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  border: Border.all(
                    width: 1.r,
                    color: isDarkMode
                        ? AppColors.borderDark
                        : AppColors.black.withOpacity(0.09),
                  ),
                ),
                padding: REdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Text(
                      '${AppHelpers.getTranslation(TrKeys.order)}_${widget.orderId}',
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        letterSpacing: -0.4,
                        color:
                            isDarkMode ? AppColors.white : AppColors.reviewText,
                      ),
                    ),
                    12.horizontalSpace,
                    Container(
                      height: 19.r,
                      width: 1.r,
                      color: AppColors.verticalDivider,
                    ),
                    12.horizontalSpace,
                    Text(
                      widget.date.substring(0, 10),
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        letterSpacing: -0.4,
                        color:
                            isDarkMode ? AppColors.white : AppColors.reviewText,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: state.isLoading
            ? JumpingDots(
                color: isDarkMode ? AppColors.white : AppColors.black,
              )
            : Column(
                children: [
                  1.verticalSpace,
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const CustomBouncingScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListView.builder(
                            itemCount: state.shopOrderDetails.length,
                            shrinkWrap: true,
                            physics: const CustomBouncingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) =>
                                ExpandableShopOrderItem(
                              orderDetails: state.shopOrderDetails[index],
                            ),
                          ),
                          Container(
                            color: isDarkMode
                                ? AppColors.mainBackDark
                                : AppColors.white,
                            child: Column(
                              children: [
                                Container(
                                  height: 71.r,
                                  decoration: BoxDecoration(
                                    color: isDarkMode
                                        ? AppColors.dontHaveAnAccBackDark
                                        : AppColors.dontHaveAccBtnBack,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  margin: REdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                    top: 16,
                                  ),
                                  padding:
                                      REdgeInsets.symmetric(horizontal: 15),
                                  alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            AppHelpers.getTranslation(
                                                TrKeys.payment),
                                            style: GoogleFonts.cairo(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              letterSpacing: -14 * 0.01,
                                              color: isDarkMode
                                                  ? AppColors.white
                                                  : AppColors.shippingType,
                                            ),
                                          ),
                                          Text(
                                            intl.NumberFormat.currency(
                                              symbol: state.orderResponse?.data
                                                  ?.currency?.symbol,
                                            ).format(state.orderResponse?.data
                                                    ?.transaction?.price ??
                                                0),
                                            style: GoogleFonts.cairo(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              letterSpacing: -14 * 0.01,
                                              color: isDarkMode
                                                  ? AppColors.white
                                                  : AppColors.shippingType,
                                            ),
                                          ),
                                        ],
                                      ),
                                      6.verticalSpace,
                                      Text(
                                        state.orderResponse?.data
                                                    ?.transaction !=
                                                null
                                            ? '${state.orderResponse?.data?.transaction?.paymentSystem?.translation?.title}'
                                            : AppHelpers.getTranslation(
                                                TrKeys.noPayment),
                                        style: GoogleFonts.cairo(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15.sp,
                                          letterSpacing: -14 * 0.01,
                                          color: isDarkMode
                                              ? AppColors.white
                                              : AppColors.selectedTextFromModal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (state.orderResponse?.data?.transaction
                                            ?.status !=
                                        'paid' &&
                                    state.orderResponse?.data?.transaction
                                            ?.status !=
                                        'pending' &&
                                    state.orderResponse?.data?.transaction
                                            ?.paymentSystem?.tag ==
                                        'atb' &&
                                    state.orderResponse?.data?.status
                                            ?.toUpperCase() !=
                                        "CANCELED")
                                  Padding(
                                    padding: REdgeInsets.only(
                                      left: 16,
                                      right: 16,
                                      top: 16,
                                    ),
                                    child: Consumer(
                                      builder: (context, ref, child) {
                                        final paymentState = ref
                                            .watch(orderDetailsPaymentProvider);
                                        final paymentEvent = ref.read(
                                            orderDetailsPaymentProvider
                                                .notifier);
                                        return AccentLoginButton(
                                          title: AppHelpers.getTranslation(
                                              TrKeys.pay),
                                          isLoading: paymentState.isLoading,
                                          onPressed: () =>
                                              paymentEvent.fetchAtbPayment(
                                            transactionId: state.orderResponse
                                                ?.data?.transaction?.id,
                                            redirected: () {
                                              event.fetchOrderDetails(state
                                                      .orderResponse
                                                      ?.data
                                                      ?.id ??
                                                  0);
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                Container(
                                  height: 71.r,
                                  decoration: BoxDecoration(
                                    color: isDarkMode
                                        ? AppColors.dontHaveAnAccBackDark
                                        : AppColors.dontHaveAccBtnBack,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  margin: REdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                    top: 24,
                                  ),
                                  padding:
                                      REdgeInsets.symmetric(horizontal: 15),
                                  alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            state.orderResponse?.data?.delivery
                                                    ?.translation?.title ??
                                                "",
                                            style: GoogleFonts.cairo(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              letterSpacing: -14 * 0.01,
                                              color: isDarkMode
                                                  ? AppColors.white
                                                  : AppColors.shippingType,
                                            ),
                                          ),
                                          Text(
                                            intl.NumberFormat.currency(
                                              symbol: state.orderResponse?.data
                                                  ?.currency?.symbol,
                                            ).format((state.orderResponse?.data
                                                        ?.totalDeliveryFee ??
                                                    30.0)
                                                .clamp(30.0, double.infinity)),
                                            style: GoogleFonts.cairo(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14.sp,
                                              letterSpacing: -14 * 0.01,
                                              color: isDarkMode
                                                  ? AppColors.white
                                                  : AppColors.shippingType,
                                            ),
                                          )
                                        ],
                                      ),
                                      6.verticalSpace,
                                      Text(
                                        '${(state.orderResponse?.data?.delivery?.times?.isNotEmpty ?? false) ? state.orderResponse?.data?.delivery?.times![0] : ''} - ${(state.orderResponse?.data?.delivery?.times?.length ?? 0) > 1 ? state.orderResponse?.data?.delivery?.times![1] : ''} ${AppHelpers.getTranslation(TrKeys.days)}',
                                        style: GoogleFonts.cairo(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15.sp,
                                          letterSpacing: -14 * 0.01,
                                          color: isDarkMode
                                              ? AppColors.white
                                              : AppColors.selectedTextFromModal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                if (state.orderResponse?.data?.userAddress !=
                                    null)
                                  Container(
                                    decoration: BoxDecoration(
                                      color: isDarkMode
                                          ? AppColors.dontHaveAnAccBackDark
                                          : AppColors.dontHaveAccBtnBack,
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    margin: REdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 18,
                                    ),
                                    padding: REdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 18,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          AppHelpers.getTranslation(
                                              TrKeys.deliveryAddress),
                                          style: GoogleFonts.cairo(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14.sp,
                                            letterSpacing: -14 * 0.01,
                                            color: isDarkMode
                                                ? AppColors.white
                                                : AppColors.shippingType,
                                          ),
                                        ),
                                        6.verticalSpace,
                                        Text(
                                          '${state.orderResponse?.data?.userAddress?.title}',
                                          style: GoogleFonts.cairo(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15.sp,
                                            letterSpacing: -14 * 0.01,
                                            color: isDarkMode
                                                ? AppColors.white
                                                : AppColors
                                                    .selectedTextFromModal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                16.verticalSpace,
                                if (state.orderResponse?.data?.status ==
                                    'delivered')
                                  Container(
                                    decoration: BoxDecoration(
                                      color: isDarkMode
                                          ? AppColors.dontHaveAnAccBackDark
                                          : AppColors.dontHaveAccBtnBack,
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    margin: REdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 18,
                                    ),
                                    padding: REdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 18,
                                    ),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              AppHelpers.getTranslation(
                                                  TrKeys.delivery),
                                              style: GoogleFonts.cairo(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                letterSpacing: -14 * 0.01,
                                                color: isDarkMode
                                                    ? AppColors.white
                                                    : AppColors.shippingType,
                                              ),
                                            ),
                                            6.verticalSpace,
                                            Text(
                                              '${state.orderResponse?.data?.deliveryman?.firstname ?? ""} ${state.orderResponse?.data?.deliveryman?.lastname ?? ""}',
                                              style: GoogleFonts.cairo(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15.sp,
                                                letterSpacing: -14 * 0.01,
                                                color: isDarkMode
                                                    ? AppColors.white
                                                    : AppColors
                                                        .selectedTextFromModal,
                                              ),
                                            ),
                                          ],
                                        ),
                                        48.horizontalSpace,
                                        Expanded(
                                          child: AccentLoginButton(
                                            title: AppHelpers.getTranslation(
                                                TrKeys.reviewDeliveryman),
                                            onPressed: () {
                                              ref
                                                  .read(orderDetailsProvider
                                                      .notifier)
                                                  .setRating(4);
                                              showModalBottomSheet(
                                                context: context,
                                                builder: (context) =>
                                                    const OrderReviewModal(
                                                  isDeliveryReview: true,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                16.verticalSpace,
                              ],
                            ),
                          ),
                          20.verticalSpace,
                          Container(
                            color: isDarkMode
                                ? AppColors.dontHaveAnAccBackDark
                                : AppColors.white,
                            padding: REdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 20,
                            ),
                            child: const OrderShopTotalsWidget(),
                          ),
                          50.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        bottomNavigationBar: Container(
          color: AppColors.transparent,
          padding: REdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 15,
            top: 10,
          ),
          child: Row(
            children: [
              Expanded(
                child: AccentLoginButton(
                  background: AppColors.red,
                  isLoading: state.isCancelLoading,
                  title: AppHelpers.getTranslation(TrKeys.cancelOrder),
                  onPressed:
                      state.orderResponse?.data?.status?.toUpperCase() == "NEW"
                          ? () => {
                                ref
                                    .read(orderDetailsProvider.notifier)
                                    .cancelOrder(context)
                              }
                          : null,
                ),
              ),
              9.horizontalSpace,
              Expanded(
                child: AccentLoginButton(
                  background: AppColors.black,
                  title: AppHelpers.getTranslation(TrKeys.leaveFeedback),
                  onPressed: state.orderResponse?.data?.status?.toUpperCase() ==
                          "DELIVERED"
                      ? () {
                          ref.read(orderDetailsProvider.notifier).setRating(4);
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => const OrderReviewModal(
                              isDeliveryReview: false,
                            ),
                          );
                        }
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
