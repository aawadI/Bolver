import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';

class ImageWalletSettings extends StatelessWidget {
  const ImageWalletSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (LocalStorage.instance.getUser() != null)
          Padding(
            padding: EdgeInsetsDirectional.only(end: 8.r),
            child: CommonImage(
              imageUrl: LocalStorage.instance.getProfileImage(),
              radius: 16,
              width: 50,
              height: 50,
              errorRadius: 16,
            ),
          ),
        Expanded(
          child: Container(
            height: 50.r,
            decoration: BoxDecoration(
              color: isDarkMode
                  ? AppColors.dontHaveAnAccBackDark
                  : AppColors.dontHaveAccBtnBack,
              borderRadius: BorderRadius.circular(8.r),
            ),
            alignment: Alignment.center,
            padding: REdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      FlutterRemix.wallet_3_line,
                      size: 18.r,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                    10.horizontalSpace,
                    Text(
                      LocalStorage.instance.getWalletData()?.price != null
                          ? intl.NumberFormat.currency(
                              symbol: LocalStorage.instance
                                  .getSelectedCurrency()
                                  ?.symbol,
                            ).format(
                              LocalStorage.instance.getWalletData()?.price,
                            )
                          : AppHelpers.getTranslation(TrKeys.noWallet),
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w600,
                        fontSize: 13.sp,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                      ),
                    ),
                    6.horizontalSpace,
                    Icon(
                      FlutterRemix.link,
                      size: 18.r,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                    ),
                  ],
                ),
                // Icon(
                //   FlutterRemix.add_circle_fill,
                //   size: 20.r,
                //   color: AppColors.accentGreen,
                // ),
              ],
            ),
          ),
        ),
        8.horizontalSpace,
        Material(
          borderRadius: BorderRadius.circular(8.r),
          color: isDarkMode
              ? AppColors.dontHaveAnAccBackDark
              : AppColors.dontHaveAccBtnBack,
          child: InkWell(
            borderRadius: BorderRadius.circular(8.r),
            onTap: () => context.router.popAndPush(const SystemSettingsRoute()),
            child: Container(
              width: 50.r,
              height: 50.r,
              alignment: Alignment.center,
              child: Icon(
                FlutterRemix.settings_3_line,
                size: 22.r,
                color: isDarkMode ? AppColors.white : AppColors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
