import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/constants.dart';
import '../../core/routes/app_router.gr.dart';
import '../../core/utils/utils.dart';
import '../../models/models.dart';
import '../theme/theme.dart';
import 'list_items/search_suggestion_item.dart';
import 'physics/bouncing_physics.dart';
import 'shimmers/new_product_search_shimmer.dart';

class NewProductSearchBody extends StatelessWidget {
  final bool isSearchLoading;
  final String query;
  final List<ProductData> products;
  final List<ShopData> shops;
  final List<BrandData> brands;
  final List<CategoryData> categories;
  final bool hasShops;
  final bool hasCategories;
  final bool hasBrands;
  final bool hasProducts;

  const NewProductSearchBody({
    Key? key,
    required this.isSearchLoading,
    required this.query,
    this.shops = const [],
    this.brands = const [],
    this.categories = const [],
    this.products = const [],
    this.hasShops = true,
    this.hasCategories = true,
    this.hasBrands = true,
    this.hasProducts = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return isSearchLoading
        ? NewProductSearchShimmer(
            hasShops: hasShops,
            hasCategories: hasCategories,
            hasBrands: hasBrands,
            hasProducts: hasProducts,
          )
        : Container(
            color:
                isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
            child: ListView(
              physics: const CustomBouncingScrollPhysics(),
              padding: REdgeInsets.symmetric(horizontal: 16),
              children: [
                20.verticalSpace,
                if (shops.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppHelpers.getTranslation(TrKeys.shops).toUpperCase(),
                        style: GoogleFonts.cairo(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          letterSpacing: -14 * 0.01,
                        ),
                      ),
                      1.verticalSpace,
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: shops.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          final shop = shops[index];
                          final isLast = index == shops.length - 1;
                          return SearchSuggestionItem(
                            title: shop.translation?.title ??
                                AppHelpers.getTranslation(TrKeys.noTitle),
                            isLast: isLast,
                            query: query,
                            onTap: () => context.pushRoute(
                              SingleShopRoute(shop: shop),
                            ),
                          );
                        },
                      ),
                      16.verticalSpace,
                    ],
                  ),
                if (categories.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppHelpers.getTranslation(TrKeys.categories)
                            .toUpperCase(),
                        style: GoogleFonts.cairo(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          letterSpacing: -14 * 0.01,
                        ),
                      ),
                      1.verticalSpace,
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: categories.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          final isLast = index == categories.length - 1;
                          return SearchSuggestionItem(
                            title: category.translation?.title ??
                                AppHelpers.getTranslation(TrKeys.noTitle),
                            isLast: isLast,
                            query: query,
                            onTap: () => context.pushRoute(
                              CategoryProductsRoute(
                                category: category,
                                title: category.translation?.title ??
                                    AppHelpers.getTranslation(TrKeys.noTitle),
                              ),
                            ),
                          );
                        },
                      ),
                      16.verticalSpace,
                    ],
                  ),
                if (brands.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppHelpers.getTranslation(TrKeys.brands).toUpperCase(),
                        style: GoogleFonts.cairo(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode ? AppColors.white : AppColors.black,
                          letterSpacing: -14 * 0.01,
                        ),
                      ),
                      1.verticalSpace,
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: brands.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          final brand = brands[index];
                          final isLast = index == brands.length - 1;
                          return SearchSuggestionItem(
                            title: brand.title ??
                                AppHelpers.getTranslation(TrKeys.noTitle),
                            isLast: isLast,
                            query: query,
                            onTap: () => context
                                .pushRoute(BrandDetailsRoute(brand: brand)),
                          );
                        },
                      ),
                      16.verticalSpace,
                    ],
                  ),
                (products.isEmpty &&
                        brands.isEmpty &&
                        shops.isEmpty &&
                        categories.isEmpty)
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 168.r,
                              height: 168.r,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                color: isDarkMode
                                    ? AppColors.mainBackDark
                                    : AppColors.mainBack,
                              ),
                              alignment: Alignment.center,
                              child: Image.asset(
                                AppAssets.pngNoSearchResult,
                                width: 79.r,
                                height: 144.r,
                                fit: BoxFit.cover,
                              ),
                            ),
                            14.verticalSpace,
                            Text(
                              AppHelpers.getTranslation(TrKeys.noSearchResults),
                              style: GoogleFonts.cairo(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -14 * 0.02,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      )
                    : (products.isEmpty
                        ? const SizedBox.shrink()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppHelpers.getTranslation(TrKeys.products)
                                    .toUpperCase(),
                                style: GoogleFonts.cairo(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: isDarkMode
                                      ? AppColors.white
                                      : AppColors.black,
                                  letterSpacing: -14 * 0.01,
                                ),
                              ),
                              1.verticalSpace,
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: products.length,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  final product = products[index];
                                  final isLast = index == products.length - 1;
                                  return SearchSuggestionItem(
                                    title: product.translation?.title ??
                                        AppHelpers.getTranslation(
                                            TrKeys.noTitle),
                                    isLast: isLast,
                                    query: query,
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      context.pushRoute(
                                        ProductRoute(uuid: product.uuid ?? ''),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          )),
                80.verticalSpace,
              ],
            ),
          );
  }
}
