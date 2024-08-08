import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../theme/theme.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../components/components.dart';
import '../../../../../core/constants/constants.dart';
import 'riverpod/provider/viewed_products_provider.dart';

class ViewedProductsPage extends ConsumerStatefulWidget {
  final int? shopId;

  const ViewedProductsPage({
    Key? key,
    this.shopId,
  }) : super(key: key);

  @override
  ConsumerState<ViewedProductsPage> createState() => _ViewedProductsPageState();
}

class _ViewedProductsPageState extends ConsumerState<ViewedProductsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(viewedProductsProvider.notifier)
          .fetchViewedProducts(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(viewedProductsProvider);
    final notifier = ref.read(viewedProductsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return Directionality(
      textDirection: isLtr ? TextDirection.ltr : TextDirection.rtl,
      child: KeyboardDismisser(
        child: Scaffold(
          backgroundColor:
              isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          appBar: AppBarWithProductCount(
            title: AppHelpers.getTranslation(TrKeys.viewedProducts),
            count: state.viewedProducts.length,
            onSearchChanged: notifier.setQuery,
            listAlignment: state.listAlignment,
            onChangeListAlignment: notifier.setListAlignment,
            hasSearchFilter: false,
          ),
          body: state.isSearching
              ? NewProductSearchBody(
            isSearchLoading: state.isSearchLoading,
            products: state.searchedProducts,
            brands: state.brands,
            shops: state.shops,
            categories: state.categories,
            query: state.query.trim(),
          )
              : ListView(
                  physics: const CustomBouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    10.verticalSpace,
                    Container(
                      color: isDarkMode
                          ? AppColors.dontHaveAnAccBackDark
                          : AppColors.white,
                      padding:
                          REdgeInsets.symmetric(horizontal: 15, vertical: 20),
                      child: Consumer(
                        builder: (context, ref, child) {
                          final state = ref.watch(viewedProductsProvider);
                          final event =
                              ref.read(viewedProductsProvider.notifier);
                          return state.isViewedProductsLoading
                              ? MainProductsShimmer(
                                  listAlignment: state.listAlignment,
                                )
                              : MainProductsBody(
                                  listAlignment: state.listAlignment,
                                  products: state.viewedProducts,
                                  onLikeTap: event.likeOrUnlikeProduct,
                                );
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
