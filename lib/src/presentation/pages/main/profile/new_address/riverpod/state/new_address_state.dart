import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_address_state.freezed.dart';

@freezed
class NewAddressState with _$NewAddressState {
  const factory NewAddressState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String dob,
    @Default('') String male,
    @Default('AA') String passportPrefix,
    TextEditingController? addressController,
  }) = _NewAddressState;

  const NewAddressState._();
}
