// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_modal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddressModalState {
  List<AddressData> get addresses => throw _privateConstructorUsedError;
  List<LocalAddressData> get localAddresses =>
      throw _privateConstructorUsedError;
  String get activeAddress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressModalStateCopyWith<AddressModalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModalStateCopyWith<$Res> {
  factory $AddressModalStateCopyWith(
          AddressModalState value, $Res Function(AddressModalState) then) =
      _$AddressModalStateCopyWithImpl<$Res, AddressModalState>;
  @useResult
  $Res call(
      {List<AddressData> addresses,
      List<LocalAddressData> localAddresses,
      String activeAddress});
}

/// @nodoc
class _$AddressModalStateCopyWithImpl<$Res, $Val extends AddressModalState>
    implements $AddressModalStateCopyWith<$Res> {
  _$AddressModalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addresses = null,
    Object? localAddresses = null,
    Object? activeAddress = null,
  }) {
    return _then(_value.copyWith(
      addresses: null == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressData>,
      localAddresses: null == localAddresses
          ? _value.localAddresses
          : localAddresses // ignore: cast_nullable_to_non_nullable
              as List<LocalAddressData>,
      activeAddress: null == activeAddress
          ? _value.activeAddress
          : activeAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressModalStateImplCopyWith<$Res>
    implements $AddressModalStateCopyWith<$Res> {
  factory _$$AddressModalStateImplCopyWith(_$AddressModalStateImpl value,
          $Res Function(_$AddressModalStateImpl) then) =
      __$$AddressModalStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AddressData> addresses,
      List<LocalAddressData> localAddresses,
      String activeAddress});
}

/// @nodoc
class __$$AddressModalStateImplCopyWithImpl<$Res>
    extends _$AddressModalStateCopyWithImpl<$Res, _$AddressModalStateImpl>
    implements _$$AddressModalStateImplCopyWith<$Res> {
  __$$AddressModalStateImplCopyWithImpl(_$AddressModalStateImpl _value,
      $Res Function(_$AddressModalStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addresses = null,
    Object? localAddresses = null,
    Object? activeAddress = null,
  }) {
    return _then(_$AddressModalStateImpl(
      addresses: null == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressData>,
      localAddresses: null == localAddresses
          ? _value._localAddresses
          : localAddresses // ignore: cast_nullable_to_non_nullable
              as List<LocalAddressData>,
      activeAddress: null == activeAddress
          ? _value.activeAddress
          : activeAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddressModalStateImpl extends _AddressModalState {
  const _$AddressModalStateImpl(
      {final List<AddressData> addresses = const [],
      final List<LocalAddressData> localAddresses = const [],
      this.activeAddress = ''})
      : _addresses = addresses,
        _localAddresses = localAddresses,
        super._();

  final List<AddressData> _addresses;
  @override
  @JsonKey()
  List<AddressData> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  final List<LocalAddressData> _localAddresses;
  @override
  @JsonKey()
  List<LocalAddressData> get localAddresses {
    if (_localAddresses is EqualUnmodifiableListView) return _localAddresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_localAddresses);
  }

  @override
  @JsonKey()
  final String activeAddress;

  @override
  String toString() {
    return 'AddressModalState(addresses: $addresses, localAddresses: $localAddresses, activeAddress: $activeAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressModalStateImpl &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            const DeepCollectionEquality()
                .equals(other._localAddresses, _localAddresses) &&
            (identical(other.activeAddress, activeAddress) ||
                other.activeAddress == activeAddress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_addresses),
      const DeepCollectionEquality().hash(_localAddresses),
      activeAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressModalStateImplCopyWith<_$AddressModalStateImpl> get copyWith =>
      __$$AddressModalStateImplCopyWithImpl<_$AddressModalStateImpl>(
          this, _$identity);
}

abstract class _AddressModalState extends AddressModalState {
  const factory _AddressModalState(
      {final List<AddressData> addresses,
      final List<LocalAddressData> localAddresses,
      final String activeAddress}) = _$AddressModalStateImpl;
  const _AddressModalState._() : super._();

  @override
  List<AddressData> get addresses;
  @override
  List<LocalAddressData> get localAddresses;
  @override
  String get activeAddress;
  @override
  @JsonKey(ignore: true)
  _$$AddressModalStateImplCopyWith<_$AddressModalStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
