import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/routes/app_router.gr.dart';
import '../../../../core/utils/app_helpers.dart';
import '../../../../core/utils/local_storage.dart';
import '../../../components/buttons/animation_button_effect.dart';
import '../../../components/buttons/pop_button.dart';
import '../../../theme/app_colors.dart';

class UiTypePage extends StatelessWidget {
  final bool isBack;

  const UiTypePage({super.key, this.isBack = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text(AppHelpers.getTranslation(TrKeys.uiType),
            style: GoogleFonts.cairo(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            )),
      ),
      body: GridView.builder(
        itemCount: 2,
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisExtent: MediaQuery.sizeOf(context).height / 2 - 64.h,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return AnimationButtonEffect(
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return GestureDetector(
                  onTap: () async {
                    await LocalStorage.setUiType(index);
                    if (context.mounted) {
                      LocalStorage.getUiType() == 0
                          ? context.replaceRoute(const ShopMainRoute())
                          : context.replaceRoute(const MainRoute());
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: AppHelpers.getType() == index
                              ? AppColors.accentGreen
                              : AppColors.transparent,
                          width: 3),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.asset(
                        "assets/images/png/uiType${index + 1}.jpg",
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: isBack
          ? Padding(
              padding: EdgeInsets.only(left: 16.w),
              child: const PopButton(),
            )
          : const SizedBox.shrink(),
    );
  }
}
