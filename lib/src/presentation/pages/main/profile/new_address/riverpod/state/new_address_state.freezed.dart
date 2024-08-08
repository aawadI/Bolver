// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_address_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewAddressState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get dob => throw _privateConstructorUsedError;
  String get male => throw _privateConstructorUsedError;
  String get passportPrefix => throw _privateConstructorUsedError;
  TextEditingController? get addressController =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewAddressStateCopyWith<NewAddressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewAddressStateCopyWith<$Res> {
  factory $NewAddressStateCopyWith(
          NewAddressState value, $Res Function(NewAddressState) then) =
      _$NewAddressStateCopyWithImpl<$Res, NewAddressState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      String dob,
      String male,
      String passportPrefix,
      TextEditingController? addressController});
}

/// @nodoc
class _$NewAddressStateCopyWithImpl<$Res, $Val extends NewAddressState>
    implements $NewAddressStateCopyWith<$Res> {
  _$NewAddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? dob = null,
    Object? male = null,
    Object? passportPrefix = null,
    Object? addressController = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      male: null == male
          ? _value.male
          : male // ignore: cast_nullable_to_non_nullable
              as String,
      passportPrefix: null == passportPrefix
          ? _value.passportPrefix
          : passportPrefix // ignore: cast_nullable_to_non_nullable
              as String,
      addressController: freezed == addressController
          ? _value.addressController
          : addressController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewAddressStateImplCopyWith<$Res>
    implements $NewAddressStateCopyWith<$Res> {
  factory _$$NewAddressStateImplCopyWith(_$NewAddressStateImpl value,
          $Res Function(_$NewAddressStateImpl) then) =
      __$$NewAddressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      String dob,
      String male,
      String passportPrefix,
      TextEditingController? addressController});
}

/// @nodoc
class __$$NewAddressStateImplCopyWithImpl<$Res>
    extends _$NewAddressStateCopyWithImpl<$Res, _$NewAddressStateImpl>
    implements _$$NewAddressStateImplCopyWith<$Res> {
  __$$NewAddressStateImplCopyWithImpl(
      _$NewAddressStateImpl _value, $Res Function(_$NewAddressStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? dob = null,
    Object? male = null,
    Object? passportPrefix = null,
    Object? addressController = freezed,
  }) {
    return _then(_$NewAddressStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      male: null == male
          ? _value.male
          : male // ignore: cast_nullable_to_non_nullable
              as String,
      passportPrefix: null == passportPrefix
          ? _value.passportPrefix
          : passportPrefix // ignore: cast_nullable_to_non_nullable
              as String,
      addressController: freezed == addressController
          ? _value.addressController
          : addressController // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
    ));
  }
}

/// @nodoc

class _$NewAddressStateImpl extends _NewAddressState {
  const _$NewAddressStateImpl(
      {this.isLoading = false,
      this.isError = false,
      this.dob = '',
      this.male = '',
      this.passportPrefix = 'AA',
      this.addressController})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isError;
  @override
  @JsonKey()
  final String dob;
  @override
  @JsonKey()
  final String male;
  @override
  @JsonKey()
  final String passportPrefix;
  @override
  final TextEditingController? addressController;

  @override
  String toString() {
    return 'NewAddressState(isLoading: $isLoading, isError: $isError, dob: $dob, male: $male, passportPrefix: $passportPrefix, addressController: $addressController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewAddressStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.male, male) || other.male == male) &&
            (identical(other.passportPrefix, passportPrefix) ||
                other.passportPrefix == passportPrefix) &&
            (identical(other.addressController, addressController) ||
                other.addressController == addressController));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError, dob, male,
      passportPrefix, addressController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewAddressStateImplCopyWith<_$NewAddressStateImpl> get copyWith =>
      __$$NewAddressStateImplCopyWithImpl<_$NewAddressStateImpl>(
          this, _$identity);
}

abstract class _NewAddressState extends NewAddressState {
  const factory _NewAddressState(
      {final bool isLoading,
      final bool isError,
      final String dob,
      final String male,
      final String passportPrefix,
      final TextEditingController? addressController}) = _$NewAddressStateImpl;
  const _NewAddressState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  String get dob;
  @override
  String get male;
  @override
  String get passportPrefix;
  @override
  TextEditingController? get addressController;
  @override
  @JsonKey(ignore: true)
  _$$NewAddressStateImplCopyWith<_$NewAddressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
