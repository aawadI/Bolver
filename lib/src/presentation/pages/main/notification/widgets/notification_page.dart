import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g_customer/src/presentation/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/utils/local_storage.dart';
import '../../../../components/components.dart';
import '../../../../components/modal_drag.dart';
import '../../../../components/modal_wrap.dart';
import '../riverpod/provider/notifications_provider.dart';

class NotificationPage extends ConsumerStatefulWidget {
  final String uuid;
  const NotificationPage({Key? key, required this.uuid}) : super(key: key);

  @override
  ConsumerState<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends ConsumerState<NotificationPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref
          .read(notificationsProvider.notifier)
          .fetchNotificationDetail(widget.uuid),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notificationsProvider);
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return ModalWrap(
      body: Container(
        decoration: BoxDecoration(
          color: isDarkMode
              ? AppColors.mainBackDark
              : AppColors.dontHaveAccBtnBack,
        ),
        constraints: BoxConstraints(
          maxHeight: 500.h, // Set your maximum width here
        ),
        child: state.isDetailLoading
            ? JumpingDots(color: isDarkMode ? AppColors.white : AppColors.black)
            : SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ModalDrag(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        state.notificationDetail?.translation?.title ?? "",
                        style: GoogleFonts.cairo(
                          fontSize: 26.sp,
                          color: isDarkMode
                              ? AppColors.white.withOpacity(0.8)
                              : AppColors.black,
                        ),
                      ),
                    ),
                    24.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        state.notificationDetail?.translation?.shortDesc ?? "",
                        style: GoogleFonts.cairo(
                          fontSize: 14.sp,
                          color: isDarkMode
                              ? AppColors.white.withOpacity(0.8)
                              : AppColors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Html(
                        data: state
                                .notificationDetail?.translation?.description ??
                            "",
                      ),
                    ),
                    24.verticalSpace,
                  ],
                ),
              ),
      ),
    );
  }
}
