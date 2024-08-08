import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/presentation/pages/main/shop/details/riverpod/provider/home_visible_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../models/models.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import 'riverpod/provider/category_products_provider.dart';
import 'riverpod/provider/category_products_scroll_provider.dart';
import 'widgets/category_products_body.dart';

class CategoryProductsPage extends ConsumerStatefulWidget {
  final CategoryData? category;
  final String title;

  const CategoryProductsPage({Key? key, this.category, required this.title})
      : super(key: key);

  @override
  ConsumerState<CategoryProductsPage> createState() =>
      _CategoryProductsPageState();
}

class _CategoryProductsPageState extends ConsumerState<CategoryProductsPage> {
  late RefreshController _refreshController;
  late ScrollController _scrollController;

  void listen() {
    final direction = _scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.reverse) {
      ref.read(categoryProductsScrollProvider.notifier).setScrollVisible(true);
      ref.read(homeVisibleProvider.notifier).setScrollVisible(true);
    } else if (direction == ScrollDirection.forward) {
      ref.read(categoryProductsScrollProvider.notifier).setScrollVisible(false);
      ref.read(homeVisibleProvider.notifier).setScrollVisible(false);
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(listen);
    _refreshController = RefreshController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(homeVisibleProvider.notifier).setScrollVisible(false);
        ref
            .read(categoryProductsProvider.notifier)
            .initialFetchProducts(widget.category);
        ref
            .read(categoryProductsProvider.notifier)
            .fetchCategoryFilters(widget.category);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(listen);
    _scrollController.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoryProductsProvider);
    final notifier = ref.read(categoryProductsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final isLtr = LocalStorage.instance.getLangLtr();
    return KeyboardDismisser(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor:
              isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          leading: IconButton(
            splashRadius: 20.r,
            icon: Icon(
              isLtr
                  ? FlutterRemix.arrow_left_s_line
                  : FlutterRemix.arrow_right_s_line,
              size: 24.r,
              color: isDarkMode ? AppColors.white : AppColors.black,
            ),
            onPressed: context.popRoute,
          ),
          title: SizedBox(
            width: 212.w,
            child: Text(
              widget.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
                letterSpacing: -0.7,
                color: isDarkMode ? AppColors.white : AppColors.black,
              ),
            ),
          ),
        ),
        backgroundColor:
            isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Consumer(builder: (context, ref, child) {
                final stateVisible = ref.watch(homeVisibleProvider);
                return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    child: Column(
                      children: [
                        Container(
                          height: 1.r,
                          color: isDarkMode
                              ? AppColors.white.withOpacity(0.5)
                              : AppColors.mainBack,
                        ),
                        SearchTextField(
                          isVisible: !stateVisible.isVisible,
                          onChanged: notifier.setQuery,
                        ),
                        Container(
                          height: 1.r,
                          color: isDarkMode
                              ? AppColors.white.withOpacity(0.5)
                              : AppColors.mainBack,
                        ),
                      ],
                    ));
              }),
              state.isSearching
                  ? Expanded(
                      child: NewProductSearchBody(
                        isSearchLoading: state.isSearchLoading,
                        products: state.searchedProducts,
                        shops: state.searchedShops,
                        brands: state.searchedBrands,
                        categories: state.searchedCategories,
                        query: state.query.trim(),
                        hasShops: false,
                        hasCategories: false,
                        hasBrands: false,
                      ),
                    )
                  : Expanded(
                      child: CategoryProductsBody(
                        refreshController: _refreshController,
                        scrollController: _scrollController,
                        category: widget.category,
                      ),
                    ),
            ],
          ),
        ),
        floatingActionButton: Consumer(builder: (context, ref, child) {
          return ref.watch(categoryProductsScrollProvider).isVisible
              ? Transform.scale(
                  scale: 0.85, //
                  child: FloatingActionButton(
                    backgroundColor: AppColors.mainBackDark,
                    child: Icon(
                      FlutterRemix.arrow_up_s_line,
                      size: 24.r,
                      color: AppColors.white,
                    ),
                    onPressed: () => _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeIn,
                    ),
                  ),
                )
              : const SizedBox.shrink();
        }),
      ),
    );
  }
}
