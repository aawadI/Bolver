import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/constants/constants.dart';
import '../../../../../../../core/utils/utils.dart';
import '../../../../../../components/components.dart';
import '../../../../../../theme/theme.dart';
import '../riverpod/provider/checkout_provider.dart';

class PickupDatePickerModal extends ConsumerStatefulWidget {
  final bool isDarkMode;
  const PickupDatePickerModal({Key? key, required this.isDarkMode}) : super(key: key);

  @override
  ConsumerState<PickupDatePickerModal> createState() =>
      _PickupDatePickerModalState();
}

class _PickupDatePickerModalState extends ConsumerState<PickupDatePickerModal> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(checkoutProvider.notifier);
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          24.verticalSpace,
          SizedBox(
            height: 300.r,
            child: CupertinoTheme(
              data: CupertinoThemeData(
                brightness: widget.isDarkMode ? Brightness.dark : Brightness.light,
              ),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                minimumDate: DateTime.now(),
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime value) {
                  date = value;
                },
              ),
            ),
          ),
          16.verticalSpace,
          AccentLoginButton(
            background: AppColors.black,
            title: AppHelpers.getTranslation(TrKeys.save),
            onPressed: () {
              notifier.setPickupDate(date);
              context.popRoute();
            },
          ),
          24.verticalSpace,
        ],
      ),
    );
  }
}
