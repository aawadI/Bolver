import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../theme/theme.dart';

class NewShippingMethodItemWidget extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final NewDeliveryData? delivery;

  const NewShippingMethodItemWidget({
    Key? key,
    required this.onTap,
    this.isSelected = false,
    this.delivery,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          borderRadius: BorderRadius.circular(8.r),
          color: isDarkMode
              ? AppColors.mainBackDark
              : AppColors.notDoneOrderStatus,
          child: InkWell(
            borderRadius: BorderRadius.circular(8.r),
            onTap: onTap,
            child: Container(
              height: 74.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              alignment: Alignment.center,
              padding: REdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 20.r,
                        width: 20.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: isSelected
                              ? AppColors.white
                              : AppColors.transparent,
                          border: Border.all(
                            color: isSelected
                                ? AppColors.accentGreen
                                : isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                            width: isSelected ? 6.r : 2.r,
                          ),
                        ),
                      ),
                      10.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            delivery?.translation?.title ?? '',
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              letterSpacing: -14 * 0.01,
                            ),
                          ),
                          Text(
                            '${(delivery?.times != null && (delivery?.times!.length ?? 0) > 0) ? delivery?.times![0] : ''} - ${(delivery?.times != null && (delivery?.times!.length ?? 0) > 1) ? delivery?.times![1] : ''}',
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              letterSpacing: -14 * 0.01,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    delivery?.type == 'free'
                        ? AppHelpers.getTranslation(TrKeys.free)
                        : NumberFormat.currency(
                            symbol: LocalStorage.instance
                                .getSelectedCurrency()
                                ?.symbol,
                          ).format(delivery?.localPrice),
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                      letterSpacing: -14 * 0.01,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        12.verticalSpace,
      ],
    );
  }
}
