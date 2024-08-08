// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profitable_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfitableState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  bool get isSearchLoading => throw _privateConstructorUsedError;
  List<ProductData> get products => throw _privateConstructorUsedError;
  List<ProductData> get searchedProducts => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  ListAlignment get listAlignment => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfitableStateCopyWith<ProfitableState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfitableStateCopyWith<$Res> {
  factory $ProfitableStateCopyWith(
          ProfitableState value, $Res Function(ProfitableState) then) =
      _$ProfitableStateCopyWithImpl<$Res, ProfitableState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      bool isSearching,
      bool isSearchLoading,
      List<ProductData> products,
      List<ProductData> searchedProducts,
      String query,
      ListAlignment listAlignment});
}

/// @nodoc
class _$ProfitableStateCopyWithImpl<$Res, $Val extends ProfitableState>
    implements $ProfitableStateCopyWith<$Res> {
  _$ProfitableStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? products = null,
    Object? searchedProducts = null,
    Object? query = null,
    Object? listAlignment = null,
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
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchLoading: null == isSearchLoading
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      searchedProducts: null == searchedProducts
          ? _value.searchedProducts
          : searchedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      listAlignment: null == listAlignment
          ? _value.listAlignment
          : listAlignment // ignore: cast_nullable_to_non_nullable
              as ListAlignment,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfitableStateImplCopyWith<$Res>
    implements $ProfitableStateCopyWith<$Res> {
  factory _$$ProfitableStateImplCopyWith(_$ProfitableStateImpl value,
          $Res Function(_$ProfitableStateImpl) then) =
      __$$ProfitableStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      bool isSearching,
      bool isSearchLoading,
      List<ProductData> products,
      List<ProductData> searchedProducts,
      String query,
      ListAlignment listAlignment});
}

/// @nodoc
class __$$ProfitableStateImplCopyWithImpl<$Res>
    extends _$ProfitableStateCopyWithImpl<$Res, _$ProfitableStateImpl>
    implements _$$ProfitableStateImplCopyWith<$Res> {
  __$$ProfitableStateImplCopyWithImpl(
      _$ProfitableStateImpl _value, $Res Function(_$ProfitableStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? products = null,
    Object? searchedProducts = null,
    Object? query = null,
    Object? listAlignment = null,
  }) {
    return _then(_$ProfitableStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchLoading: null == isSearchLoading
          ? _value.isSearchLoading
          : isSearchLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      searchedProducts: null == searchedProducts
          ? _value._searchedProducts
          : searchedProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      listAlignment: null == listAlignment
          ? _value.listAlignment
          : listAlignment // ignore: cast_nullable_to_non_nullable
              as ListAlignment,
    ));
  }
}

/// @nodoc

class _$ProfitableStateImpl extends _ProfitableState {
  const _$ProfitableStateImpl(
      {this.isLoading = false,
      this.isMoreLoading = false,
      this.isSearching = false,
      this.isSearchLoading = false,
      final List<ProductData> products = const [],
      final List<ProductData> searchedProducts = const [],
      this.query = '',
      this.listAlignment = ListAlignment.vertically})
      : _products = products,
        _searchedProducts = searchedProducts,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isMoreLoading;
  @override
  @JsonKey()
  final bool isSearching;
  @override
  @JsonKey()
  final bool isSearchLoading;
  final List<ProductData> _products;
  @override
  @JsonKey()
  List<ProductData> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<ProductData> _searchedProducts;
  @override
  @JsonKey()
  List<ProductData> get searchedProducts {
    if (_searchedProducts is EqualUnmodifiableListView)
      return _searchedProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedProducts);
  }

  @override
  @JsonKey()
  final String query;
  @override
  @JsonKey()
  final ListAlignment listAlignment;

  @override
  String toString() {
    return 'ProfitableState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, isSearching: $isSearching, isSearchLoading: $isSearchLoading, products: $products, searchedProducts: $searchedProducts, query: $query, listAlignment: $listAlignment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfitableStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isMoreLoading, isMoreLoading) ||
                other.isMoreLoading == isMoreLoading) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isSearchLoading, isSearchLoading) ||
                other.isSearchLoading == isSearchLoading) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._searchedProducts, _searchedProducts) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.listAlignment, listAlignment) ||
                other.listAlignment == listAlignment));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isMoreLoading,
      isSearching,
      isSearchLoading,
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_searchedProducts),
      query,
      listAlignment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfitableStateImplCopyWith<_$ProfitableStateImpl> get copyWith =>
      __$$ProfitableStateImplCopyWithImpl<_$ProfitableStateImpl>(
          this, _$identity);
}

abstract class _ProfitableState extends ProfitableState {
  const factory _ProfitableState(
      {final bool isLoading,
      final bool isMoreLoading,
      final bool isSearching,
      final bool isSearchLoading,
      final List<ProductData> products,
      final List<ProductData> searchedProducts,
      final String query,
      final ListAlignment listAlignment}) = _$ProfitableStateImpl;
  const _ProfitableState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  bool get isSearching;
  @override
  bool get isSearchLoading;
  @override
  List<ProductData> get products;
  @override
  List<ProductData> get searchedProducts;
  @override
  String get query;
  @override
  ListAlignment get listAlignment;
  @override
  @JsonKey(ignore: true)
  _$$ProfitableStateImplCopyWith<_$ProfitableStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
