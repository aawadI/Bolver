import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../core/utils/app_helpers.dart';
import '../../../../../../core/utils/local_storage.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/app_colors.dart';
import '../riverpod/provider/home_all_product_provider.dart';

class AllProductsInShopDetails extends ConsumerWidget {
  const AllProductsInShopDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final state = ref.watch(homeAllProductsProvider);
    final event = ref.read(homeAllProductsProvider.notifier);
    return Container(
      color: isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      child: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index].product;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    18.verticalSpace,
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 260.w,
                            child: Text(
                              state.products[index].translation?.title ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.cairo(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                                letterSpacing: -14 * 0.02,
                              ),
                            ),
                          ),
                          ForgotTextButton(
                            title: AppHelpers.getTranslation(TrKeys.seeAll),
                            fontSize: 12.sp,
                            fontColor:
                                isDarkMode ? AppColors.white : AppColors.black,
                            onPressed: () {
                              context.pushRoute(CategoryProductsRoute(
                                  category: state
                                      .products[index].product?.first.category,
                                  title: state
                                          .products[index].translation?.title ??
                                      ''));
                            },
                          ),
                        ],
                      ),
                    ),
                    20.verticalSpace,
                    state.isLoading
                        ? const SearchProductListShimmer(
                            height: 320,
                            horizontalPadding: 15,
                          )
                        : product?.isNotEmpty ?? false
                            ? SizedBox(
                                height: 323.r,
                                child: ListView.builder(
                                  physics: const CustomBouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: product?.length,
                                  padding:
                                      REdgeInsets.symmetric(horizontal: 15),
                                  itemBuilder: (context, index) =>
                                      ProductItemWidget(
                                    product: product?[index],
                                    onLikePressed: () =>
                                        event.likeOrUnlikeProduct(
                                            product?[index].id),
                                  ),
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
                                    '${AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe)} ${AppHelpers.getTranslation(TrKeys.products).toLowerCase()}',
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
                              ),
                    20.verticalSpace,
                  ],
                );
              }),
          if (state.isMoreLoading)
            const SearchProductListShimmer(
              height: 320,
              horizontalPadding: 15,
            )
        ],
      ),
    );
  }
}
