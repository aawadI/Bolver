// import '../../core/constants/constants.dart';
//
// class UiExtra {
//   final String code;
//   final int index;
//   final String value;
//   final bool isSelected;
//
//   UiExtra(this.value, this.isSelected, this.index, this.code);
//
//   @override
//   String toString() {
//     return '(Extras name: $value is selected: $isSelected index: $index )';
//   }
// }
//
// class TypedExtra {
//   final int groupIndex;
//   final ExtrasType type;
//   final String title;
//   final List<UiExtra> uiExtras;
//
//   TypedExtra(this.type, this.uiExtras, this.title, this.groupIndex);
//
//   @override
//   String toString() {
//     return '(Extras type: $type ui extras: $uiExtras title: $title group index: $groupIndex})';
//   }
// }

import '../../core/constants/app_constants.dart';

class UiExtra {
  final String code;
  final int index;
  final String value;
  bool isSelected;

  UiExtra({
    required this.code,
    required this.index,
    required this.value,
    this.isSelected = false,
  });
}

class TypedExtra {
  final int groupIndex;
  final ExtrasType type;
  final String title;
  final List<UiExtra> uiExtras;

  TypedExtra({
    required this.type,
    required this.uiExtras,
    required this.title,
    required this.groupIndex,
  });
}
