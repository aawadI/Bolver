import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/constants.dart';
import '../../../core/utils/utils.dart';
import '../../theme/theme.dart';
import '../buttons/change_alignment_list_button.dart';
import '../text_fields/search_text_field.dart';

class AppBarWithProductCount extends StatelessWidget implements PreferredSize {
  final String title;
  final int count;
  final bool isVisible;
  final ValueSetter<String> onSearchChanged;
  final VoidCallback? onSearchFilterTapped;
  final bool hasProductCount;
  final bool hasSearchFilter;
  final String? searchHintText;
  final ListAlignment? listAlignment;
  final ValueSetter<ListAlignment>? onChangeListAlignment;

  const AppBarWithProductCount({
    Key? key,
    required this.title,
    this.count = 0,
    required this.onSearchChanged,
    this.onSearchFilterTapped,
    this.hasProductCount = true,
    this.hasSearchFilter = true,
    this.searchHintText,
    this.listAlignment,
    this.isVisible = true,
    this.onChangeListAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final bool isLtr = LocalStorage.instance.getLangLtr();
    return AppBar(
      elevation: 0,
      backgroundColor:
          isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      leading: IconButton(
        splashRadius: 20.r,
        icon: Icon(
          isLtr
              ? FlutterRemix.arrow_left_s_line
              : FlutterRemix.arrow_right_s_line,
          size: 24.r,
          color: isDarkMode ? AppColors.white : AppColors.black,
        ),
        onPressed: context.popRoute,
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 212.w,
            child: Text(
              title.toUpperCase(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.w500,
                fontSize: 15.sp,
                letterSpacing: -0.7,
                color: isDarkMode ? AppColors.white : AppColors.black,
              ),
            ),
          ),
          if (hasProductCount)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                10.horizontalSpace,
                Container(
                  width: 4.r,
                  height: 4.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.r),
                    color: isDarkMode
                        ? AppColors.dragElementDark
                        : AppColors.brandTitleDivider.withOpacity(0.4),
                  ),
                ),
                7.horizontalSpace,
                Text(
                  '$count ${AppHelpers.getTranslation(TrKeys.products).toLowerCase()}',
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    letterSpacing: -0.7,
                    color: isDarkMode ? AppColors.white : AppColors.black,
                  ),
                ),
              ],
            )
        ],
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(55.r),
        child: Column(
          children: [
            Container(
              height: 1.r,
              color: isDarkMode
                  ? AppColors.white.withOpacity(0.5)
                  : AppColors.mainBack,
            ),
            (listAlignment != null && onChangeListAlignment != null)
                ? Row(
                    children: [
                      Expanded(
                        child: SearchTextField(
                          onChanged: onSearchChanged,
                          hintText: searchHintText,
                          suffixIcon: hasSearchFilter
                              ? IconButton(
                                  splashRadius: 10,
                                  icon: Icon(
                                    FlutterRemix.equalizer_line,
                                    color: isDarkMode
                                        ? AppColors.white
                                        : AppColors.black,
                                    size: 18.r,
                                  ),
                                  onPressed: onSearchFilterTapped,
                                )
                              : null,
                        ),
                      ),
                      ChangeAlignmentListButton(
                        alignment: listAlignment!,
                        onChange: onChangeListAlignment!,
                      ),
                      16.horizontalSpace,
                    ],
                  )
                : SearchTextField(
                    onChanged: onSearchChanged,
                    hintText: searchHintText,
                    suffixIcon: hasSearchFilter
                        ? IconButton(
                            splashRadius: 10,
                            icon: Icon(
                              FlutterRemix.equalizer_line,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.black,
                              size: 18.r,
                            ),
                            onPressed: onSearchFilterTapped,
                          )
                        : null,
                  ),
            Container(
              height: 1.r,
              color: isDarkMode
                  ? AppColors.white.withOpacity(0.5)
                  : AppColors.mainBack,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget get child => const Text('AppBar with product count');

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 54.r);
}
