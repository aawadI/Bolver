// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_stores_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SavedStoresState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  bool get isSearchLoading => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  List<ShopData> get searchedShops => throw _privateConstructorUsedError;
  List<ShopData> get shops => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SavedStoresStateCopyWith<SavedStoresState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedStoresStateCopyWith<$Res> {
  factory $SavedStoresStateCopyWith(
          SavedStoresState value, $Res Function(SavedStoresState) then) =
      _$SavedStoresStateCopyWithImpl<$Res, SavedStoresState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSearching,
      bool isSearchLoading,
      String query,
      List<ShopData> searchedShops,
      List<ShopData> shops});
}

/// @nodoc
class _$SavedStoresStateCopyWithImpl<$Res, $Val extends SavedStoresState>
    implements $SavedStoresStateCopyWith<$Res> {
  _$SavedStoresStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? query = null,
    Object? searchedShops = null,
    Object? shops = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchLoading: null == isSearchLoading
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      searchedShops: null == searchedShops
          ? _value.searchedShops
          : searchedShops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      shops: null == shops
          ? _value.shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SavedStoresStateImplCopyWith<$Res>
    implements $SavedStoresStateCopyWith<$Res> {
  factory _$$SavedStoresStateImplCopyWith(_$SavedStoresStateImpl value,
          $Res Function(_$SavedStoresStateImpl) then) =
      __$$SavedStoresStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSearching,
      bool isSearchLoading,
      String query,
      List<ShopData> searchedShops,
      List<ShopData> shops});
}

/// @nodoc
class __$$SavedStoresStateImplCopyWithImpl<$Res>
    extends _$SavedStoresStateCopyWithImpl<$Res, _$SavedStoresStateImpl>
    implements _$$SavedStoresStateImplCopyWith<$Res> {
  __$$SavedStoresStateImplCopyWithImpl(_$SavedStoresStateImpl _value,
      $Res Function(_$SavedStoresStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? query = null,
    Object? searchedShops = null,
    Object? shops = null,
  }) {
    return _then(_$SavedStoresStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchLoading: null == isSearchLoading
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      searchedShops: null == searchedShops
          ? _value._searchedShops
          : searchedShops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      shops: null == shops
          ? _value._shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
    ));
  }
}

/// @nodoc

class _$SavedStoresStateImpl extends _SavedStoresState {
  const _$SavedStoresStateImpl(
      {this.isLoading = false,
      this.isSearching = false,
      this.isSearchLoading = false,
      this.query = '',
      final List<ShopData> searchedShops = const [],
      final List<ShopData> shops = const []})
      : _searchedShops = searchedShops,
        _shops = shops,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final bool isSearchLoading;
  @override
  @JsonKey()
  final String query;
  final List<ShopData> _searchedShops;
  @override
  @JsonKey()
  List<ShopData> get searchedShops {
    if (_searchedShops is EqualUnmodifiableListView) return _searchedShops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedShops);
  }

  final List<ShopData> _shops;
  @override
  @JsonKey()
  List<ShopData> get shops {
    if (_shops is EqualUnmodifiableListView) return _shops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shops);
  }

  @override
  String toString() {
    return 'SavedStoresState(isLoading: $isLoading, isSearching: $isSearching, isSearchLoading: $isSearchLoading, query: $query, searchedShops: $searchedShops, shops: $shops)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SavedStoresStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isSearchLoading, isSearchLoading) ||
                other.isSearchLoading == isSearchLoading) &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality()
                .equals(other._searchedShops, _searchedShops) &&
            const DeepCollectionEquality().equals(other._shops, _shops));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSearching,
      isSearchLoading,
      query,
      const DeepCollectionEquality().hash(_searchedShops),
      const DeepCollectionEquality().hash(_shops));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedStoresStateImplCopyWith<_$SavedStoresStateImpl> get copyWith =>
      __$$SavedStoresStateImplCopyWithImpl<_$SavedStoresStateImpl>(
          this, _$identity);
}

abstract class _SavedStoresState extends SavedStoresState {
  const factory _SavedStoresState(
      {final bool isLoading,
      final bool isSearching,
      final bool isSearchLoading,
      final String query,
      final List<ShopData> searchedShops,
      final List<ShopData> shops}) = _$SavedStoresStateImpl;
  const _SavedStoresState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isSearching;
  @override
  bool get isSearchLoading;
  @override
  String get query;
  @override
  List<ShopData> get searchedShops;
  @override
  List<ShopData> get shops;
  @override
  @JsonKey(ignore: true)
  _$$SavedStoresStateImplCopyWith<_$SavedStoresStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
