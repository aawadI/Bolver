import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import '../riverpod/provider/order_history_provider.dart';
import 'order_item_widget.dart';

class OnTheWayTabBody extends ConsumerStatefulWidget {
  const OnTheWayTabBody({Key? key}) : super(key: key);

  @override
  ConsumerState<OnTheWayTabBody> createState() => _OnTheWayTabBodyState();
}

class _OnTheWayTabBodyState extends ConsumerState<OnTheWayTabBody> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(orderHistoryProvider.notifier).initialFetchOnTheWayOrders();
      },
    );
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels) {
          ref.read(orderHistoryProvider.notifier).fetchMoreOnTheWayOrders();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(orderHistoryProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 15),
      child: state.isOnTheWayLoading
          ? const OrdersShimmer(paddingVertical: 20)
          : state.onTheWayOrders.isNotEmpty
              ? ListView(
                  shrinkWrap: true,
                  physics: const CustomBouncingScrollPhysics(),
                  controller: _scrollController,
                  children: [
                    ListView.builder(
                      physics: const CustomBouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.onTheWayOrders.length,
                      padding: REdgeInsets.symmetric(vertical: 20),
                      itemBuilder: (context, index) =>
                          OrderItemWidget(order: state.onTheWayOrders[index]),
                    ),
                    if (state.isMoreOnTheWayLoading) const OrdersShimmer()
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 142.r,
                        height: 142.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: isDarkMode
                              ? AppColors.mainBackDark
                              : AppColors.white,
                        ),
                        alignment: Alignment.center,
                        child: Image.asset(
                          AppAssets.pngNoViewedProducts,
                          width: 87.r,
                          height: 60.r,
                          fit: BoxFit.cover,
                        ),
                      ),
                      14.verticalSpace,
                      Text(
                        AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe),
                        style: GoogleFonts.cairo(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -14 * 0.02,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}
