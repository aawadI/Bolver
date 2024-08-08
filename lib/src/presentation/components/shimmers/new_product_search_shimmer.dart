import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';
import '../components.dart';

class NewProductSearchShimmer extends StatelessWidget {
  final bool hasShops;
  final bool hasBrands;
  final bool hasCategories;
  final bool hasProducts;

  const NewProductSearchShimmer({
    Key? key,
    required this.hasShops,
    required this.hasBrands,
    required this.hasCategories,
    required this.hasProducts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Container(
      color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      child: ListView(
        physics: const CustomBouncingScrollPhysics(),
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 0),
        shrinkWrap: true,
        children: [
          20.verticalSpace,
          if (hasShops)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppHelpers.getTranslation(TrKeys.shops).toUpperCase(),
                  style: GoogleFonts.cairo(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                ),
                1.verticalSpace,
                const SearchLocationListShimmer(
                  height: 46,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                ),
                16.verticalSpace,
              ],
            ),
          if (hasCategories)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppHelpers.getTranslation(TrKeys.categories).toUpperCase(),
                  style: GoogleFonts.cairo(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                ),
                1.verticalSpace,
                const SearchLocationListShimmer(
                  height: 46,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                ),
                16.verticalSpace,
              ],
            ),
          if (hasBrands)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppHelpers.getTranslation(TrKeys.brands).toUpperCase(),
                  style: GoogleFonts.cairo(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                ),
                1.verticalSpace,
                const SearchLocationListShimmer(
                  height: 46,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                ),
                16.verticalSpace,
              ],
            ),
          if (hasProducts)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppHelpers.getTranslation(TrKeys.products).toUpperCase(),
                  style: GoogleFonts.cairo(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                ),
                1.verticalSpace,
                const SearchLocationListShimmer(
                  height: 46,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 5,
                ),
              ],
            ),
          80.verticalSpace,
        ],
      ),
    );
  }
}
