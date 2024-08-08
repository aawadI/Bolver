import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import '../riverpod/provider/single_shop_provider.dart';

class SingleShopDeliveryTimesModal extends ConsumerWidget {
  const SingleShopDeliveryTimesModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(singleShopProvider);
    final event = ref.read(singleShopProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            11.verticalSpace,
            Container(
              width: 49.r,
              height: 3.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(62.r),
                color: isDarkMode
                    ? AppColors.dragElementDark
                    : AppColors.dragElement,
              ),
            ),
            13.verticalSpace,
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                AppHelpers.getTranslation(TrKeys.deliveryTimes).toUpperCase(),
                style: GoogleFonts.cairo(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                  letterSpacing: -14 * 0.01,
                ),
              ),
            ),
            30.verticalSpace,
            SelectDateButton(
              date: state.selectedDate ?? DateTime.now(),
              onDateSaved: event.setDeliveryDate,
            ),
            16.verticalSpace,
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: isDarkMode
                      ? AppColors.mainBackDark
                      : AppColors.dontHaveAccBtnBack,
                ),
                padding: REdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const CustomBouncingScrollPhysics(),
                  itemCount: state.deliveryTimes.length,
                  padding: REdgeInsets.symmetric(vertical: 20),
                  itemBuilder: (context, index) {
                    final bool isLast = state.deliveryTimes.length - 1 == index;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              intl.DateFormat('MM.dd')
                                  .format(state.selectedDate ?? DateTime.now()),
                              style: GoogleFonts.cairo(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                                letterSpacing: -0.4,
                              ),
                            ),
                            Text(
                              state.deliveryTimes[index],
                              style: GoogleFonts.cairo(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                                letterSpacing: -0.4,
                              ),
                            ),
                          ],
                        ),
                        17.verticalSpace,
                        if (!isLast)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Divider(
                                height: 1.r,
                                thickness: 1.r,
                                color: isDarkMode
                                    ? AppColors.dragElementDark
                                    : AppColors.divider,
                              ),
                              18.verticalSpace,
                            ],
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
