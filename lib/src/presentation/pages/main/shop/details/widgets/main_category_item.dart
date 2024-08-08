import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../models/models.dart';
import '../../../../../../riverpod/provider/app_provider.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';

class MainCategoryItem extends ConsumerWidget {
  final CategoryData category;
  final int? index;

  const MainCategoryItem({Key? key, required this.category, this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(appProvider).isDarkMode;
    return Container(
      color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      width: 1.sw,
      padding: REdgeInsets.symmetric(horizontal: 15),
      margin: REdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          18.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${category.translation?.title}',
                style: GoogleFonts.cairo(
                  fontWeight: FontWeight.w500,
                  fontSize: 18.sp,
                  color: isDarkMode ? AppColors.white : AppColors.black,
                  letterSpacing: -14 * 0.02,
                ),
              ),
              ForgotTextButton(
                fontColor: isDarkMode ? AppColors.white : AppColors.black,
                title: AppHelpers.getTranslation(TrKeys.seeAll).toUpperCase(),
                onPressed: () =>
                    context.pushRoute(MoreCategoriesRoute(category: category)),
              ),
            ],
          ),
          30.verticalSpace,
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            primary: false,
            itemCount: AppHelpers.getSubCategoriesLength(
                category.children?.length ?? 0, index),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 168 / 200,
              mainAxisSpacing: 10.r,
              crossAxisSpacing: 9.r,
              crossAxisCount: 2,
              mainAxisExtent: 240.r,
            ),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final subCategory = category.children?[index];
              return Material(
                borderRadius: BorderRadius.circular(20.r),
                color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20.r),
                  onTap: () => context.pushRoute(
                    CategoryProductsRoute(
                      category: subCategory,
                      title: subCategory?.translation?.title ??
                          AppHelpers.getTranslation(TrKeys.noTitle),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    padding:
                        REdgeInsets.symmetric(vertical: 21, horizontal: 15),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CommonImage(
                          imageUrl: subCategory?.img,
                          width: 100,
                          height: 100,
                          radius: 50,
                          fit: BoxFit.fitWidth,
                        ),
                        32.verticalSpace,
                        Text(
                          subCategory?.translation?.title ??
                              AppHelpers.getTranslation(TrKeys.noTitle),
                          style: GoogleFonts.cairo(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                            letterSpacing: -14 * 0.02,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          27.verticalSpace,
        ],
      ),
    );
  }
}
