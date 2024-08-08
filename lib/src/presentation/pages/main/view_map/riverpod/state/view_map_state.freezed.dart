// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_map_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ViewMapState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ShopData> get shops => throw _privateConstructorUsedError;
  Map<MarkerId, Marker> get shopMarkers => throw _privateConstructorUsedError;
  GlobalKey<State<StatefulWidget>>? get globalKey =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ViewMapStateCopyWith<ViewMapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewMapStateCopyWith<$Res> {
  factory $ViewMapStateCopyWith(
          ViewMapState value, $Res Function(ViewMapState) then) =
      _$ViewMapStateCopyWithImpl<$Res, ViewMapState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<ShopData> shops,
      Map<MarkerId, Marker> shopMarkers,
      GlobalKey<State<StatefulWidget>>? globalKey});
}

/// @nodoc
class _$ViewMapStateCopyWithImpl<$Res, $Val extends ViewMapState>
    implements $ViewMapStateCopyWith<$Res> {
  _$ViewMapStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? shops = null,
    Object? shopMarkers = null,
    Object? globalKey = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      shops: null == shops
          ? _value.shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      shopMarkers: null == shopMarkers
          ? _value.shopMarkers
          : shopMarkers // ignore: cast_nullable_to_non_nullable
              as Map<MarkerId, Marker>,
      globalKey: freezed == globalKey
          ? _value.globalKey
          : globalKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<State<StatefulWidget>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ViewMapStateImplCopyWith<$Res>
    implements $ViewMapStateCopyWith<$Res> {
  factory _$$ViewMapStateImplCopyWith(
          _$ViewMapStateImpl value, $Res Function(_$ViewMapStateImpl) then) =
      __$$ViewMapStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<ShopData> shops,
      Map<MarkerId, Marker> shopMarkers,
      GlobalKey<State<StatefulWidget>>? globalKey});
}

/// @nodoc
class __$$ViewMapStateImplCopyWithImpl<$Res>
    extends _$ViewMapStateCopyWithImpl<$Res, _$ViewMapStateImpl>
    implements _$$ViewMapStateImplCopyWith<$Res> {
  __$$ViewMapStateImplCopyWithImpl(
      _$ViewMapStateImpl _value, $Res Function(_$ViewMapStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? shops = null,
    Object? shopMarkers = null,
    Object? globalKey = freezed,
  }) {
    return _then(_$ViewMapStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      shops: null == shops
          ? _value._shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      shopMarkers: null == shopMarkers
          ? _value._shopMarkers
          : shopMarkers // ignore: cast_nullable_to_non_nullable
              as Map<MarkerId, Marker>,
      globalKey: freezed == globalKey
          ? _value.globalKey
          : globalKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<State<StatefulWidget>>?,
    ));
  }
}

/// @nodoc

class _$ViewMapStateImpl extends _ViewMapState {
  const _$ViewMapStateImpl(
      {this.isLoading = false,
      final List<ShopData> shops = const [],
      final Map<MarkerId, Marker> shopMarkers = const {},
      this.globalKey})
      : _shops = shops,
        _shopMarkers = shopMarkers,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<ShopData> _shops;
  @override
  @JsonKey()
  List<ShopData> get shops {
    if (_shops is EqualUnmodifiableListView) return _shops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shops);
  }

  final Map<MarkerId, Marker> _shopMarkers;
  @override
  @JsonKey()
  Map<MarkerId, Marker> get shopMarkers {
    if (_shopMarkers is EqualUnmodifiableMapView) return _shopMarkers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_shopMarkers);
  }

  @override
  final GlobalKey<State<StatefulWidget>>? globalKey;

  @override
  String toString() {
    return 'ViewMapState(isLoading: $isLoading, shops: $shops, shopMarkers: $shopMarkers, globalKey: $globalKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewMapStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._shops, _shops) &&
            const DeepCollectionEquality()
                .equals(other._shopMarkers, _shopMarkers) &&
            (identical(other.globalKey, globalKey) ||
                other.globalKey == globalKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_shops),
      const DeepCollectionEquality().hash(_shopMarkers),
      globalKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewMapStateImplCopyWith<_$ViewMapStateImpl> get copyWith =>
      __$$ViewMapStateImplCopyWithImpl<_$ViewMapStateImpl>(this, _$identity);
}

abstract class _ViewMapState extends ViewMapState {
  const factory _ViewMapState(
      {final bool isLoading,
      final List<ShopData> shops,
      final Map<MarkerId, Marker> shopMarkers,
      final GlobalKey<State<StatefulWidget>>? globalKey}) = _$ViewMapStateImpl;
  const _ViewMapState._() : super._();

  @override
  bool get isLoading;
  @override
  List<ShopData> get shops;
  @override
  Map<MarkerId, Marker> get shopMarkers;
  @override
  GlobalKey<State<StatefulWidget>>? get globalKey;
  @override
  @JsonKey(ignore: true)
  _$$ViewMapStateImplCopyWith<_$ViewMapStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
