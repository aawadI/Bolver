import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../theme/theme.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../components/components.dart';
import '../../../../../../../../core/constants/constants.dart';
import '../../riverpod/provider/category_products_provider.dart';

class FilterBrandsPage extends ConsumerStatefulWidget {
  final int? shopId;
  const FilterBrandsPage({Key? key,this.shopId,}) : super(key: key);

  @override
  ConsumerState<FilterBrandsPage> createState() => _FilterBrandsPageState();
}

class _FilterBrandsPageState extends ConsumerState<FilterBrandsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(categoryProductsProvider.notifier).setFetchedBrands(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.mainBackDark : AppColors.white,
      appBar: CommonAppBar(
        title: AppHelpers.getTranslation(TrKeys.brands),
        onLeadingPressed: context.popRoute,
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(categoryProductsProvider);
          final event = ref.read(categoryProductsProvider.notifier);
          return Column(
            children: [
              Divider(thickness: 1.r, height: 1.r, color: AppColors.divider),
              SearchTextField(
                hintText: AppHelpers.getTranslation(TrKeys.search),
                onChanged: event.searchBrand,
              ),
              Divider(thickness: 1.r, height: 1.r, color: AppColors.divider),
              Expanded(
                child: Padding(
                  padding: REdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.filterBrands.length,
                    itemBuilder: (context, index) {
                      final brand = state.filterBrands[index];
                      return FilterItem(
                        isSelected: brand.isCheckedForFilter ?? false,
                        title: '${brand.title}',
                        onTap: () => event.toggleBrand(index),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: REdgeInsets.only(bottom: 24, left: 16, right: 16),
        child: AccentLoginButton(
          title: AppHelpers.getTranslation(TrKeys.save),
          onPressed: context.popRoute,
        ),
      ),
    );
  }
}
