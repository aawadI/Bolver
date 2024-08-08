// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoriesState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  bool get isSearchLoading => throw _privateConstructorUsedError;
  List<ProductData> get searchedProducts => throw _privateConstructorUsedError;
  List<CategoryData> get searchedCategories =>
      throw _privateConstructorUsedError;
  List<CategoryData> get categories => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  int? get categoryId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoriesStateCopyWith<CategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesStateCopyWith<$Res> {
  factory $CategoriesStateCopyWith(
          CategoriesState value, $Res Function(CategoriesState) then) =
      _$CategoriesStateCopyWithImpl<$Res, CategoriesState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSearching,
      bool isSearchLoading,
      List<ProductData> searchedProducts,
      List<CategoryData> searchedCategories,
      List<CategoryData> categories,
      String query,
      int? categoryId});
}

/// @nodoc
class _$CategoriesStateCopyWithImpl<$Res, $Val extends CategoriesState>
    implements $CategoriesStateCopyWith<$Res> {
  _$CategoriesStateCopyWithImpl(this._value, this._then);

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
    Object? searchedProducts = null,
    Object? searchedCategories = null,
    Object? categories = null,
    Object? query = null,
    Object? categoryId = freezed,
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
      searchedProducts: null == searchedProducts
          ? _value.searchedProducts
          : searchedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      searchedCategories: null == searchedCategories
          ? _value.searchedCategories
          : searchedCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoriesStateImplCopyWith<$Res>
    implements $CategoriesStateCopyWith<$Res> {
  factory _$$CategoriesStateImplCopyWith(_$CategoriesStateImpl value,
          $Res Function(_$CategoriesStateImpl) then) =
      __$$CategoriesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSearching,
      bool isSearchLoading,
      List<ProductData> searchedProducts,
      List<CategoryData> searchedCategories,
      List<CategoryData> categories,
      String query,
      int? categoryId});
}

/// @nodoc
class __$$CategoriesStateImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$CategoriesStateImpl>
    implements _$$CategoriesStateImplCopyWith<$Res> {
  __$$CategoriesStateImplCopyWithImpl(
      _$CategoriesStateImpl _value, $Res Function(_$CategoriesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? searchedProducts = null,
    Object? searchedCategories = null,
    Object? categories = null,
    Object? query = null,
    Object? categoryId = freezed,
  }) {
    return _then(_$CategoriesStateImpl(
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
      searchedProducts: null == searchedProducts
          ? _value._searchedProducts
          : searchedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      searchedCategories: null == searchedCategories
          ? _value._searchedCategories
          : searchedCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CategoriesStateImpl extends _CategoriesState {
  const _$CategoriesStateImpl(
      {this.isLoading = false,
      this.isSearching = false,
      this.isSearchLoading = false,
      final List<ProductData> searchedProducts = const [],
      final List<CategoryData> searchedCategories = const [],
      final List<CategoryData> categories = const [],
      this.query = '',
      this.categoryId = null})
      : _searchedProducts = searchedProducts,
        _searchedCategories = searchedCategories,
        _categories = categories,
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
  final List<ProductData> _searchedProducts;
  @override
  @JsonKey()
  List<ProductData> get searchedProducts {
    if (_searchedProducts is EqualUnmodifiableListView)
      return _searchedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedProducts);
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

  final List<CategoryData> _categories;
  @override
  @JsonKey()
  List<CategoryData> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final int? categoryId;

  @override
  String toString() {
    return 'CategoriesState(isLoading: $isLoading, isSearching: $isSearching, isSearchLoading: $isSearchLoading, searchedProducts: $searchedProducts, searchedCategories: $searchedCategories, categories: $categories, query: $query, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoriesStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isSearchLoading, isSearchLoading) ||
                other.isSearchLoading == isSearchLoading) &&
            const DeepCollectionEquality()
                .equals(other._searchedProducts, _searchedProducts) &&
            const DeepCollectionEquality()
                .equals(other._searchedCategories, _searchedCategories) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSearching,
      isSearchLoading,
      const DeepCollectionEquality().hash(_searchedProducts),
      const DeepCollectionEquality().hash(_searchedCategories),
      const DeepCollectionEquality().hash(_categories),
      query,
      categoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoriesStateImplCopyWith<_$CategoriesStateImpl> get copyWith =>
      __$$CategoriesStateImplCopyWithImpl<_$CategoriesStateImpl>(
          this, _$identity);
}

abstract class _CategoriesState extends CategoriesState {
  const factory _CategoriesState(
      {final bool isLoading,
      final bool isSearching,
      final bool isSearchLoading,
      final List<ProductData> searchedProducts,
      final List<CategoryData> searchedCategories,
      final List<CategoryData> categories,
      final String query,
      final int? categoryId}) = _$CategoriesStateImpl;
  const _CategoriesState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isSearching;
  @override
  bool get isSearchLoading;
  @override
  List<ProductData> get searchedProducts;
  @override
  List<CategoryData> get searchedCategories;
  @override
  List<CategoryData> get categories;
  @override
  String get query;
  @override
  int? get categoryId;
  @override
  @JsonKey(ignore: true)
  _$$CategoriesStateImplCopyWith<_$CategoriesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
