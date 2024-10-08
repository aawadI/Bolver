import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/constants/constants.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../models/models.dart';
import '../../../../../theme/theme.dart';

class ChatItem extends StatelessWidget {
  final ChatMessageData chatData;

  const ChatItem({Key? key, required this.chatData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = LocalStorage.instance.getAppThemeMode();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: chatData.messageOwner == MessageOwner.partner
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.r),
              topRight: Radius.circular(25.r),
              bottomLeft: Radius.circular(
                chatData.messageOwner == MessageOwner.partner ? 0 : 25.r,
              ),
              bottomRight: Radius.circular(
                chatData.messageOwner == MessageOwner.you ? 0 : 25.r,
              ),
            ),
            color: chatData.messageOwner == MessageOwner.you
                ? isDarkMode
                    ? AppColors.yourChatBack
                    : AppColors.white
                : isDarkMode
                    ? AppColors.partnerChatBack
                    : AppColors.iconButtonBack,
          ),
          constraints: BoxConstraints(
            maxWidth: 256.r,
          ),
          padding: REdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: Text(
            chatData.message,
            style: GoogleFonts.cairo(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: isDarkMode ? AppColors.white : AppColors.black,
              letterSpacing: -0.5,
            ),
          ),
        ),
        4.verticalSpace,
        Text(
          chatData.time,
          style: GoogleFonts.cairo(
            fontWeight: FontWeight.w500,
            fontSize: 10.sp,
            color: AppColors.reviewText,
            letterSpacing: -0.5,
          ),
        ),
        35.verticalSpace,
      ],
    );
  }
}
