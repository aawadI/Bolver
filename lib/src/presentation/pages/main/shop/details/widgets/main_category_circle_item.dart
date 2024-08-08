import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../core/utils/app_helpers.dart';
import '../../../../../../models/models.dart';
import '../../../../../../riverpod/provider/app_provider.dart';
import '../../../../../components/buttons/forgot_text_button.dart';
import '../../../../../components/common_image.dart';
import '../../../../../theme/app_colors.dart';
import '../../categories/riverpod/provider/categories_provider.dart';

class MainCategoryCircleItem extends ConsumerWidget {
  final List<CategoryData> categoryData;
  const MainCategoryCircleItem({Key? key, required this.categoryData})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = categoryData.isNotEmpty ? categoryData[2] : CategoryData();
    final bool isDarkMode = ref.watch(appProvider).isDarkMode;
    return Container(
      color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      width: 1.sw,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${category.translation?.title}',
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w600,
                    fontSize: 22.sp,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                    letterSpacing: -14 * 0.02,
                  ),
                ),
                ForgotTextButton(
                  fontColor: isDarkMode ? AppColors.white : AppColors.black,
                  title: AppHelpers.getTranslation(TrKeys.seeAll).toUpperCase(),
                  onPressed: () {
                    ref.read(appProvider.notifier).change(1);
                    ref
                        .read(categoriesProvider.notifier)
                        .selectId(category.id ?? 0);
                    context.pushRoute(const ShopMainRoute());
                  },
                ),
              ],
            ),
            20.verticalSpace,
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: false,
              itemCount: category.children?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 20.r,
                mainAxisExtent: 210.r,
                mainAxisSpacing: 40.r,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                final subCategory = category.children?[index];
                return InkWell(
                  onTap: () => context.pushRoute(
                    CategoryProductsRoute(
                        title: category.translation?.title ?? "",
                        category: category),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 170.h,
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? AppColors.mainBackDark
                              : AppColors.mainBack,
                          shape: BoxShape.circle,
                        ),
                        padding:
                            REdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        alignment: Alignment.center,
                        child: CommonImage(
                          fit: BoxFit.contain,
                          imageUrl: subCategory?.img,
                          width: 100.w,
                          height: 130.h,
                          radius: 0,
                        ),
                      ),
                      18.verticalSpace,
                      SizedBox(
                        width: 84.w,
                        child: Text(
                          '${subCategory?.translation?.title}',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.cairo(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                            letterSpacing: -14 * 0.02,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
