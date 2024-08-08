// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_all_products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeAllProductsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  int get totalProductsCount => throw _privateConstructorUsedError;
  List<AllProductData> get products => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeAllProductsStateCopyWith<HomeAllProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeAllProductsStateCopyWith<$Res> {
  factory $HomeAllProductsStateCopyWith(HomeAllProductsState value,
          $Res Function(HomeAllProductsState) then) =
      _$HomeAllProductsStateCopyWithImpl<$Res, HomeAllProductsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      int totalProductsCount,
      List<AllProductData> products});
}

/// @nodoc
class _$HomeAllProductsStateCopyWithImpl<$Res,
        $Val extends HomeAllProductsState>
    implements $HomeAllProductsStateCopyWith<$Res> {
  _$HomeAllProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? totalProductsCount = null,
    Object? products = null,
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
      totalProductsCount: null == totalProductsCount
          ? _value.totalProductsCount
          : totalProductsCount // ignore: cast_nullable_to_non_nullable
              as int,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<AllProductData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeAllProductsStateImplCopyWith<$Res>
    implements $HomeAllProductsStateCopyWith<$Res> {
  factory _$$HomeAllProductsStateImplCopyWith(_$HomeAllProductsStateImpl value,
          $Res Function(_$HomeAllProductsStateImpl) then) =
      __$$HomeAllProductsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      int totalProductsCount,
      List<AllProductData> products});
}

/// @nodoc
class __$$HomeAllProductsStateImplCopyWithImpl<$Res>
    extends _$HomeAllProductsStateCopyWithImpl<$Res, _$HomeAllProductsStateImpl>
    implements _$$HomeAllProductsStateImplCopyWith<$Res> {
  __$$HomeAllProductsStateImplCopyWithImpl(_$HomeAllProductsStateImpl _value,
      $Res Function(_$HomeAllProductsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? totalProductsCount = null,
    Object? products = null,
  }) {
    return _then(_$HomeAllProductsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      totalProductsCount: null == totalProductsCount
          ? _value.totalProductsCount
          : totalProductsCount // ignore: cast_nullable_to_non_nullable
              as int,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<AllProductData>,
    ));
  }
}

/// @nodoc

class _$HomeAllProductsStateImpl extends _HomeAllProductsState {
  const _$HomeAllProductsStateImpl(
      {this.isLoading = false,
      this.isMoreLoading = false,
      this.totalProductsCount = 0,
      final List<AllProductData> products = const []})
      : _products = products,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isMoreLoading;
  @override
  @JsonKey()
  final int totalProductsCount;
  final List<AllProductData> _products;
  @override
  @JsonKey()
  List<AllProductData> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'HomeAllProductsState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, totalProductsCount: $totalProductsCount, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeAllProductsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isMoreLoading, isMoreLoading) ||
                other.isMoreLoading == isMoreLoading) &&
            (identical(other.totalProductsCount, totalProductsCount) ||
                other.totalProductsCount == totalProductsCount) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isMoreLoading,
      totalProductsCount, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeAllProductsStateImplCopyWith<_$HomeAllProductsStateImpl>
      get copyWith =>
          __$$HomeAllProductsStateImplCopyWithImpl<_$HomeAllProductsStateImpl>(
              this, _$identity);
}

abstract class _HomeAllProductsState extends HomeAllProductsState {
  const factory _HomeAllProductsState(
      {final bool isLoading,
      final bool isMoreLoading,
      final int totalProductsCount,
      final List<AllProductData> products}) = _$HomeAllProductsStateImpl;
  const _HomeAllProductsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  int get totalProductsCount;
  @override
  List<AllProductData> get products;
  @override
  @JsonKey(ignore: true)
  _$$HomeAllProductsStateImplCopyWith<_$HomeAllProductsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
