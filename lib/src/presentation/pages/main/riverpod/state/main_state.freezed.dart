// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MainState {
  bool get isSearching => throw _privateConstructorUsedError;
  bool get isSearchLoading => throw _privateConstructorUsedError;
  bool get isCategoriesLoading => throw _privateConstructorUsedError;
  bool get isBrandsLoading => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  List<ProductData> get searchedProducts => throw _privateConstructorUsedError;
  List<CategoryData> get categories => throw _privateConstructorUsedError;
  List<BrandData> get brands => throw _privateConstructorUsedError;
  List<ShopData> get searchedShops => throw _privateConstructorUsedError;
  List<BrandData> get searchedBrands => throw _privateConstructorUsedError;
  List<CategoryData> get searchedCategories =>
      throw _privateConstructorUsedError;
  int get lastActiveTab => throw _privateConstructorUsedError;
  int get selectedCategoryId => throw _privateConstructorUsedError;
  int get selectedBrandId => throw _privateConstructorUsedError;
  PriceFilter get priceFilter => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
  @useResult
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      bool isCategoriesLoading,
      bool isBrandsLoading,
      String query,
      List<ProductData> searchedProducts,
      List<CategoryData> categories,
      List<BrandData> brands,
      List<ShopData> searchedShops,
      List<BrandData> searchedBrands,
      List<CategoryData> searchedCategories,
      int lastActiveTab,
      int selectedCategoryId,
      int selectedBrandId,
      PriceFilter priceFilter});
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? isCategoriesLoading = null,
    Object? isBrandsLoading = null,
    Object? query = null,
    Object? searchedProducts = null,
    Object? categories = null,
    Object? brands = null,
    Object? searchedShops = null,
    Object? searchedBrands = null,
    Object? searchedCategories = null,
    Object? lastActiveTab = null,
    Object? selectedCategoryId = null,
    Object? selectedBrandId = null,
    Object? priceFilter = null,
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
      isCategoriesLoading: null == isCategoriesLoading
          ? _value.isCategoriesLoading
          : isCategoriesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBrandsLoading: null == isBrandsLoading
          ? _value.isBrandsLoading
          : isBrandsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      searchedProducts: null == searchedProducts
          ? _value.searchedProducts
          : searchedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      brands: null == brands
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
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
      lastActiveTab: null == lastActiveTab
          ? _value.lastActiveTab
          : lastActiveTab // ignore: cast_nullable_to_non_nullable
              as int,
      selectedCategoryId: null == selectedCategoryId
          ? _value.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      selectedBrandId: null == selectedBrandId
          ? _value.selectedBrandId
          : selectedBrandId // ignore: cast_nullable_to_non_nullable
              as int,
      priceFilter: null == priceFilter
          ? _value.priceFilter
          : priceFilter // ignore: cast_nullable_to_non_nullable
              as PriceFilter,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainStateImplCopyWith<$Res>
    implements $MainStateCopyWith<$Res> {
  factory _$$MainStateImplCopyWith(
          _$MainStateImpl value, $Res Function(_$MainStateImpl) then) =
      __$$MainStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isSearching,
      bool isSearchLoading,
      bool isCategoriesLoading,
      bool isBrandsLoading,
      String query,
      List<ProductData> searchedProducts,
      List<CategoryData> categories,
      List<BrandData> brands,
      List<ShopData> searchedShops,
      List<BrandData> searchedBrands,
      List<CategoryData> searchedCategories,
      int lastActiveTab,
      int selectedCategoryId,
      int selectedBrandId,
      PriceFilter priceFilter});
}

/// @nodoc
class __$$MainStateImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$MainStateImpl>
    implements _$$MainStateImplCopyWith<$Res> {
  __$$MainStateImplCopyWithImpl(
      _$MainStateImpl _value, $Res Function(_$MainStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? isCategoriesLoading = null,
    Object? isBrandsLoading = null,
    Object? query = null,
    Object? searchedProducts = null,
    Object? categories = null,
    Object? brands = null,
    Object? searchedShops = null,
    Object? searchedBrands = null,
    Object? searchedCategories = null,
    Object? lastActiveTab = null,
    Object? selectedCategoryId = null,
    Object? selectedBrandId = null,
    Object? priceFilter = null,
  }) {
    return _then(_$MainStateImpl(
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchLoading: null == isSearchLoading
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCategoriesLoading: null == isCategoriesLoading
          ? _value.isCategoriesLoading
          : isCategoriesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isBrandsLoading: null == isBrandsLoading
          ? _value.isBrandsLoading
          : isBrandsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      searchedProducts: null == searchedProducts
          ? _value._searchedProducts
          : searchedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      brands: null == brands
          ? _value._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
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
      lastActiveTab: null == lastActiveTab
          ? _value.lastActiveTab
          : lastActiveTab // ignore: cast_nullable_to_non_nullable
              as int,
      selectedCategoryId: null == selectedCategoryId
          ? _value.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      selectedBrandId: null == selectedBrandId
          ? _value.selectedBrandId
          : selectedBrandId // ignore: cast_nullable_to_non_nullable
              as int,
      priceFilter: null == priceFilter
          ? _value.priceFilter
          : priceFilter // ignore: cast_nullable_to_non_nullable
              as PriceFilter,
    ));
  }
}

/// @nodoc

