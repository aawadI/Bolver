import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../theme/theme.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import 'riverpod/provider/brand_details_provider.dart';
import '../../../../../../../core/constants/constants.dart';

class BrandDetailsPage extends ConsumerStatefulWidget {
  final BrandData brand;

  const BrandDetailsPage({Key? key, required this.brand}) : super(key: key);

  @override
  ConsumerState<BrandDetailsPage> createState() => _BrandDetailsPageState();
}

class _BrandDetailsPageState extends ConsumerState<BrandDetailsPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(
      () {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels) {
          ref.read(brandDetailsProvider.notifier).fetchMoreProducts(widget.brand);
        }
      },
    );
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ref.read(brandDetailsProvider.notifier).fetchBrandDetails(widget.brand);
        ref
            .read(brandDetailsProvider.notifier)
            .initialFetchProducts(widget.brand);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(brandDetailsProvider);
    final notifier = ref.read(brandDetailsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor:
            isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
        appBar: AppBarWithProductCount(
          title:
              widget.brand.title ?? AppHelpers.getTranslation(TrKeys.noTitle),
          onSearchChanged: notifier.setQuery,
          hasSearchFilter: false,
          onChangeListAlignment: notifier.setListAlignment,
          listAlignment: state.listAlignment,
          count: state.productsCount,
        ),
        body: state.isSearching
            ? NewProductSearchBody(
                isSearchLoading: state.isSearchLoading,
                products: state.searchedProducts,
                query: state.query.trim(),
                hasBrands: false,
                hasShops: false,
                hasCategories: false,
              )
            : ListView(
                physics: const CustomBouncingScrollPhysics(),
                shrinkWrap: true,
                controller: _scrollController,
                children: [
                  10.verticalSpace,
                  CommonImage(
                    imageUrl: state.brand?.img,
                    height: 140,
                    radius: 0,
                    errorRadius: 0,
                  ),
                  10.verticalSpace,
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 16),
                    child: state.isProductsLoading
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
                      color: AppColors.white,
                      padding: REdgeInsets.symmetric(horizontal: 16),
                      child: MainProductsShimmer(
                        listAlignment: state.listAlignment,
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
