import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import '../riverpod/provider/single_shop_brands_provider.dart';

class SingleShopBrands extends StatelessWidget {
  final VoidCallback onSeeAllPressed;

  const SingleShopBrands({Key? key, required this.onSeeAllPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Container(
      color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          18.verticalSpace,
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppHelpers.getTranslation(TrKeys.brands).toUpperCase(),
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                    letterSpacing: -14 * 0.02,
                  ),
                ),
                ForgotTextButton(
                  title: AppHelpers.getTranslation(TrKeys.seeAll),
                  fontSize: 12.sp,
                  fontColor: isDarkMode ? AppColors.white : AppColors.black,
                  onPressed: onSeeAllPressed,
                ),
              ],
            ),
          ),
          20.verticalSpace,
          Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(singleShopBrandsProvider);
              return ref.watch(singleShopBrandsProvider).isLoading
                  ? const SearchProductListShimmer(
                      height: 132,
                      width: 132,
                      horizontalPadding: 15,
                    )
                  : state.brands.isNotEmpty
                      ? SizedBox(
                          height: 132.r,
                          child: ListView.builder(
                            physics: const CustomBouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: state.brands.length,
                            padding: REdgeInsets.symmetric(horizontal: 15),
                            itemBuilder: (context, index) =>
                                BrandItem(brand: state.brands[index]),
                          ),
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 110.r,
                              height: 110.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: isDarkMode
                                    ? AppColors.mainBackDark
                                    : AppColors.mainBack,
                              ),
                              alignment: Alignment.center,
                              child: Image.asset(
                                AppAssets.pngNoViewedProducts,
                                width: 77.r,
                                height: 50.r,
                                fit: BoxFit.cover,
                              ),
                            ),
                            14.verticalSpace,
                            Text(
                              '${AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe)} ${AppHelpers.getTranslation(TrKeys.brands).toLowerCase()}',
                              style: GoogleFonts.cairo(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -14 * 0.02,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ],
                        );
            },
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
