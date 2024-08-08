import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/routes/app_router.gr.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../models/models.dart';
import '../../../../../components/components.dart';
import '../../../../../theme/theme.dart';
import 'riverpod/provider/more_categories_provider.dart';

class MoreCategoriesPage extends ConsumerStatefulWidget {
  final CategoryData category;

  const MoreCategoriesPage({Key? key, required this.category})
      : super(key: key);

  @override
  ConsumerState<MoreCategoriesPage> createState() => _MoreCategoriesPageState();
}

class _MoreCategoriesPageState extends ConsumerState<MoreCategoriesPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(moreCategoriesProvider.notifier)
          .fetchCategoryDetails(category: widget.category),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Scaffold(
      backgroundColor:
          isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      appBar: CommonAppBar(
        title: '${widget.category.translation?.title}',
        onLeadingPressed: context.popRoute,
      ),
      body: Column(
        children: [
          Divider(thickness: 1.r, height: 1.r, color: AppColors.divider),
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(moreCategoriesProvider);
                return state.isLoading
                    ? const Center(
                        child: JumpingDots(),
                      )
                    : ((state.category?.children?.isEmpty ?? false)
                        ? EmptyList(
                            text: AppHelpers.getTranslation(TrKeys.empty),
                          )
                        : GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: state.category?.children?.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 168 / 200,
                              mainAxisSpacing: 10.r,
                              crossAxisSpacing: 9.r,
                              crossAxisCount: 2,
                              mainAxisExtent: 240.r,
                            ),
                            padding: REdgeInsets.symmetric(
                                vertical: 24, horizontal: 16),
                            itemBuilder: (context, index) {
                              final subCategory =
                                  state.category?.children?[index];
                              return Material(
                                borderRadius: BorderRadius.circular(20.r),
                                color: isDarkMode
                                    ? AppColors.mainBackDark
                                    : AppColors.mainBack,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(20.r),
                                  onTap: () => context.pushRoute(
                                    CategoryProductsRoute(
                                        category: subCategory,
                                        title:
                                            subCategory?.translation?.title ??
                                                ""),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    padding: REdgeInsets.symmetric(
                                      vertical: 21,
                                      horizontal: 15,
                                    ),
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CommonImage(
                                          imageUrl: subCategory?.img,
                                          width: 100,
                                          height: 100,
                                          radius: 50,
                                        ),
                                        32.verticalSpace,
                                        Text(
                                          '${subCategory?.translation?.title}',
                                          style: GoogleFonts.cairo(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w500,
                                            color: isDarkMode
                                                ? AppColors.white
                                                : AppColors.black,
                                            letterSpacing: -14 * 0.02,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
