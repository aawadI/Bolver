import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/presentation/components/custom_tab_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import '../riverpod/provider/category_products_provider.dart';

class CategoryProductsFilterPage extends StatefulWidget {
  const CategoryProductsFilterPage({Key? key}) : super(key: key);

  @override
  State<CategoryProductsFilterPage> createState() =>
      _CategoryProductsFilterPageState();
}

class _CategoryProductsFilterPageState extends State<CategoryProductsFilterPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Scaffold(
      backgroundColor:
          isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      appBar: CommonAppBar(
        title: AppHelpers.getTranslation(TrKeys.filter),
        onLeadingPressed: context.popRoute,
        actions: [
          Consumer(
            builder: (context, ref, child) {
              return InkWell(
                onTap: ref.read(categoryProductsProvider.notifier).clearFilters,
                child: Row(
                  children: [
                    Text(
                      AppHelpers.getTranslation(TrKeys.clearAll),
                      style: GoogleFonts.cairo(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -1,
                        color: AppColors.red,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          16.horizontalSpace,
        ],
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Divider(height: 1.r, thickness: 1.r, color: AppColors.divider),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(categoryProductsProvider);
                  final event = ref.read(categoryProductsProvider.notifier);
                  return state.isFilterLoading
                      ? const Center(child: JumpingDots())
                      : SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              24.verticalSpace,
                              if (state.filterShops.isNotEmpty)
                                OpenModalButton(
                                  iconData: FlutterRemix.store_2_fill,
                                  title:
                                      '${AppHelpers.getTranslation(TrKeys.shops)} ${AppHelpers.getCheckedShops(state.shops).isEmpty ? '' : '(${AppHelpers.getCheckedShops(state.shops).length})'}',
                                  onTap: () => context
                                      .pushRoute(const FilterShopsRoute()),
                                ),
                              if (state.filterBrands.isNotEmpty)
                                Padding(
                                  padding: REdgeInsets.only(top: 8),
                                  child: OpenModalButton(
                                    iconData: FlutterRemix.apps_2_fill,
                                    title:
                                        '${AppHelpers.getTranslation(TrKeys.brands)} ${AppHelpers.getCheckedBrands(state.brands).isEmpty ? '' : '(${AppHelpers.getCheckedBrands(state.brands).length})'}',
                                    onTap: () =>
                                        context.pushRoute(FilterBrandsRoute()),
                                  ),
                                ),
                              8.verticalSpace,
                              ListView.builder(
                                itemCount: state.filterExtraGroups.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final group = state.filterExtraGroups[index];
                                  return Padding(
                                    padding: REdgeInsets.only(bottom: 8),
                                    child: OpenModalButton(
                                      iconData: FlutterRemix.equalizer_fill,
                                      title:
                                          '${group.translation?.title}  ${AppHelpers.getCheckedExtras(group.filterExtras).isEmpty ? '' : '(${AppHelpers.getCheckedExtras(group.filterExtras).length})'}',
                                      onTap: () => context.pushRoute(
                                          FilterExtrasRoute(
                                              index: index, extra: group)),
                                    ),
                                  );
                                },
                              ),
                              if (!state.isFilterLoading &&
                                  state.startPrice != 0 &&
                                  state.endPrice != 0 &&
                                  (state.startPrice != state.endPrice))
                                Padding(
                                  padding: REdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                    top: 32,
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            NumberFormat.currency(
                                              symbol: LocalStorage.instance
                                                  .getSelectedCurrency()
                                                  ?.symbol,
                                            ).format(state.filterRange.start),
                                          ),
                                          Text(
                                            NumberFormat.currency(
                                              symbol: LocalStorage.instance
                                                  .getSelectedCurrency()
                                                  ?.symbol,
                                            ).format(state.filterRange.end),
                                          ),
                                        ],
                                      ),
                                      16.verticalSpace,
                                      RangeSlider(
                                        activeColor: AppColors.accentGreen,
                                        inactiveColor: AppColors.divider,
                                        min: state.startPrice.toDouble(),
                                        max: state.endPrice.toDouble(),
                                        values: state.filterRange,
                                        onChanged: event.setRange,
                                      ),
                                      16.verticalSpace,
                                      CustomTabBar(
                                          tabController: _tabController,
                                          tabs: [
                                            Tab(
                                              text: AppHelpers.getTranslation(
                                                  TrKeys.byLowPrice),
                                            ),
                                            Tab(
                                              text: AppHelpers.getTranslation(
                                                  TrKeys.byHighPrice),
                                            )
                                          ]),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.only(left: 16, right: 16, bottom: 24),
        child: Consumer(
          builder: (context, ref, child) {
            return AccentLoginButton(
              title: AppHelpers.getTranslation(TrKeys.showResults),
              onPressed: () {
                final state = ref.watch(categoryProductsProvider);
                ref.read(categoryProductsProvider.notifier).filterProducts(
                      selectedBrands:
                          AppHelpers.getCheckedBrands(state.filterBrands),
                      selectedExtras: AppHelpers.getAllCheckedExtras(
                          state.filterExtraGroups),
                      sortPrice: _tabController.index == 1,
                    );
                context.popRoute();
              },
            );
          },
        ),
      ),
    );
  }
}
