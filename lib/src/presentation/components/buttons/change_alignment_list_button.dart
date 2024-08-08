import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/presentation/pages/main/shop/categories/products/riverpod/provider/category_products_provider.dart';

import '../../theme/theme.dart';
import '../../../core/utils/utils.dart';
import '../../../core/constants/constants.dart';

class ChangeAlignmentListButton extends ConsumerWidget {
  final ListAlignment alignment;
  final Function(ListAlignment alignment) onChange;

  const ChangeAlignmentListButton({
    Key? key,
    required this.alignment,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context , ref) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final notifier = ref.read(categoryProductsProvider.notifier);
    final state = ref.watch(categoryProductsProvider);
    final durations = Duration(milliseconds: state.isChangeTab ?  350 : 250 );
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 8.r),
      alignment: Alignment.center,
     // width: state.isChangeTab ? 120.w : 56.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: isDarkMode
              ? AppColors.white
              : AppColors.unselectedTab
        )
      ),
      duration: const Duration(milliseconds: 250),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              notifier.changeTabView();
              if (alignment == ListAlignment.singleBig) {
                return;
              }
              onChange(ListAlignment.singleBig);
            },
            child: AnimatedContainer(
              duration:  durations,
              width: alignment == ListAlignment.singleBig || state.isChangeTab ? 6.r : 0,
              height: alignment == ListAlignment.singleBig || state.isChangeTab  ? 17.r : 0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.r),
                color: alignment == ListAlignment.singleBig
                    ? isDarkMode
                        ? AppColors.white
                        : AppColors.black
                    : isDarkMode
                        ? AppColors.white.withOpacity(0.2)
                        : AppColors.black.withOpacity(0.2),
              ),
            ),
          ),
          if(state.isChangeTab)
            16.horizontalSpace,
          InkWell(
            onTap: () {
              notifier.changeTabView();
              if (alignment == ListAlignment.horizontally) {
                return;
              }
              onChange(ListAlignment.horizontally);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration:  durations,
                  width: alignment == ListAlignment.horizontally || state.isChangeTab  ? 17.r : 0,
                  height: alignment == ListAlignment.horizontally || state.isChangeTab  ? 6.r : 0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: alignment == ListAlignment.horizontally
                        ? isDarkMode
                            ? AppColors.white
                            : AppColors.black
                        : isDarkMode
                            ? AppColors.white.withOpacity(0.2)
                            : AppColors.black.withOpacity(0.2),
                  ),
                ),
                4.verticalSpace,
                AnimatedContainer(
                  duration: durations,
                  width: alignment == ListAlignment.horizontally || state.isChangeTab  ? 17.r : 0,
                  height: alignment == ListAlignment.horizontally || state.isChangeTab  ? 6.r : 0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: alignment == ListAlignment.horizontally
                        ? isDarkMode
                            ? AppColors.white
                            : AppColors.black
                        : isDarkMode
                            ? AppColors.white.withOpacity(0.2)
                            : AppColors.black.withOpacity(0.2),
                  ),
                ),
              ],
            ),
          ),
          if(state.isChangeTab)
            16.horizontalSpace,
          InkWell(
            onTap: () {
              notifier.changeTabView();
              if (alignment == ListAlignment.vertically) {
                return;
              }
              onChange(ListAlignment.vertically);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: durations,
                  width: alignment == ListAlignment.vertically || state.isChangeTab  ? 6.r : 0,
                  height: alignment == ListAlignment.vertically || state.isChangeTab  ? 17.r : 0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: alignment == ListAlignment.vertically
                        ? isDarkMode
                            ? AppColors.white
                            : AppColors.black
                        : isDarkMode
                            ? AppColors.white.withOpacity(0.2)
                            : AppColors.black.withOpacity(0.2),
                  ),
                ),
                if(alignment == ListAlignment.vertically || state.isChangeTab)
                  4.horizontalSpace,
                AnimatedContainer(
                  duration: durations,
                  width: alignment == ListAlignment.vertically || state.isChangeTab  ? 6.r : 0,
                  height: alignment == ListAlignment.vertically || state.isChangeTab  ? 17.r : 0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.r),
                    color: alignment == ListAlignment.vertically
                        ? isDarkMode
                            ? AppColors.white
                            : AppColors.black
                        : isDarkMode
                            ? AppColors.white.withOpacity(0.2)
                            : AppColors.black.withOpacity(0.2),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
