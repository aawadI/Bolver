import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import 'riverpod/provider/discounts_provider.dart';
import '../../../../../core/constants/constants.dart';

class DiscountProductsPage extends ConsumerStatefulWidget {
  final int? shopId;
  const DiscountProductsPage({Key? key,this.shopId,}) : super(key: key);

  @override
  ConsumerState<DiscountProductsPage> createState() =>
      _DiscountProductsPageState();
}

class _DiscountProductsPageState extends ConsumerState<DiscountProductsPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels) {
          ref.read(discountsProvider.notifier).fetchMoreProducts(shopId: widget.shopId);
        }
      },
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(discountsProvider.notifier).initialFetchProducts(shopId: widget.shopId),
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
    final state = ref.watch(discountsProvider);
    final event = ref.read(discountsProvider.notifier);
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDismisser(
        child: Scaffold(
          backgroundColor:
              isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          appBar: CommonAppBar(
            onLeadingPressed: context.popRoute,
            title: AppHelpers.getTranslation(TrKeys.discountProducts),
          ),
          body: Column(
            children: [
              Container(
                height: 1.r,
                color: isDarkMode
                    ? AppColors.white.withOpacity(0.5)
                    : AppColors.mainBack,
              ),
              Row(
                children: [
                  Expanded(
                    child: SearchTextField(
                      onChanged: event.setQuery,
                      hintText:
                          AppHelpers.getTranslation(TrKeys.searchProducts),
                    ),
                  ),
                  ChangeAlignmentListButton(
                    alignment: state.listAlignment,
                    onChange: event.setListAlignment,
                  ),
                  16.horizontalSpace,
                ],
              ),
              Divider(
                height: 0.r,
                thickness: 1.r,
                color: isDarkMode ? AppColors.mainBackDark : AppColors.mainBack,
              ),
              Expanded(
                child: state.isSearching
                    ? NewProductSearchBody(
                        isSearchLoading: state.isSearchLoading,
                        products: state.searchedProducts,
                        query: state.query.trim(),
                        hasShops: false,
                        hasCategories: false,
                        hasBrands: false,
                      )
                    : Padding(
                        padding: REdgeInsets.symmetric(horizontal: 15),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          controller: _scrollController,
                          child: Column(
                            children: [
                              10.verticalSpace,
                              state.isLoading
                                  ? MainProductsShimmer(
                                      listAlignment: state.listAlignment,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                    )
                                  : MainProductsBody(
                                      listAlignment: state.listAlignment,
                                      products: state.products,
                                      onLikeTap: event.likeOrUnlikeProduct,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                    ),
                              if (state.isMoreLoading)
                                MainProductsShimmer(
                                  listAlignment: state.listAlignment,
                                  physics: const NeverScrollableScrollPhysics(),
                                ),
                            ],
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
