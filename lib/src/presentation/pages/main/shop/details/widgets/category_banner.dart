import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../models/data/category_data.dart';
import '../../../../../components/common_image.dart';
import '../../../../../theme/app_colors.dart';

class CategoryBanner extends ConsumerWidget {
  final List<CategoryData> categories;
  const CategoryBanner({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 10),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: [
          if (categories.length >= 4)
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: InkWell(
                onTap: () => context.pushRoute(
                  CategoryProductsRoute(
                    category: categories[4],
                    title: categories[4].translation?.title ?? "",
                  ),
                ),
                child: Stack(
                  children: [
                    CommonImage(
                      imageUrl: categories[4].img ?? "",
                      width: 345.w,
                      height: 192.h,
                      radius: 8,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      bottom: 14.r,
                      left: 12.r,
                      child: Text(
                        categories[4].translation?.title ?? "",
                        style: GoogleFonts.cairo(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -14 * 0.02,
                          color: AppColors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          if (categories.length >= 5)
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: InkWell(
                onTap: () => context.pushRoute(
                  CategoryProductsRoute(
                    category: categories[5],
                    title: categories[4].translation?.title ?? "",
                  ),
                ),
                child: Stack(
                  children: [
                    CommonImage(
                      imageUrl: categories[5].img ?? "",
                      width: 345.w,
                      height: 192.h,
                      radius: 8,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      bottom: 14.r,
                      left: 12.r,
                      child: Text(
                        categories[5].translation?.title ?? "",
                        style: GoogleFonts.cairo(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -14 * 0.02,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          if (categories.length >= 7)
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: InkWell(
                onTap: () => context.pushRoute(
                  CategoryProductsRoute(
                    category: categories[6],
                    title: categories[4].translation?.title ?? "",
                  ),
                ),
                child: Stack(
                  children: [
                    CommonImage(
                      imageUrl: categories[6].img ?? "",
                      width: 168.w,
                      height: 192.h,
                      radius: 8,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      bottom: 14.r,
                      left: 12.r,
                      child: Text(
                        categories[6].translation?.title ?? "",
                        style: GoogleFonts.cairo(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -14 * 0.02,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          if (categories.length >= 7)
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: InkWell(
                onTap: () => context.pushRoute(
                  CategoryProductsRoute(
                    category: categories[7],
                    title: categories[7].translation?.title ?? "",
                  ),
                ),
                child: Stack(
                  children: [
                    CommonImage(
                      imageUrl: categories[7].img ?? "",
                      width: 168.w,
                      height: 192.h,
                      radius: 8,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      bottom: 14.r,
                      left: 12.r,
                      child: Text(
                        categories[7].translation?.title ?? "",
                        style: GoogleFonts.cairo(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -14 * 0.02,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          if (categories.length >= 9)
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: InkWell(
                onTap: () => context.pushRoute(
                  CategoryProductsRoute(
                    category: categories[8],
                    title: categories[8].translation?.title ?? "",
                  ),
                ),
                child: Stack(
                  children: [
                    CommonImage(
                      imageUrl: categories[8].img ?? "",
                      width: 168.w,
                      height: 192.h,
                      radius: 8,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      bottom: 14.r,
                      left: 12.r,
                      child: Text(
                        categories[8].translation?.title ?? "",
                        style: GoogleFonts.cairo(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -14 * 0.02,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          if (categories.length >= 9)
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: InkWell(
                onTap: () => context.pushRoute(
                  CategoryProductsRoute(
                    category: categories[9],
                    title: categories[9].translation?.title ?? "",
                  ),
                ),
                child: Stack(
                  children: [
                    CommonImage(
                      imageUrl: categories[9].img ?? "",
                      width: 168.w,
                      height: 192.h,
                      radius: 8,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      bottom: 14.r,
                      left: 12.r,
                      child: Text(
                        categories[9].translation?.title ?? "",
                        style: GoogleFonts.cairo(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -14 * 0.02,
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
