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

class MainCategoryHorizontalItem extends ConsumerWidget {
  final List<CategoryData> categoryData;
  const MainCategoryHorizontalItem({Key? key, required this.categoryData})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(appProvider).isDarkMode;
    final category = categoryData[6];
    return Container(
      decoration: BoxDecoration(
          color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          boxShadow: [
            BoxShadow(
                color: const Color(0xff000000).withOpacity(0.1),
                offset: const Offset(0, 2),
                blurRadius: 10)
          ]),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 15.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
                  const Spacer(),
                  ForgotTextButton(
                    fontColor: isDarkMode ? AppColors.white : AppColors.black,
                    title:
                        AppHelpers.getTranslation(TrKeys.seeAll).toUpperCase(),
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
              30.verticalSpace,
              SizedBox(
                height: 120.h,
                child: ListView.builder(
                    itemCount: category.children?.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final subCategory = category.children?[index];
                      return Container(
                        margin: EdgeInsets.only(left: 5.r, right: 25.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: isDarkMode
                              ? AppColors.mainBackDark
                              : AppColors.white,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20.r),
                          onTap: () => context.pushRoute(
                            CategoryProductsRoute(
                                category: subCategory,
                                title: subCategory?.translation?.title ?? ""),
                          ),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: isDarkMode
                                      ? AppColors.mainBackDark
                                      : AppColors.mainBack,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                padding: REdgeInsets.symmetric(vertical: 10),
                                alignment: Alignment.center,
                                child: CommonImage(
                                  fit: BoxFit.contain,
                                  imageUrl: subCategory?.img,
                                  width: 84.w,
                                  height: 56.h,
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
                                    color: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                    letterSpacing: -14 * 0.02,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          )),
    );
  }
}
