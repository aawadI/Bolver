import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../theme/theme.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../riverpod/provider/banner_details_provider.dart';
import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/routes/app_router.gr.dart';

class BannerDetailsBody extends ConsumerWidget {
  final String? imageUrl;

  const BannerDetailsBody({Key? key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bannerDetailsProvider);
    final notifier = ref.read(bannerDetailsProvider.notifier);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 1.r,
          color:
              isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.mainBack,
        ),
        Expanded(
          child: ListView(
            physics: const CustomBouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              10.verticalSpace,
              CommonImage(
                imageUrl: imageUrl,
                width: 1.sw,
                height: 140,
                radius: 0,
              ),
              10.verticalSpace,
              Container(
                color: isDarkMode
                    ? AppColors.dontHaveAnAccBackDark
                    : AppColors.white,
                padding: REdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: state.isLoading
                    ? const ProductGridListShimmer()
                    : state.listAlignment == ListAlignment.vertically
                        ? GridView.builder(
                            shrinkWrap: true,
                            primary: false,
                            itemCount: state.products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 168 / 272,
                              mainAxisSpacing: 30.r,
                              crossAxisSpacing: 9.r,
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              final product = state.products[index];
                              return ProductGridItem(
                                product: product,
                                onTap: () => context.pushRoute(
                                  ProductRoute(uuid: product.uuid ?? ''),
                                ),
                                onLikeTap: () =>
                                    notifier.likeOrUnlikeProduct(product.id),
                              );
                            },
                          )
                        : state.listAlignment == ListAlignment.horizontally
                            ? ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                itemCount: state.products.length,
                                itemBuilder: (context, index) {
                                  final product = state.products[index];
                                  return ProductHorizontalItem(
                                    product: product,
                                    onLikePressed: () => notifier
                                        .likeOrUnlikeProduct(product.id),
                                  );
                                },
                              )
                            : ListView.builder(
                                itemCount: state.products.length,
                                physics: const CustomBouncingScrollPhysics(),
                                padding: REdgeInsets.symmetric(vertical: 20),
                                shrinkWrap: true,
                                primary: false,
                                itemBuilder: (context, index) {
                                  final product = state.products[index];
                                  return BigProductItem(
                                    product: product,
                                    onLikePressed: () => notifier
                                        .likeOrUnlikeProduct(product.id),
                                  );
                                },
                              ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
