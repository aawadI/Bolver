import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/utils/utils.dart';
import '../../../../../../models/models.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import 'category_tab_body.dart';

class TabBarViewCategories extends ConsumerStatefulWidget {
  final List<CategoryData> categories;

  const TabBarViewCategories({Key? key, required this.categories})
      : super(key: key);

  @override
  ConsumerState<TabBarViewCategories> createState() =>
      _TabBarViewCategoriesState();
}

class _TabBarViewCategoriesState extends ConsumerState<TabBarViewCategories>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.categories.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 54.r,
          width: 1.sw,
          decoration: BoxDecoration(
            color:
                isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
          ),
          child: TabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: isDarkMode ? AppColors.white : AppColors.black,
            isScrollable: true,
            physics: const CustomBouncingScrollPhysics(),
            tabs: widget.categories
                .map(
                  (category) => Text(
                    '${category.translation?.title}',
                    style: GoogleFonts.cairo(
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                      color: isDarkMode ? AppColors.white : AppColors.black,
                      letterSpacing: -14 * 0.01,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        16.verticalSpace,
        Expanded(
          child: TabBarView(
            physics: const CustomBouncingScrollPhysics(),
            controller: _tabController,
            children: widget.categories
                .map(
                  (category) =>
                      CategoryTabBody(categories: category.children ?? []),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
