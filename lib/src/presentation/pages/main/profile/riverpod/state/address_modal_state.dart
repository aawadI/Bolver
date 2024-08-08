import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../models/models.dart';

part 'address_modal_state.freezed.dart';

@freezed
class AddressModalState with _$AddressModalState {
  const factory AddressModalState({
    @Default([]) List<AddressData> addresses,
    @Default([]) List<LocalAddressData> localAddresses,
    @Default('') String activeAddress,
  }) = _AddressModalState;

  const AddressModalState._();
}