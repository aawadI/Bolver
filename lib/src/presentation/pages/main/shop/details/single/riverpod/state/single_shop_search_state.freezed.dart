// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_shop_search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SingleShopSearchState {
  bool get isSearching => throw _privateConstructorUsedError;
  bool get isSearchLoading => throw _privateConstructorUsedError;
  List<ProductData> get searchedProducts => throw _privateConstructorUsedError;
  List<BrandData> get searchedBrands => throw _privateConstructorUsedError;
  List<CategoryData> get searchedCategories =>
      throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SingleShopSearchStateCopyWith<SingleShopSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleShopSearchStateCopyWith<$Res> {
  factory $SingleShopSearchStateCopyWith(SingleShopSearchState value,
          $Res Function(SingleShopSearchState) then) =
      _$SingleShopSearchStateCopyWithImpl<$Res, SingleShopSearchState>;
  @useResult
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      List<ProductData> searchedProducts,
      List<BrandData> searchedBrands,
      List<CategoryData> searchedCategories,
      String query});
}

/// @nodoc
class _$SingleShopSearchStateCopyWithImpl<$Res,
        $Val extends SingleShopSearchState>
    implements $SingleShopSearchStateCopyWith<$Res> {
  _$SingleShopSearchStateCopyWithImpl(this._value, this._then);

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
abstract class _$$SingleShopSearchStateImplCopyWith<$Res>
    implements $SingleShopSearchStateCopyWith<$Res> {
  factory _$$SingleShopSearchStateImplCopyWith(
          _$SingleShopSearchStateImpl value,
          $Res Function(_$SingleShopSearchStateImpl) then) =
      __$$SingleShopSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      List<ProductData> searchedProducts,
      List<BrandData> searchedBrands,
      List<CategoryData> searchedCategories,
      String query});
}

/// @nodoc
class __$$SingleShopSearchStateImplCopyWithImpl<$Res>
    extends _$SingleShopSearchStateCopyWithImpl<$Res,
        _$SingleShopSearchStateImpl>
    implements _$$SingleShopSearchStateImplCopyWith<$Res> {
  __$$SingleShopSearchStateImplCopyWithImpl(_$SingleShopSearchStateImpl _value,
      $Res Function(_$SingleShopSearchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? searchedProducts = null,
    Object? searchedBrands = null,
    Object? searchedCategories = null,
    Object? query = null,
  }) {
    return _then(_$SingleShopSearchStateImpl(
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

class _$SingleShopSearchStateImpl extends _SingleShopSearchState {
  const _$SingleShopSearchStateImpl(
      {this.isSearching = false,
      this.isSearchLoading = false,
      final List<ProductData> searchedProducts = const [],
      final List<BrandData> searchedBrands = const [],
      final List<CategoryData> searchedCategories = const [],
      this.query = ''})
      : _searchedProducts = searchedProducts,
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
    return 'SingleShopSearchState(isSearching: $isSearching, isSearchLoading: $isSearchLoading, searchedProducts: $searchedProducts, searchedBrands: $searchedBrands, searchedCategories: $searchedCategories, query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleShopSearchStateImpl &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isSearchLoading, isSearchLoading) ||
                other.isSearchLoading == isSearchLoading) &&
            const DeepCollectionEquality()
                .equals(other._searchedProducts, _searchedProducts) &&
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
      const DeepCollectionEquality().hash(_searchedBrands),
      const DeepCollectionEquality().hash(_searchedCategories),
      query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleShopSearchStateImplCopyWith<_$SingleShopSearchStateImpl>
      get copyWith => __$$SingleShopSearchStateImplCopyWithImpl<
          _$SingleShopSearchStateImpl>(this, _$identity);
}

abstract class _SingleShopSearchState extends SingleShopSearchState {
  const factory _SingleShopSearchState(
      {final bool isSearching,
      final bool isSearchLoading,
      final List<ProductData> searchedProducts,
      final List<BrandData> searchedBrands,
      final List<CategoryData> searchedCategories,
      final String query}) = _$SingleShopSearchStateImpl;
  const _SingleShopSearchState._() : super._();

  @override
  bool get isSearching;
  @override
  bool get isSearchLoading;
  @override
  List<ProductData> get searchedProducts;
  @override
  List<BrandData> get searchedBrands;
  @override
  List<CategoryData> get searchedCategories;
  @override
  String get query;
  @override
  @JsonKey(ignore: true)
  _$$SingleShopSearchStateImplCopyWith<_$SingleShopSearchStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
