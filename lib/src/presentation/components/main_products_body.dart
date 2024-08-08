import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/constants.dart';
import '../../core/routes/app_router.gr.dart';
import '../../core/utils/utils.dart';
import '../../models/models.dart';
import '../theme/theme.dart';
import 'list_items/big_product_item.dart';
import 'list_items/product_grid_item.dart';
import 'list_items/product_horizontal_item.dart';

class MainProductsBody extends StatelessWidget {
  final ListAlignment listAlignment;
  final List<ProductData> products;
  final ValueSetter<int?> onLikeTap;
  final ScrollPhysics physics;

  const MainProductsBody({
    Key? key,
    required this.listAlignment,
    required this.products,
    required this.onLikeTap,
    this.physics = const BouncingScrollPhysics(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return products.isNotEmpty
        ? listAlignment == ListAlignment.vertically
            ? GridView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: products.length,
                physics: physics,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 168 / 272,
                  mainAxisSpacing: 16.r,
                  crossAxisSpacing: 9.r,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => ProductGridItem(
                  product: products[index],
                  onTap: () => context.pushRoute(
                    ProductRoute(uuid: products[index].uuid ?? ''),
                  ),
                  onLikeTap: () => onLikeTap(products[index].id),
                ),
              )
            : listAlignment == ListAlignment.horizontally
                ? ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: products.length,
                    physics: physics,
                    itemBuilder: (context, index) => ProductHorizontalItem(
                      product: products[index],
                      onLikePressed: () => onLikeTap(products[index].id),
                    ),
                  )
                : ListView.builder(
                    itemCount: products.length,
                    physics: physics,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) => BigProductItem(
                      product: products[index],
                      onLikePressed: () => onLikeTap(products[index].id),
                    ),
                  )
        : Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                170.verticalSpace,
                Container(
                  width: 142.r,
                  height: 142.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
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
                  '${AppHelpers.getTranslation(TrKeys.thereAreNoItemsInThe)} ${AppHelpers.getTranslation(TrKeys.products).toLowerCase()}',
                  style: GoogleFonts.cairo(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -14 * 0.02,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                ),
              ],
            ),
          );
  }
}
