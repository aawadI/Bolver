// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeSearchState {
  bool get isSearching => throw _privateConstructorUsedError;
  bool get isSearchLoading => throw _privateConstructorUsedError;
  List<ProductData> get searchedProducts => throw _privateConstructorUsedError;
  List<ShopData> get searchedShops => throw _privateConstructorUsedError;
  List<BrandData> get searchedBrands => throw _privateConstructorUsedError;
  List<CategoryData> get searchedCategories =>
      throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeSearchStateCopyWith<HomeSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeSearchStateCopyWith<$Res> {
  factory $HomeSearchStateCopyWith(
          HomeSearchState value, $Res Function(HomeSearchState) then) =
      _$HomeSearchStateCopyWithImpl<$Res, HomeSearchState>;
  @useResult
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      List<ProductData> searchedProducts,
      List<ShopData> searchedShops,
      List<BrandData> searchedBrands,
      List<CategoryData> searchedCategories,
      String query});
}

/// @nodoc
class _$HomeSearchStateCopyWithImpl<$Res, $Val extends HomeSearchState>
    implements $HomeSearchStateCopyWith<$Res> {
  _$HomeSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? searchedProducts = null,
    Object? searchedShops = null,
    Object? searchedBrands = null,
    Object? searchedCategories = null,
    Object? query = null,
  }) {
    return _then(_value.copyWith(
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchLoading: null == isSearchLoading
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedProducts: null == searchedProducts
          ? _value.searchedProducts
          : searchedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      searchedShops: null == searchedShops
          ? _value.searchedShops
          : searchedShops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      searchedBrands: null == searchedBrands
          ? _value.searchedBrands
          : searchedBrands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
      searchedCategories: null == searchedCategories
          ? _value.searchedCategories
          : searchedCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeSearchStateImplCopyWith<$Res>
    implements $HomeSearchStateCopyWith<$Res> {
  factory _$$HomeSearchStateImplCopyWith(_$HomeSearchStateImpl value,
          $Res Function(_$HomeSearchStateImpl) then) =
      __$$HomeSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      List<ProductData> searchedProducts,
      List<ShopData> searchedShops,
      List<BrandData> searchedBrands,
      List<CategoryData> searchedCategories,
      String query});
}

/// @nodoc
class __$$HomeSearchStateImplCopyWithImpl<$Res>
    extends _$HomeSearchStateCopyWithImpl<$Res, _$HomeSearchStateImpl>
    implements _$$HomeSearchStateImplCopyWith<$Res> {
  __$$HomeSearchStateImplCopyWithImpl(
      _$HomeSearchStateImpl _value, $Res Function(_$HomeSearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? searchedProducts = null,
    Object? searchedShops = null,
    Object? searchedBrands = null,
    Object? searchedCategories = null,
    Object? query = null,
  }) {
    return _then(_$HomeSearchStateImpl(
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchLoading: null == isSearchLoading
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedProducts: null == searchedProducts
          ? _value._searchedProducts
          : searchedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      searchedShops: null == searchedShops
          ? _value._searchedShops
          : searchedShops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      searchedBrands: null == searchedBrands
          ? _value._searchedBrands
          : searchedBrands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
      searchedCategories: null == searchedCategories
          ? _value._searchedCategories
          : searchedCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$HomeSearchStateImpl extends _HomeSearchState {
  const _$HomeSearchStateImpl(
      {this.isSearching = false,
      this.isSearchLoading = false,
      final List<ProductData> searchedProducts = const [],
      final List<ShopData> searchedShops = const [],
      final List<BrandData> searchedBrands = const [],
      final List<CategoryData> searchedCategories = const [],
      this.query = ''})
      : _searchedProducts = searchedProducts,
        _searchedShops = searchedShops,
        _searchedBrands = searchedBrands,
        _searchedCategories = searchedCategories,
        super._();

  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final bool isSearchLoading;
  final List<ProductData> _searchedProducts;
  @override
  @JsonKey()
  List<ProductData> get searchedProducts {
    if (_searchedProducts is EqualUnmodifiableListView)
      return _searchedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedProducts);
  }

  final List<ShopData> _searchedShops;
  @override
  @JsonKey()
  List<ShopData> get searchedShops {
    if (_searchedShops is EqualUnmodifiableListView) return _searchedShops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedShops);
  }

  final List<BrandData> _searchedBrands;
  @override
  @JsonKey()
  List<BrandData> get searchedBrands {
    if (_searchedBrands is EqualUnmodifiableListView) return _searchedBrands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedBrands);
  }

  final List<CategoryData> _searchedCategories;
  @override
  @JsonKey()
  List<CategoryData> get searchedCategories {
    if (_searchedCategories is EqualUnmodifiableListView)
      return _searchedCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedCategories);
  }

  @override
  @JsonKey()
  final String query;

  @override
  String toString() {
    return 'HomeSearchState(isSearching: $isSearching, isSearchLoading: $isSearchLoading, searchedProducts: $searchedProducts, searchedShops: $searchedShops, searchedBrands: $searchedBrands, searchedCategories: $searchedCategories, query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeSearchStateImpl &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isSearchLoading, isSearchLoading) ||
                other.isSearchLoading == isSearchLoading) &&
            const DeepCollectionEquality()
                .equals(other._searchedProducts, _searchedProducts) &&
            const DeepCollectionEquality()
                .equals(other._searchedShops, _searchedShops) &&
            const DeepCollectionEquality()
                .equals(other._searchedBrands, _searchedBrands) &&
            const DeepCollectionEquality()
                .equals(other._searchedCategories, _searchedCategories) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isSearching,
      isSearchLoading,
      const DeepCollectionEquality().hash(_searchedProducts),
      const DeepCollectionEquality().hash(_searchedShops),
      const DeepCollectionEquality().hash(_searchedBrands),
      const DeepCollectionEquality().hash(_searchedCategories),
      query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeSearchStateImplCopyWith<_$HomeSearchStateImpl> get copyWith =>
      __$$HomeSearchStateImplCopyWithImpl<_$HomeSearchStateImpl>(
          this, _$identity);
}

abstract class _HomeSearchState extends HomeSearchState {
  const factory _HomeSearchState(
      {final bool isSearching,
      final bool isSearchLoading,
      final List<ProductData> searchedProducts,
      final List<ShopData> searchedShops,
      final List<BrandData> searchedBrands,
      final List<CategoryData> searchedCategories,
      final String query}) = _$HomeSearchStateImpl;
  const _HomeSearchState._() : super._();

  @override
  bool get isSearching;
  @override
  bool get isSearchLoading;
  @override
  List<ProductData> get searchedProducts;
  @override
  List<ShopData> get searchedShops;
  @override
  List<BrandData> get searchedBrands;
  @override
  List<CategoryData> get searchedCategories;
  @override
  String get query;
  @override
  @JsonKey(ignore: true)
  _$$HomeSearchStateImplCopyWith<_$HomeSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
