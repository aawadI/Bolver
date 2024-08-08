import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes/app_router.gr.dart';
import '../../../../../core/utils/app_helpers.dart';
import '../../../../../riverpod/provider/app_provider.dart';
import '../../../../components/components.dart';
import '../../../../theme/app_colors.dart';
import '../../profile/riverpod/provider/address_modal_provider.dart';
import '../../profile/widgets/addresses_modal.dart';
import '../../shop/categories/products/riverpod/provider/category_products_provider.dart';
import '../../shop/details/widgets/main_category_brand_item.dart';
import '../../shop/details/widgets/main_category_circle_item.dart';
import '../../shop/details/widgets/main_category_horizontal_item.dart';
import '../../shop/details/widgets/main_category_item.dart';
import '../../shop/details/widgets/shop_list_banners.dart';
import '../often_buy/riverpod/provider/often_buy_products_provider.dart';
import '../often_buy/widgets/often_buy_products_body.dart';
import '../shopList_riverpod/provider/shop_list_provider.dart';

class ShopListV2Page extends ConsumerStatefulWidget {
  const ShopListV2Page({Key? key}) : super(key: key);

  @override
  ConsumerState<ShopListV2Page> createState() => _ShopListV2PageState();
}

class _ShopListV2PageState extends ConsumerState<ShopListV2Page>
    with TickerProviderStateMixin {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(categoryProductsProvider.notifier).setFetchedBrands();
      ref.read(addressModalProvider.notifier).fetchLocalAddresses();
      ref.read(oftenBuyProductsProvider.notifier)
        ..fetchProducts(context)
        ..fetchCategories(context)
        ..fetchBrands(context);
      ref.read(shopListProvider.notifier)
        ..fetchBanners(
          checkYourNetwork: () {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
            );
          },
        )
        ..fetchCategories(
          checkYourNetwork: () {
            AppHelpers.showCheckFlash(
              context,
              AppHelpers.getTranslation(TrKeys.checkYourNetworkConnection),
            );
          },
        );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = ref.watch(appProvider).isDarkMode;
    final state = ref.watch(shopListProvider);
    final stateProduct = ref.watch(oftenBuyProductsProvider);
    final stateAddress = ref.watch(addressModalProvider);
    final appState = ref.watch(appProvider);
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: isDarkMode ? AppColors.mainBackDark : AppColors.white,
        body: SingleChildScrollView(
          physics: const CustomBouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.r),
            child: Column(
              children: [
                15.verticalSpace,
                Row(
                  children: [
                    InkWell(
                      onTap: () => context.pushRoute(const OrderRoute()),
                      child: Row(
                        children: [
                          Image.asset(
                            AppAssets.mainCart,
                            width: 28.w,
                            height: 28.r,
                            fit: BoxFit.contain,
                          ),
                          6.horizontalSpace,
                          Text(
                            AppHelpers.getTranslation(TrKeys.howDoYouWants),
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              letterSpacing: -14 * 0.02,
                            ),
                          ),
                          8.horizontalSpace,
                          const Icon(
                            FlutterRemix.arrow_down_s_line,
                          ),
                          12.horizontalSpace,
                          Container(
                            color: AppColors.black,
                            width: 1.w,
                            height: 28.h,
                          ),
                          8.horizontalSpace,
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () => AppHelpers.showCustomModalBottomSheet(
                        context: context,
                        modal: const AddressesModal(),
                        isDarkMode: appState.isDarkMode,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_rounded),
                          10.horizontalSpace,
                          SizedBox(
                            width: 50.w,
                            child: Text(
                              stateAddress.activeAddress,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.cairo(
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp,
                                letterSpacing: -14 * 0.01,
                                color: appState.isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                15.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      AppAssets.svgIcShopFilter,
                      width: 16.r,
                      height: 16.r,
                      theme: const SvgTheme(
                        currentColor: AppColors.black,
                      ),
                    ),
                    InkWell(
                        onTap: null,
                        child: Text(
                          AppHelpers.getTranslation(TrKeys.deals),
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color:
                                isDarkMode ? AppColors.white : AppColors.black,
                          ),
                        )),
                    InkWell(
                        onTap: () =>
                            context.router.push(const OftenBuyProductsRoute()),
                        child: Text(
                          AppHelpers.getTranslation(TrKeys.oftenBuy),
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: isDarkMode
                                ? AppColors.white
                                : AppColors.brandDescription,
                          ),
                        )),
                    InkWell(
                        onTap: () =>
                            context.router.push(const SavedStoresRoute()),
                        child: Text(
                          AppHelpers.getTranslation(TrKeys.saved),
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: isDarkMode
                                ? AppColors.white
                                : AppColors.brandDescription,
                          ),
                        )),
                    InkWell(
                        onTap: null,
                        child: Text(
                          AppHelpers.getTranslation(TrKeys.sell),
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                            color: isDarkMode
                                ? AppColors.white
                                : AppColors.brandDescription,
                          ),
                        ))
                  ],
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       child: OftenBuyButton(
                //         isDark: isDarkMode,
                //         icAsset: AppAssets.svgIcOftenBuy,
                //         onTap: () =>
                //             context.pushRoute(const OftenBuyProductsRoute()),
                //         title: AppHelpers.getTranslation(TrKeys.oftenBuy),
                //       ),
                //     ),
                //     1.horizontalSpace,
                //     Expanded(
                //       child: OftenBuyButton(
                //         isDark: isDarkMode,
                //         icAsset: AppAssets.svgIcProfitable,
                //         onTap: () =>
                //             context.pushRoute(const ProfitableProductsRoute()),
                //         title: AppHelpers.getTranslation(TrKeys.profitable),
                //       ),
                //     ),
                //   ],
                // ),
                15.verticalSpace,
                const ShopListBanners(),
                40.verticalSpace,
                state.categories.isNotEmpty
                    ? MainCategoryHorizontalItem(categoryData: state.categories)
                    : const SizedBox.shrink(),
                18.verticalSpace,
                Image.asset(
                  AppAssets.tempRoute,
                  width: double.infinity,
                  height: 135.r,
                  fit: BoxFit.cover,
                ),
                18.verticalSpace,
                state.categories.isNotEmpty
                    ? MainCategoryItem(category: state.categories[1])
                    : const SizedBox.shrink(),
                40.verticalSpace,
                Image.asset(
                  AppAssets.tempDisCount,
                  height: 125.r,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                40.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.newProducts),
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                        letterSpacing: -14 * 0.02,
                      ),
                    ),
                    ForgotTextButton(
                      fontColor: isDarkMode ? AppColors.white : AppColors.black,
                      title: AppHelpers.getTranslation(TrKeys.seeAll)
                          .toUpperCase(),
                      onPressed: () => null,
                    ),
                  ],
                ),
                20.verticalSpace,
                Image.asset(
                  AppAssets.tempNewProductBanner,
                  height: 660.r,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                30.verticalSpace,
                if (stateProduct.products.isNotEmpty)
                  const OftenBuyProductsBody(),
                state.categories.isNotEmpty
                    ? MainCategoryCircleItem(categoryData: state.categories)
                    : const SizedBox.shrink(),
                Image.asset(
                  AppAssets.tempGift,
                  height: 190.r,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                60.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.projectIdeas),
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                        letterSpacing: -14 * 0.02,
                      ),
                    ),
                    ForgotTextButton(
                      fontColor: isDarkMode ? AppColors.white : AppColors.black,
                      title: AppHelpers.getTranslation(TrKeys.seeAll)
                          .toUpperCase(),
                      onPressed: () => null,
                    ),
                  ],
                ),
                20.verticalSpace,
                Image.asset(
                  AppAssets.tempGroupShop,
                  height: 400.r,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                16.verticalSpace,
                Image.asset(
                  AppAssets.tempSupport,
                  height: 450.r,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                45.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.explorePopularBrands),
                      style: GoogleFonts.cairo(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                        color: isDarkMode ? AppColors.white : AppColors.black,
                        letterSpacing: -14 * 0.02,
                      ),
                    ),
                    ForgotTextButton(
                      fontColor: isDarkMode ? AppColors.white : AppColors.black,
                      title: AppHelpers.getTranslation(TrKeys.seeAll)
                          .toUpperCase(),
                      onPressed: () => context.pushRoute(const BrandsRoute()),
                    ),
                  ],
                ),
                20.verticalSpace,
                const MainCategoryBrandItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
