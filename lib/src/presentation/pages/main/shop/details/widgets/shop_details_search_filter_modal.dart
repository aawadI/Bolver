import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import '../riverpod/provider/home_categories_provider.dart';
import '../riverpod/provider/shop_details_search_filter_provider.dart';

class ShopDetailsSearchFilterModal extends StatelessWidget {
  const ShopDetailsSearchFilterModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            8.verticalSpace,
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
            16.verticalSpace,
            Expanded(
              child: SingleChildScrollView(
                physics: const CustomBouncingScrollPhysics(),
                child: Consumer(builder: (context, ref, child) {
                  final state = ref.watch(shopDetailsSearchFilterProvider);
                  final categoriesState = ref.watch(homeCategoriesProvider);
                  final event =
                      ref.read(shopDetailsSearchFilterProvider.notifier);
                  final categoriesEvent =
                      ref.read(homeCategoriesProvider.notifier);
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppHelpers.getTranslation(TrKeys.filter)
                                .toUpperCase(),
                            style: GoogleFonts.cairo(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                            ),
                          ),
                          ForgotTextButton(
                            title: AppHelpers.getTranslation(TrKeys.clearAll),
                            fontSize: 14.sp,
                            fontColor: isDarkMode
                                ? AppColors.dragElementDark
                                : AppColors.black,
                            onPressed: event.clearFilters,
                          ),
                        ],
                      ),
                      26.verticalSpace,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: isDarkMode
                                ? AppColors.borderDark
                                : AppColors.newStoreDataBorder,
                            width: 1.r,
                          ),
                        ),
                        padding:
                            REdgeInsets.symmetric(horizontal: 15, vertical: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppHelpers.getTranslation(TrKeys.categories),
                                  style: GoogleFonts.cairo(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                    letterSpacing: -14 * 0.02,
                                  ),
                                ),
                              ],
                            ),
                            24.verticalSpace,
                            categoriesState.isLoading
                                ? const JumpingDots(radius: 5)
                                : categoriesState.categories.isEmpty
                                    ? Center(
                                        child: Text(
                                          AppHelpers.getTranslation(
                                              TrKeys.noCategories),
                                          style: GoogleFonts.cairo(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -14 * 0.02,
                                            color: isDarkMode
                                                ? AppColors.white
                                                : AppColors.black,
                                          ),
                                        ),
                                      )
                                    : Wrap(
                                        spacing: 8.r,
                                        runSpacing: 10.r,
                                        children: categoriesState.categories
                                            .map(
                                              (category) => CategoryItemInModal(
                                                title:
                                                    '${category.translation?.title}',
                                                isSelected: categoriesState
                                                        .selectedCategoryId ==
                                                    category.id,
                                                onTap: () => categoriesEvent
                                                    .setSelectedCategoryId(
                                                  category.id ?? 0,
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      )
                          ],
                        ),
                      ),
                      16.verticalSpace,
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                            color: isDarkMode
                                ? AppColors.borderDark
                                : AppColors.newStoreDataBorder,
                            width: 1.r,
                          ),
                        ),
                        padding:
                            REdgeInsets.symmetric(horizontal: 15, vertical: 18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  AppHelpers.getTranslation(TrKeys.brands),
                                  style: GoogleFonts.cairo(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                    letterSpacing: -14 * 0.02,
                                  ),
                                ),
                              ],
                            ),
                            7.verticalSpace,
                            state.isLoading
                                ? const JumpingDots(radius: 5)
                                : ListView.builder(
                                    itemCount: state.brandCount,
                                    shrinkWrap: true,
                                    physics:
                                        const CustomBouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final brand = state.brands[index];
                                      return BrandFilterItem(
                                        isSelected:
                                            state.selectedBrandId == brand.id,
                                        brand: brand,
                                        isLast:
                                            state.brands.length - 1 == index,
                                        onTap: () =>
                                            event.setSelectedBrandId(brand.id),
                                      );
                                    },
                                  ),
                            (state.brands.length == state.brandCount)
                                ? const SizedBox.shrink()
                                : AccentLoginButton(
                                    onPressed: event.increaseBrandCount,
                                    title: AppHelpers.getTranslation(
                                        TrKeys.seeMore),
                                  )
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      AccentLoginButton(
                        onPressed: () {
                          // detailsEvent.searchProducts(
                          //   context,
                          //   brandId: state.selectedBrandId == 0
                          //       ? null
                          //       : state.selectedBrandId,
                          // );
                          context.popRoute();
                        },
                        title: AppHelpers.getTranslation(TrKeys.apply),
                        textColor:
                            isDarkMode ? AppColors.black : AppColors.white,
                        background:
                            isDarkMode ? AppColors.white : AppColors.black,
                      ),
                      40.verticalSpace,
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
