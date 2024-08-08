import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../riverpod/provider/app_provider.dart';
import '../../../../../components/common_image.dart';
import '../../../../../theme/app_colors.dart';
import '../../../shop_list/often_buy/riverpod/provider/often_buy_products_provider.dart';
import '../brands/riverpod/provider/brands_provider.dart';

class MainCategoryBrandItem extends ConsumerStatefulWidget {
  const MainCategoryBrandItem({Key? key}) : super(key: key);
  @override
  ConsumerState<MainCategoryBrandItem> createState() =>
      _MainCategoryBrandItemState();
}

class _MainCategoryBrandItemState extends ConsumerState<MainCategoryBrandItem> {
  @override
  void initState() {
    super.initState();
    ref.read(brandsProvider.notifier).initialFetchBrands();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = ref.watch(appProvider).isDarkMode;
    final state = ref.watch(oftenBuyProductsProvider);
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: state.brands.length > 4 ? 4 : state.brands.length,
        itemBuilder: (context, index) {
          final brand = state.brands[index];
          return Container(
            margin: EdgeInsets.only(bottom: 25.r),
            decoration: BoxDecoration(
                color: isDarkMode
                    ? AppColors.dontHaveAnAccBackDark
                    : AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff000000).withOpacity(0.1),
                    offset: const Offset(0, 2),
                    blurRadius: 10,
                  )
                ]),
            child: Column(
              children: [
                CommonImage(
                  imageUrl: brand.img,
                  width: double.infinity,
                  height: 430.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 25.h, horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('New Arrivals from DYSON!',
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                            letterSpacing: -14 * 0.02,
                          )),
                      18.verticalSpace,
                      Text('So many new style deals on brand you love!',
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp,
                            color: isDarkMode
                                ? AppColors.white
                                : AppColors.brandDescription,
                            letterSpacing: -14 * 0.02,
                          )),
                      30.verticalSpace,
                      InkWell(
                        onTap: () => context.pushRoute(
                          BrandDetailsRoute(brand: brand),
                        ),
                        child: Container(
                          height: 40.h,
                          width: 190.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.black)),
                          alignment: Alignment.center,
                          child: Text('Shop now',
                              style: GoogleFonts.cairo(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                                letterSpacing: -14 * 0.02,
                              )),
                        ),
                      ),
                      20.verticalSpace,
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
