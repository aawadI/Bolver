import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../theme/theme.dart';
import 'riverpod/provider/often_buy_products_provider.dart';
import 'widgets/often_buy_products_body.dart';

class OftenBuyProductsPage extends ConsumerStatefulWidget {
  const OftenBuyProductsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OftenBuyProductsPage> createState() =>
      _OftenBuyProductsPageState();
}

class _OftenBuyProductsPageState extends ConsumerState<OftenBuyProductsPage> {
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels) {
          ref
              .read(oftenBuyProductsProvider.notifier)
              .fetchMoreProducts(context);
        }
      },
    );
    Future.delayed(
      Duration.zero,
      () {
        ref.read(oftenBuyProductsProvider.notifier).fetchProducts(context);
        ref.read(oftenBuyProductsProvider.notifier).fetchCategories(context);
        ref.read(oftenBuyProductsProvider.notifier).fetchBrands(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final state = ref.watch(oftenBuyProductsProvider);
    //final state = ref.watch(categoryProductsProvider);
    final notifier = ref.read(oftenBuyProductsProvider.notifier);
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
        appBar: CommonAppBar(
          onLeadingPressed: () => context.popRoute(),
          title: AppHelpers.getTranslation(TrKeys.oftenBuy),
        ),
        body: Column(
          children: [
            Container(
              height: 1.r,
              color: isDarkMode
                  ? AppColors.white.withOpacity(0.5)
                  : AppColors.mainBack,
            ),
            SearchTextField(
              onChanged: (value) => notifier.setQuery(value),
              hintText: AppHelpers.getTranslation(TrKeys.searchProducts),
              // suffixIcon: IconButton(
              //   splashRadius: 10,
              //   icon: Icon(
              //     FlutterRemix.equalizer_line,
              //     color: isDarkMode ? AppColors.white : AppColors.black,
              //     size: 18.r,
              //   ),
              //   onPressed: () {
              //     AppHelpers.showCustomModalBottomSheet(
              //       context: context,
              //       modal: const OftenBuyProductsSearchFilterModal(),
              //       isDarkMode: isDarkMode,
              //     );
              //   },
              // ),
            ),
            Divider(
              height: 0.r,
              thickness: 1.r,
              color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
            ),
            // Container(
            //   height: 54.r,
            //   color:
            //   isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
            //   padding: REdgeInsets.symmetric(
            //     horizontal: 15,
            //     vertical: 9,
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Expanded(
            //         child: MainFilterButton(
            //           onTap: () =>
            //               context.pushRoute(const CategoryProductsFilterRoute()),
            //         ),
            //       ),
            //       10.horizontalSpace,
            //       ChangeAlignmentListButton(
            //         alignment: state.listAlignment,
            //         onChange: notifier.setListAlignment,
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              height: 16.r,
              color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
            ),
            Expanded(
              child: state.isSearching
                  ? NewProductSearchBody(
                      isSearchLoading: state.isSearchLoading,
                      products: state.searchedProducts,
                      brands: state.brands,
                      shops: state.shops,
                      categories: state.categories,
                      query: state.query.trim(),
                    )
                  : Padding(
                      padding: REdgeInsets.symmetric(horizontal: 15),
                      child: state.isLoading
                          ? state.listAlignment == ListAlignment.vertically
                              ? const ProductGridListShimmer(
                                  itemCount: 14,
                                  verticalPadding: 20,
                                )
                              : state.listAlignment ==
                                      ListAlignment.horizontally
                                  ? const ProductHorizontalListShimmer(
                                      itemCount: 14,
                                      verticalPadding: 20,
                                    )
                                  : const ProductHorizontalListShimmer(
                                      height: 412,
                                      itemCount: 14,
                                      verticalPadding: 20,
                                    )
                          : state.products.isNotEmpty
                              ? ListView(
                                  controller: _scrollController,
                                  children: [
                                      const OftenBuyProductsBody(),
                                      state.isMoreLoading
                                          ? state.listAlignment ==
                                                  ListAlignment.vertically
                                              ? const ProductGridListShimmer(
                                                  itemCount: 14,
                                                  verticalPadding: 20,
                                                )
                                              : state.listAlignment ==
                                                      ListAlignment.horizontally
                                                  ? const ProductHorizontalListShimmer(
                                                      itemCount: 14,
                                                      verticalPadding: 20,
                                                    )
                                                  : const ProductHorizontalListShimmer(
                                                      height: 412,
                                                      itemCount: 14,
                                                      verticalPadding: 20,
                                                    )
                                          : const SizedBox.shrink()
                                    ])
                              : Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    170.verticalSpace,
                                    Container(
                                      width: 142.r,
                                      height: 142.r,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        color: isDarkMode
                                            ? AppColors.mainBackDark
                                            : AppColors.mainBack,
                                      ),
                                      alignment: Alignment.center,
                                      child: Image.asset(
                                        AppAssets.pngNoViewedProducts,
                                        width: 87.r,
                                        height: 60.r,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    14.verticalSpace,
                                    Text(
                                      '${AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe)} ${AppHelpers.getTranslation(TrKeys.mostSoldProducts).toLowerCase()}',
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
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