class _$MainStateImpl extends _MainState {
  const _$MainStateImpl(
      {this.isSearching = false,
      this.isSearchLoading = false,
      this.isCategoriesLoading = false,
      this.isBrandsLoading = false,
      this.query = '',
      final List<ProductData> searchedProducts = const [],
      final List<CategoryData> categories = const [],
      final List<BrandData> brands = const [],
      final List<ShopData> searchedShops = const [],
      final List<BrandData> searchedBrands = const [],
      final List<CategoryData> searchedCategories = const [],
      this.lastActiveTab = 0,
      this.selectedCategoryId = 0,
      this.selectedBrandId = 0,
      this.priceFilter = PriceFilter.byLow})
      : _searchedProducts = searchedProducts,
        _categories = categories,
        _brands = brands,
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
  @override
  @JsonKey()
  final bool isCategoriesLoading;
  @override
  @JsonKey()
  final bool isBrandsLoading;
  @override
  @JsonKey()
  final String query;
  final List<ProductData> _searchedProducts;
  @override
  @JsonKey()
  List<ProductData> get searchedProducts {
    if (_searchedProducts is EqualUnmodifiableListView)
      return _searchedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedProducts);
  }

  final List<CategoryData> _categories;
  @override
  @JsonKey()
  List<CategoryData> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<BrandData> _brands;
  @override
  @JsonKey()
  List<BrandData> get brands {
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
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
  final int lastActiveTab;
  @override
  @JsonKey()
  final int selectedCategoryId;
  @override
  @JsonKey()
  final int selectedBrandId;
  @override
  @JsonKey()
  final PriceFilter priceFilter;

  @override
  String toString() {
    return 'MainState(isSearching: $isSearching, isSearchLoading: $isSearchLoading, isCategoriesLoading: $isCategoriesLoading, isBrandsLoading: $isBrandsLoading, query: $query, searchedProducts: $searchedProducts, categories: $categories, brands: $brands, searchedShops: $searchedShops, searchedBrands: $searchedBrands, searchedCategories: $searchedCategories, lastActiveTab: $lastActiveTab, selectedCategoryId: $selectedCategoryId, selectedBrandId: $selectedBrandId, priceFilter: $priceFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainStateImpl &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isSearchLoading, isSearchLoading) ||
                other.isSearchLoading == isSearchLoading) &&
            (identical(other.isCategoriesLoading, isCategoriesLoading) ||
                other.isCategoriesLoading == isCategoriesLoading) &&
            (identical(other.isBrandsLoading, isBrandsLoading) ||
                other.isBrandsLoading == isBrandsLoading) &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality()
                .equals(other._searchedProducts, _searchedProducts) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._brands, _brands) &&
            const DeepCollectionEquality()
                .equals(other._searchedShops, _searchedShops) &&
            const DeepCollectionEquality()
                .equals(other._searchedBrands, _searchedBrands) &&
            const DeepCollectionEquality()
                .equals(other._searchedCategories, _searchedCategories) &&
            (identical(other.lastActiveTab, lastActiveTab) ||
                other.lastActiveTab == lastActiveTab) &&
            (identical(other.selectedCategoryId, selectedCategoryId) ||
                other.selectedCategoryId == selectedCategoryId) &&
            (identical(other.selectedBrandId, selectedBrandId) ||
                other.selectedBrandId == selectedBrandId) &&
            (identical(other.priceFilter, priceFilter) ||
                other.priceFilter == priceFilter));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isSearching,
      isSearchLoading,
      isCategoriesLoading,
      isBrandsLoading,
      query,
      const DeepCollectionEquality().hash(_searchedProducts),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_brands),
      const DeepCollectionEquality().hash(_searchedShops),
      const DeepCollectionEquality().hash(_searchedBrands),
      const DeepCollectionEquality().hash(_searchedCategories),
      lastActiveTab,
      selectedCategoryId,
      selectedBrandId,
      priceFilter);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      __$$MainStateImplCopyWithImpl<_$MainStateImpl>(this, _$identity);
}

abstract class _MainState extends MainState {
  const factory _MainState(
      {final bool isSearching,
      final bool isSearchLoading,
      final bool isCategoriesLoading,
      final bool isBrandsLoading,
      final String query,
      final List<ProductData> searchedProducts,
      final List<CategoryData> categories,
      final List<BrandData> brands,
      final List<ShopData> searchedShops,
      final List<BrandData> searchedBrands,
      final List<CategoryData> searchedCategories,
      final int lastActiveTab,
      final int selectedCategoryId,
      final int selectedBrandId,
      final PriceFilter priceFilter}) = _$MainStateImpl;
  const _MainState._() : super._();

  @override
  bool get isSearching;
  @override
  bool get isSearchLoading;
  @override
  bool get isCategoriesLoading;
  @override
  bool get isBrandsLoading;
  @override
  String get query;
  @override
  List<ProductData> get searchedProducts;
  @override
  List<CategoryData> get categories;
  @override
  List<BrandData> get brands;
  @override
  List<ShopData> get searchedShops;
  @override
  List<BrandData> get searchedBrands;
  @override
  List<CategoryData> get searchedCategories;
  @override
  int get lastActiveTab;
  @override
  int get selectedCategoryId;
  @override
  int get selectedBrandId;
  @override
  PriceFilter get priceFilter;
  @override
  @JsonKey(ignore: true)
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
