// class CategoryProductsBody extends ConsumerWidget {
//   final ScrollController? scrollController;
//   final RefreshController refreshController;
//   final CategoryData? category;
//
//   const CategoryProductsBody({
//     Key? key,
//     required this.scrollController,
//     required this.refreshController,
//     this.category,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(categoryProductsProvider);
//     final notifier = ref.read(categoryProductsProvider.notifier);
//     final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
//     return SmartRefresher(
//       enablePullUp: true,
//       enablePullDown: false,
//       controller: refreshController,
//       scrollController: scrollController,
//       onLoading: () {
//         ref
//             .read(categoryProductsProvider.notifier)
//             .fetchMoreProducts(refreshController);
//       },
//       child: SingleChildScrollView(
//         physics: const BouncingScrollPhysics(),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 54.r,
//               color: isDarkMode
//                   ? AppColors.dontHaveAnAccBackDark
//                   : AppColors.white,
//               padding: REdgeInsets.only(top: 9, bottom: 9, right: 15),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: MainFilterButton(
//                       onTap: () => context
//                           .pushRoute(const CategoryProductsFilterRoute()),
//                     ),
//                   ),
//                   10.horizontalSpace,
//                   ChangeAlignmentListButton(
//                     alignment: state.listAlignment,
//                     onChange: notifier.setListAlignment,
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               height: 1.r,
//               color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
//             ),
//             (!state.isFilterLoading && state.filterCategories.isNotEmpty)
//                 ? Container(
//                     height: 54.r,
//                     width: 1.sw,
//                     decoration: BoxDecoration(
//                       color: isDarkMode
//                           ? AppColors.dontHaveAnAccBackDark
//                           : AppColors.white,
//                     ),
//                     child: DefaultTabController(
//                       length: state.filterCategories.length + 1,
//                       animationDuration: const Duration(milliseconds: 300),
//                       child: TabBar(
//                         indicatorSize: TabBarIndicatorSize.tab,
//                         indicatorColor:
//                             isDarkMode ? AppColors.white : AppColors.black,
//                         isScrollable: true,
//                         physics: const CustomBouncingScrollPhysics(),
//                         onTap: (index) {
//                           notifier.setChildCategory(
//                             index == 0
//                                 ? null
//                                 : state.filterCategories[index - 1],
//                           );
//                         },
//                         tabs: [
//                           Text(
//                             AppHelpers.getTranslation(TrKeys.all),
//                             style: GoogleFonts.cairo(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 13.sp,
//                               color: isDarkMode
//                                   ? AppColors.white
//                                   : AppColors.black,
//                               letterSpacing: -14 * 0.01,
//                             ),
//                           ),
//                           ...state.filterCategories
//                               .map(
//                                 (category) => Text(
//                                   '${category.translation?.title}',
//                                   style: GoogleFonts.cairo(
//                                     fontWeight: FontWeight.w500,
//                                     fontSize: 13.sp,
//                                     color: isDarkMode
//                                         ? AppColors.white
//                                         : AppColors.black,
//                                     letterSpacing: -14 * 0.01,
//                                   ),
//                                 ),
//                               )
//                               .toList()
//                         ],
//                       ),
//                     ),
//                   )
//                 : const SizedBox.shrink(),
//             16.verticalSpace,
//             Column(
//               children: [
//                 10.verticalSpace,
//                 Container(
//                   color: isDarkMode
//                       ? AppColors.dontHaveAnAccBackDark
//                       : AppColors.white,
//                   padding: REdgeInsets.only(left: 15, right: 15),
//                   child: state.isLoading
//                       ? MainProductsShimmer(
//                           listAlignment: state.listAlignment,
//                           physics: const NeverScrollableScrollPhysics(),
//                         )
//                       : MainProductsBody(
//                           listAlignment: state.listAlignment,
//                           onLikeTap: notifier.likeOrUnlikeProduct,
//                           products: state.products,
//                           physics: const NeverScrollableScrollPhysics(),
//                         ),
//                 ),
//                 if (state.isMoreLoading)
//                   Container(
//                     color: isDarkMode
//                         ? AppColors.dontHaveAnAccBackDark
//                         : AppColors.white,
//                     padding: REdgeInsets.symmetric(horizontal: 15),
//                     child: MainProductsShimmer(
//                       listAlignment: state.listAlignment,
//                       physics: const NeverScrollableScrollPhysics(),
//                     ),
//                   ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import '../riverpod/provider/category_products_provider.dart';

