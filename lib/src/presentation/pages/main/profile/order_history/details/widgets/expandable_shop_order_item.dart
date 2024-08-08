import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_product_item.dart';
import '../../../../../../theme/theme.dart';
import '../../../../../../../models/models.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';

class ExpandableShopOrderItem extends StatelessWidget {
  final ShopOrderDetails orderDetails;

  const ExpandableShopOrderItem({Key? key, required this.orderDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return CustomExpansionTile(
      orderDetails: orderDetails,
      initiallyExpanded: true,
      child: Container(
        padding: REdgeInsets.symmetric(horizontal: 15, vertical: 20),
        color: isDarkMode ? AppColors.mainBackDark : AppColors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const CustomBouncingScrollPhysics(),
              itemCount: orderDetails.orderStocks?.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => OrderProductItemWidget(
                stock: orderDetails.orderStocks?[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
