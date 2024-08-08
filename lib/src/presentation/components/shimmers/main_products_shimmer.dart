import 'package:flutter/material.dart';

import 'product_grid_list_shimmer.dart';
import 'product_horizontal_list_shimmer.dart';
import '../../../core/constants/constants.dart';

class MainProductsShimmer extends StatelessWidget {
  final ListAlignment listAlignment;
  final ScrollPhysics physics;

  const MainProductsShimmer({
    Key? key,
    required this.listAlignment,
    this.physics = const BouncingScrollPhysics(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return listAlignment == ListAlignment.vertically
        ? ProductGridListShimmer(
            itemCount: 14,
            verticalPadding: 0,
            physics: physics,
          )
        : listAlignment == ListAlignment.horizontally
            ? ProductHorizontalListShimmer(
                itemCount: 14,
                physics: physics,
              )
            : ProductHorizontalListShimmer(
                height: 412,
                itemCount: 14,
                physics: physics,
              );
  }
}
