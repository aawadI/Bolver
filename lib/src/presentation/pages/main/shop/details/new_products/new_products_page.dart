import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import '../riverpod/provider/home_visible_provider.dart';
import 'riverpod/provider/new_products_provider.dart';

class NewProductsPage extends ConsumerStatefulWidget {
  final int? shopId;
  final int? categoryID;
  final int? parentID;
  final String? title;
  const NewProductsPage(
      {Key? key, this.shopId, this.categoryID, this.parentID, this.title})
      : super(key: key);

  @override
  ConsumerState<NewProductsPage> createState() => _NewProductsPageState();
}

class _NewProductsPageState extends ConsumerState<NewProductsPage> {
  late ScrollController _scrollController;
  void listen() {
    final direction = _scrollController.position.userScrollDirection;
    if (direction == ScrollDirection.reverse) {
      ref.read(homeVisibleProvider.notifier).setScrollVisible(true);
    }
    if (direction == ScrollDirection.forward) {
      ref.read(homeVisibleProvider.notifier).setScrollVisible(false);
    }
    if (_scrollController.position.maxScrollExtent ==
        _scrollController.position.pixels) {
      ref.read(newProductsProvider.notifier).fetchMoreProducts(
          shopId: widget.shopId,
          categoryID: widget.categoryID,
          parentID: widget.parentID);
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(listen);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(newProductsProvider.notifier).initialFetchProducts(
          shopId: widget.shopId,
          categoryID: widget.categoryID,
          parentID: widget.parentID),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final state = ref.watch(newProductsProvider);
    final notifier = ref.read(newProductsProvider.notifier);
    final isLtr = LocalStorage.instance.getLangLtr();
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
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
              widget.title == null
                  ? AppHelpers.getTranslation(TrKeys.newProducts)
                  : widget.title ?? "",
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
        body: Column(
          children: [
            Consumer(builder: (context, ref, child) {
              final stateVisible = ref.watch(homeVisibleProvider);
              return AnimatedContainer(
                height: stateVisible.isVisible ? 0 : 40.r,
                duration: const Duration(milliseconds: 300),
                child: Row(
                  children: [
                    Expanded(
                      child: SearchTextField(
                        onChanged: notifier.setQuery,
                      ),
                    ),
                    ChangeAlignmentListButton(
                      alignment: state.listAlignment,
                      onChange: notifier.setListAlignment,
                    ),
                    16.horizontalSpace,
                  ],
                ),
              );
            }),
            state.isSearching
                ? Expanded(
                    child: NewProductSearchBody(
                      isSearchLoading: state.isSearchLoading,
                      products: state.searchedProducts,
                      query: state.query.trim(),
                      hasCategories: false,
                      hasShops: false,
                      hasBrands: false,
                    ),
                  )
                : Expanded(
                    child: ListView(
                      physics: const CustomBouncingScrollPhysics(),
                      shrinkWrap: true,
                      controller: _scrollController,
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
                                )
                              : MainProductsBody(
                                  listAlignment: state.listAlignment,
                                  products: state.products,
                                  onLikeTap: notifier.likeOrUnlikeProduct,
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
                            ),
                          ),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
