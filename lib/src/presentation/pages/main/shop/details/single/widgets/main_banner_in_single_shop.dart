import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import '../riverpod/provider/single_shop_provider.dart';
import 'single_shop_delivery_times_modal.dart';
import 'single_shop_info_modal.dart';

class MainBannerInSingleShop extends ConsumerWidget {
  const MainBannerInSingleShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(singleShopProvider);
    final notifier = ref.read(singleShopProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return SizedBox(
      height: 284.r,
      width: 1.sw,
      child: Stack(
        children: [
          CommonImage(
            imageUrl: state.shop?.backgroundImg,
            width: double.infinity,
            height: 284,
            radius: 0,
            errorRadius: 0,
          ),
          Container(
            height: 284.r,
            width: 1.sw,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.black.withOpacity(0),
                  AppColors.black.withOpacity(0.5)
                ],
              ),
            ),
          ),
          Padding(
            padding: REdgeInsets.only(left: 15, right: 15, bottom: 21),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60.r,
                          height: 60.r,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          alignment: Alignment.center,
                          child: CommonImage(
                            imageUrl: state.shop?.logoImg,
                            radius: 77,
                            errorRadius: 77,
                            width: 40,
                            height: 40,
                          ),
                        ),
                        10.horizontalSpace,
                        Text(
                          '${state.shop?.translation?.title}',
                          style: GoogleFonts.cairo(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                            letterSpacing: -14 * 0.02,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                19.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            FlutterRemix.information_line,
                            color: AppColors.accentGreen,
                            size: 16.r,
                          ),
                          8.horizontalSpace,
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                AppHelpers.showCustomModalBottomSheet(
                                  context: context,
                                  modal: SingleShopInfoModal(shop: state.shop),
                                  isDarkMode: isDarkMode,
                                );
                              },
                              child: Text(
                                AppHelpers.getTranslation(TrKeys.storeInfo),
                                style: GoogleFonts.cairo(
                                  fontSize: 12.sp,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                  letterSpacing: -14 * 0.01,
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    6.horizontalSpace,
                    Expanded(
                      child: InkWell(
                        onTap: () => AppHelpers.showCustomModalBottomSheet(
                          context: context,
                          modal: const SingleShopDeliveryTimesModal(),
                          isDarkMode: isDarkMode,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              FlutterRemix.truck_line,
                              color: AppColors.accentGreen,
                              size: 16.r,
                            ),
                            8.horizontalSpace,
                            Expanded(
                              child: Text(
                                AppHelpers.getTranslation(
                                    TrKeys.storeDeliveryTimes),
                                style: GoogleFonts.cairo(
                                  fontSize: 12.sp,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                  letterSpacing: -14 * 0.01,
                                ),
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    6.horizontalSpace,
                    Expanded(
                      child: InkWell(
                        onTap: notifier.saveOrDeleteStore,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              FlutterRemix.bookmark_3_line,
                              color: state.isSaved
                                  ? AppColors.accentGreen
                                  : AppColors.white,
                              size: 16.r,
                            ),
                            8.horizontalSpace,
                            Text(
                              state.isSaved
                                  ? AppHelpers.getTranslation(TrKeys.saved)
                                  : AppHelpers.getTranslation(TrKeys.save),
                              style: GoogleFonts.cairo(
                                fontSize: 12.sp,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500,
                                color: AppColors.white,
                                letterSpacing: -14 * 0.01,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
