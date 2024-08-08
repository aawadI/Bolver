import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../../core/constants/constants.dart';
import '../../../../../../../../core/utils/utils.dart';
import '../../../../../../../../models/models.dart';
import '../../../../../../../components/components.dart';
import '../../../../../../../theme/theme.dart';
import '../../riverpod/provider/category_products_provider.dart';

class FilterExtrasPage extends ConsumerStatefulWidget {
  final ExtraGroup? extra;
  final int index;

  const FilterExtrasPage({
    Key? key,
    required this.extra,
    required this.index,
  }) : super(key: key);

  @override
  ConsumerState<FilterExtrasPage> createState() => _FilterExtrasPageState();
}

class _FilterExtrasPageState extends ConsumerState<FilterExtrasPage> {
  List<Extras> listExtra = [];

  List<Extras> searchInList(String searchQuery) {
    List<Extras> result = [];
    if (searchQuery.isNotEmpty) {
      for (Extras word in widget.extra?.filterExtras ?? []) {
        if (word.value?.toLowerCase().contains(searchQuery.toLowerCase()) ??
            false) {
          result.add(word);
        }
      }
      return result;
    } else {
      return widget.extra?.filterExtras ?? [];
    }
  }

  @override
  void initState() {
    listExtra = widget.extra?.filterExtras ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    final event = ref.read(categoryProductsProvider.notifier);
    ref.watch(categoryProductsProvider);
    return Scaffold(
      extendBody: true,
      backgroundColor:
          isDarkMode ? AppColors.dontHaveAnAccBackDark : AppColors.white,
      appBar: CommonAppBar(
        title:
            '${widget.extra?.translation?.title} ${AppHelpers.getCheckedExtras(widget.extra?.filterExtras).isEmpty ? '' : '(${AppHelpers.getCheckedExtras(widget.extra?.filterExtras).length})'}',
        onLeadingPressed: context.popRoute,
      ),
      body: Column(
        children: [
          Divider(thickness: 1.r, height: 1.r, color: AppColors.divider),
          SearchTextField(
            hintText: AppHelpers.getTranslation(TrKeys.typeSomething),
            onChanged: (s) {
              listExtra = searchInList(s);
              setState(() {});
            },
          ),
          Divider(thickness: 1.r, height: 1.r, color: AppColors.divider),
          Expanded(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    24.verticalSpace,
                    Wrap(
                      spacing: 8.r,
                      runSpacing: 10.r,
                      children: listExtra.map(
                        (extras) {
                          return AppHelpers.checkIfHex(extras.value)
                              ? ButtonsBouncingEffect(
                                  child: GestureDetector(
                                    onTap: () {
                                      event.toggleExtrasItem(
                                          extras, widget.index);
                                      extras = extras.copyWith(
                                          isCheckedForFilter:
                                              !(extras.isCheckedForFilter ??
                                                  false));
                                      for (int i = 0;
                                          i < listExtra.length;
                                          i++) {
                                        if (listExtra[i].id == extras.id) {
                                          listExtra.removeAt(i);
                                          listExtra.insert(i, extras);
                                        }
                                      }
                                      setState(() {});
                                    },
                                    child: (extras.isCheckedForFilter ?? false)
                                        ? Container(
                                            width: 42.r,
                                            height: 42.r,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(21.r),
                                              color: Color(
                                                int.parse(
                                                    '0xFF${extras.value?.substring(1, 7)}'),
                                              ),
                                            ),
                                            child: Container(
                                              width: 22.r,
                                              height: 22.r,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(11.r),
                                                color: AppColors.accentGreen,
                                                border: Border.all(
                                                  color: AppColors.white,
                                                  width: 8.r,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container(
                                            width: 42.r,
                                            height: 42.r,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(21.r),
                                              color: Color(
                                                int.parse(
                                                    '0xFF${extras.value?.substring(1, 7)}'),
                                              ),
                                            ),
                                          ),
                                  ),
                                )
                              : ButtonsBouncingEffect(
                                  child: GestureDetector(
                                    onTap: () {
                                      event.toggleExtrasItem(
                                          extras, widget.index);

                                      extras = extras.copyWith(
                                          isCheckedForFilter:
                                              !(extras.isCheckedForFilter ??
                                                  false));
                                      for (int i = 0;
                                          i < listExtra.length;
                                          i++) {
                                        if (listExtra[i].id == extras.id) {
                                          listExtra.removeAt(i);
                                          listExtra.insert(i, extras);
                                        }
                                      }
                                      setState(() {});
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            (extras.isCheckedForFilter ?? false)
                                                ? AppColors.black
                                                : AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                          color:
                                              AppColors.black.withOpacity(0.1),
                                        ),
                                      ),
                                      padding: REdgeInsets.all(12),
                                      child: Text(
                                        '${extras.value}',
                                        style: GoogleFonts.cairo(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: (extras.isCheckedForFilter ??
                                                  false)
                                              ? AppColors.white
                                              : AppColors.black,
                                          letterSpacing: -14 * 0.01,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                        },
                      ).toList(),
                    ),
                    80.verticalSpace,
                  ],
                ),
              ),
            ),
          )
        ],
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
