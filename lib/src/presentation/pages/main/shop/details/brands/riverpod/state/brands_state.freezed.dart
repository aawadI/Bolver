// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'brands_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BrandsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  bool get isSearchLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  List<BrandData> get brands => throw _privateConstructorUsedError;
  List<BrandData> get searchedBrands => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BrandsStateCopyWith<BrandsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandsStateCopyWith<$Res> {
  factory $BrandsStateCopyWith(
          BrandsState value, $Res Function(BrandsState) then) =
      _$BrandsStateCopyWithImpl<$Res, BrandsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSearching,
      bool isSearchLoading,
      bool isMoreLoading,
      List<BrandData> brands,
      List<BrandData> searchedBrands,
      String query});
}

/// @nodoc
class _$BrandsStateCopyWithImpl<$Res, $Val extends BrandsState>
    implements $BrandsStateCopyWith<$Res> {
  _$BrandsStateCopyWithImpl(this._value, this._then);

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
    Object? isMoreLoading = null,
    Object? brands = null,
    Object? searchedBrands = null,
    Object? query = null,
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
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      brands: null == brands
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
      searchedBrands: null == searchedBrands
          ? _value.searchedBrands
          : searchedBrands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BrandsStateImplCopyWith<$Res>
    implements $BrandsStateCopyWith<$Res> {
  factory _$$BrandsStateImplCopyWith(
          _$BrandsStateImpl value, $Res Function(_$BrandsStateImpl) then) =
      __$$BrandsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSearching,
      bool isSearchLoading,
      bool isMoreLoading,
      List<BrandData> brands,
      List<BrandData> searchedBrands,
      String query});
}

/// @nodoc
class __$$BrandsStateImplCopyWithImpl<$Res>
    extends _$BrandsStateCopyWithImpl<$Res, _$BrandsStateImpl>
    implements _$$BrandsStateImplCopyWith<$Res> {
  __$$BrandsStateImplCopyWithImpl(
      _$BrandsStateImpl _value, $Res Function(_$BrandsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSearching = null,
    Object? isSearchLoading = null,
    Object? isMoreLoading = null,
    Object? brands = null,
    Object? searchedBrands = null,
    Object? query = null,
  }) {
    return _then(_$BrandsStateImpl(
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
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      brands: null == brands
          ? _value._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
      searchedBrands: null == searchedBrands
          ? _value._searchedBrands
          : searchedBrands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BrandsStateImpl extends _BrandsState {
  const _$BrandsStateImpl(
      {this.isLoading = false,
      this.isSearching = false,
      this.isSearchLoading = false,
      this.isMoreLoading = false,
      final List<BrandData> brands = const [],
      final List<BrandData> searchedBrands = const [],
      this.query = ''})
      : _brands = brands,
        _searchedBrands = searchedBrands,
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
  final bool isMoreLoading;
  final List<BrandData> _brands;
  @override
  @JsonKey()
  List<BrandData> get brands {
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
  }

  final List<BrandData> _searchedBrands;
  @override
  @JsonKey()
  List<BrandData> get searchedBrands {
    if (_searchedBrands is EqualUnmodifiableListView) return _searchedBrands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedBrands);
  }

  @override
  @JsonKey()
  final String query;

  @override
  String toString() {
    return 'BrandsState(isLoading: $isLoading, isSearching: $isSearching, isSearchLoading: $isSearchLoading, isMoreLoading: $isMoreLoading, brands: $brands, searchedBrands: $searchedBrands, query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BrandsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.isSearchLoading, isSearchLoading) ||
                other.isSearchLoading == isSearchLoading) &&
            (identical(other.isMoreLoading, isMoreLoading) ||
                other.isMoreLoading == isMoreLoading) &&
            const DeepCollectionEquality().equals(other._brands, _brands) &&
            const DeepCollectionEquality()
                .equals(other._searchedBrands, _searchedBrands) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isSearching,
      isSearchLoading,
      isMoreLoading,
      const DeepCollectionEquality().hash(_brands),
      const DeepCollectionEquality().hash(_searchedBrands),
      query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BrandsStateImplCopyWith<_$BrandsStateImpl> get copyWith =>
      __$$BrandsStateImplCopyWithImpl<_$BrandsStateImpl>(this, _$identity);
}

abstract class _BrandsState extends BrandsState {
  const factory _BrandsState(
      {final bool isLoading,
      final bool isSearching,
      final bool isSearchLoading,
      final bool isMoreLoading,
      final List<BrandData> brands,
      final List<BrandData> searchedBrands,
      final String query}) = _$BrandsStateImpl;
  const _BrandsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isSearching;
  @override
  bool get isSearchLoading;
  @override
  bool get isMoreLoading;
  @override
  List<BrandData> get brands;
  @override
  List<BrandData> get searchedBrands;
  @override
  String get query;
  @override
  @JsonKey(ignore: true)
  _$$BrandsStateImplCopyWith<_$BrandsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
