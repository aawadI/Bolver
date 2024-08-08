import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/models/data/shop_data.dart';

import '../../../../../components/components.dart';
import '../riverpod/provider/order_provider.dart';
import 'cart_shop_item_widget.dart';
import 'total_order_calculations_widget.dart';

class CartProductsBody extends ConsumerWidget {
  const CartProductsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderProvider);
    ShopData? shopData;
    return SingleChildScrollView(
      physics: const CustomBouncingScrollPhysics(),
      primary: true,
      child: Column(
        children: [
          21.verticalSpace,
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: state.shopTotals.length,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final shopTotal = state.shopTotals[index];
              final shopID = state.shopTotals[index].cartProducts.first.shopID;
              for (var element in state.allShops) {
                if (element.id == shopID) {
                  shopData = element;
                }
              }
              return CartShopItemWidget(
                shopTotal: shopTotal,
                shopData: shopData,
              );
            },
          ),
          const TotalOrderCalculationsWidget(),
          99.verticalSpace,
        ],
      ),
    );
  }
}