class CategoryProductsBody extends ConsumerWidget {
  final ScrollController? scrollController;
  final RefreshController refreshController;
  final CategoryData? category;

  const CategoryProductsBody({
    Key? key,
    required this.scrollController,
    required this.refreshController,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(categoryProductsProvider);
    final notifier = ref.read(categoryProductsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return SmartRefresher(
      enablePullUp: true,
      enablePullDown: false,
      controller: refreshController,
      scrollController: scrollController,
      onLoading: () {
        ref
            .read(categoryProductsProvider.notifier)
            .fetchMoreProducts(refreshController);
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 54.r,
              color: isDarkMode
                  ? AppColors.dontHaveAnAccBackDark
                  : AppColors.white,
              padding: REdgeInsets.only(top: 9, bottom: 9, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: MainFilterButton(
                      onTap: () => context
                          .pushRoute(const CategoryProductsFilterRoute()),
                    ),
                  ),
                  10.horizontalSpace,
                  ChangeAlignmentListButton(
                    alignment: state.listAlignment,
                    onChange: notifier.setListAlignment,
                  ),
                ],
              ),
            ),
            Container(
              height: 1.r,
              color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
            ),
            (!state.isFilterLoading && state.filterCategories.isNotEmpty)
                ? Container(
                    height: 54.r,
                    width: 1.sw,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? AppColors.dontHaveAnAccBackDark
                          : AppColors.white,
                    ),
                    child: DefaultTabController(
                      length: state.filterCategories.length + 1,
                      animationDuration: const Duration(milliseconds: 300),
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor:
                            isDarkMode ? AppColors.white : AppColors.black,
                        isScrollable: true,
                        physics: const CustomBouncingScrollPhysics(),
                        onTap: (index) {
                          notifier.setChildCategory(
                            index == 0
                                ? null
                                : state.filterCategories[index - 1],
                          );
                        },
                        tabs: [
                          Text(
                            AppHelpers.getTranslation(TrKeys.all),
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              letterSpacing: -14 * 0.01,
                            ),
                          ),
                          ...state.filterCategories
                              .map(
                                (category) => Text(
                                  '${category.translation?.title}',
                                  style: GoogleFonts.cairo(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13.sp,
                                    color: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                    letterSpacing: -14 * 0.01,
                                  ),
                                ),
                              )
                              .toList()
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            16.verticalSpace,
            Column(
              children: [
                10.verticalSpace,
                Container(
                  color: isDarkMode
                      ? AppColors.dontHaveAnAccBackDark
                      : AppColors.white,
                  padding: REdgeInsets.only(left: 15, right: 15),
                  child: state.isLoading
                      ? MainProductsShimmer(
                          listAlignment: state.listAlignment,
                          physics: const NeverScrollableScrollPhysics(),
                        )
                      : MainProductsBody(
                          listAlignment: state.listAlignment,
                          onLikeTap: notifier.likeOrUnlikeProduct,
                          products: state.products, // Filtered products
                          physics: const NeverScrollableScrollPhysics(),
                        ),
                ),
                if (state.isMoreLoading)
                  Container(
                    color: isDarkMode
                        ? AppColors.dontHaveAnAccBackDark
                        : AppColors.white,
                    padding: REdgeInsets.symmetric(horizontal: 15),
                    child: MainProductsShimmer(
                      listAlignment: state.listAlignment,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
