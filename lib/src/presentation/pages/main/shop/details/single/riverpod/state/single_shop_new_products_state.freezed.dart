// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_shop_new_products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SingleShopNewProductsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ProductData> get products => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SingleShopNewProductsStateCopyWith<SingleShopNewProductsState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleShopNewProductsStateCopyWith<$Res> {
  factory $SingleShopNewProductsStateCopyWith(SingleShopNewProductsState value,
          $Res Function(SingleShopNewProductsState) then) =
      _$SingleShopNewProductsStateCopyWithImpl<$Res,
          SingleShopNewProductsState>;
  @useResult
  $Res call({bool isLoading, List<ProductData> products});
}

/// @nodoc
class _$SingleShopNewProductsStateCopyWithImpl<$Res,
        $Val extends SingleShopNewProductsState>
    implements $SingleShopNewProductsStateCopyWith<$Res> {
  _$SingleShopNewProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SingleShopNewProductsStateImplCopyWith<$Res>
    implements $SingleShopNewProductsStateCopyWith<$Res> {
  factory _$$SingleShopNewProductsStateImplCopyWith(
          _$SingleShopNewProductsStateImpl value,
          $Res Function(_$SingleShopNewProductsStateImpl) then) =
      __$$SingleShopNewProductsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<ProductData> products});
}

/// @nodoc
class __$$SingleShopNewProductsStateImplCopyWithImpl<$Res>
    extends _$SingleShopNewProductsStateCopyWithImpl<$Res,
        _$SingleShopNewProductsStateImpl>
    implements _$$SingleShopNewProductsStateImplCopyWith<$Res> {
  __$$SingleShopNewProductsStateImplCopyWithImpl(
      _$SingleShopNewProductsStateImpl _value,
      $Res Function(_$SingleShopNewProductsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? products = null,
  }) {
    return _then(_$SingleShopNewProductsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductData>,
    ));
  }
}

/// @nodoc

class _$SingleShopNewProductsStateImpl extends _SingleShopNewProductsState {
  const _$SingleShopNewProductsStateImpl(
      {this.isLoading = false, final List<ProductData> products = const []})
      : _products = products,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<ProductData> _products;
  @override
  @JsonKey()
  List<ProductData> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'SingleShopNewProductsState(isLoading: $isLoading, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleShopNewProductsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleShopNewProductsStateImplCopyWith<_$SingleShopNewProductsStateImpl>
      get copyWith => __$$SingleShopNewProductsStateImplCopyWithImpl<
          _$SingleShopNewProductsStateImpl>(this, _$identity);
}

abstract class _SingleShopNewProductsState extends SingleShopNewProductsState {
  const factory _SingleShopNewProductsState(
      {final bool isLoading,
      final List<ProductData> products}) = _$SingleShopNewProductsStateImpl;
  const _SingleShopNewProductsState._() : super._();

  @override
  bool get isLoading;
  @override
  List<ProductData> get products;
  @override
  @JsonKey(ignore: true)
  _$$SingleShopNewProductsStateImplCopyWith<_$SingleShopNewProductsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
