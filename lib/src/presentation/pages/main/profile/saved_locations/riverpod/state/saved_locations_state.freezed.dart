// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_locations_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SavedLocationsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  bool get isUpdating => throw _privateConstructorUsedError;
  List<LocalAddressData> get localAddresses =>
      throw _privateConstructorUsedError;
  List<AddressData> get addresses => throw _privateConstructorUsedError;
  List<Map<MarkerId, Marker>> get listOfMarkers =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SavedLocationsStateCopyWith<SavedLocationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedLocationsStateCopyWith<$Res> {
  factory $SavedLocationsStateCopyWith(
          SavedLocationsState value, $Res Function(SavedLocationsState) then) =
      _$SavedLocationsStateCopyWithImpl<$Res, SavedLocationsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      bool isUpdating,
      List<LocalAddressData> localAddresses,
      List<AddressData> addresses,
      List<Map<MarkerId, Marker>> listOfMarkers});
}

/// @nodoc
class _$SavedLocationsStateCopyWithImpl<$Res, $Val extends SavedLocationsState>
    implements $SavedLocationsStateCopyWith<$Res> {
  _$SavedLocationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? isUpdating = null,
    Object? localAddresses = null,
    Object? addresses = null,
    Object? listOfMarkers = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      localAddresses: null == localAddresses
          ? _value.localAddresses
          : localAddresses // ignore: cast_nullable_to_non_nullable
              as List<LocalAddressData>,
      addresses: null == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressData>,
      listOfMarkers: null == listOfMarkers
          ? _value.listOfMarkers
          : listOfMarkers // ignore: cast_nullable_to_non_nullable
              as List<Map<MarkerId, Marker>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavedLocationsStateImplCopyWith<$Res>
    implements $SavedLocationsStateCopyWith<$Res> {
  factory _$$SavedLocationsStateImplCopyWith(_$SavedLocationsStateImpl value,
          $Res Function(_$SavedLocationsStateImpl) then) =
      __$$SavedLocationsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      bool isUpdating,
      List<LocalAddressData> localAddresses,
      List<AddressData> addresses,
      List<Map<MarkerId, Marker>> listOfMarkers});
}

/// @nodoc
class __$$SavedLocationsStateImplCopyWithImpl<$Res>
    extends _$SavedLocationsStateCopyWithImpl<$Res, _$SavedLocationsStateImpl>
    implements _$$SavedLocationsStateImplCopyWith<$Res> {
  __$$SavedLocationsStateImplCopyWithImpl(_$SavedLocationsStateImpl _value,
      $Res Function(_$SavedLocationsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? isUpdating = null,
    Object? localAddresses = null,
    Object? addresses = null,
    Object? listOfMarkers = null,
  }) {
    return _then(_$SavedLocationsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdating: null == isUpdating
          ? _value.isUpdating
          : isUpdating // ignore: cast_nullable_to_non_nullable
              as bool,
      localAddresses: null == localAddresses
          ? _value._localAddresses
          : localAddresses // ignore: cast_nullable_to_non_nullable
              as List<LocalAddressData>,
      addresses: null == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressData>,
      listOfMarkers: null == listOfMarkers
          ? _value._listOfMarkers
          : listOfMarkers // ignore: cast_nullable_to_non_nullable
              as List<Map<MarkerId, Marker>>,
    ));
  }
}

/// @nodoc

class _$SavedLocationsStateImpl extends _SavedLocationsState {
  const _$SavedLocationsStateImpl(
      {this.isLoading = false,
      this.isMoreLoading = false,
      this.isUpdating = false,
      final List<LocalAddressData> localAddresses = const [],
      final List<AddressData> addresses = const [],
      final List<Map<MarkerId, Marker>> listOfMarkers = const []})
      : _localAddresses = localAddresses,
        _addresses = addresses,
        _listOfMarkers = listOfMarkers,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isMoreLoading;
  @override
  @JsonKey()
  final bool isUpdating;
  final List<LocalAddressData> _localAddresses;
  @override
  @JsonKey()
  List<LocalAddressData> get localAddresses {
    if (_localAddresses is EqualUnmodifiableListView) return _localAddresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_localAddresses);
  }

  final List<AddressData> _addresses;
  @override
  @JsonKey()
  List<AddressData> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  final List<Map<MarkerId, Marker>> _listOfMarkers;
  @override
  @JsonKey()
  List<Map<MarkerId, Marker>> get listOfMarkers {
    if (_listOfMarkers is EqualUnmodifiableListView) return _listOfMarkers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfMarkers);
  }

  @override
  String toString() {
    return 'SavedLocationsState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, isUpdating: $isUpdating, localAddresses: $localAddresses, addresses: $addresses, listOfMarkers: $listOfMarkers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedLocationsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isMoreLoading, isMoreLoading) ||
                other.isMoreLoading == isMoreLoading) &&
            (identical(other.isUpdating, isUpdating) ||
                other.isUpdating == isUpdating) &&
            const DeepCollectionEquality()
                .equals(other._localAddresses, _localAddresses) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            const DeepCollectionEquality()
                .equals(other._listOfMarkers, _listOfMarkers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isMoreLoading,
      isUpdating,
      const DeepCollectionEquality().hash(_localAddresses),
      const DeepCollectionEquality().hash(_addresses),
      const DeepCollectionEquality().hash(_listOfMarkers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedLocationsStateImplCopyWith<_$SavedLocationsStateImpl> get copyWith =>
      __$$SavedLocationsStateImplCopyWithImpl<_$SavedLocationsStateImpl>(
          this, _$identity);
}

abstract class _SavedLocationsState extends SavedLocationsState {
  const factory _SavedLocationsState(
          {final bool isLoading,
          final bool isMoreLoading,
          final bool isUpdating,
          final List<LocalAddressData> localAddresses,
          final List<AddressData> addresses,
          final List<Map<MarkerId, Marker>> listOfMarkers}) =
      _$SavedLocationsStateImpl;
  const _SavedLocationsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  bool get isUpdating;
  @override
  List<LocalAddressData> get localAddresses;
  @override
  List<AddressData> get addresses;
  @override
  List<Map<MarkerId, Marker>> get listOfMarkers;
  @override
  @JsonKey(ignore: true)
  _$$SavedLocationsStateImplCopyWith<_$SavedLocationsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
