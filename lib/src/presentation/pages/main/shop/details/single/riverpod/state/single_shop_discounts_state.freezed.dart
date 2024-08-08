// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_shop_discounts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SingleShopDiscountsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ProductData> get products => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SingleShopDiscountsStateCopyWith<SingleShopDiscountsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleShopDiscountsStateCopyWith<$Res> {
  factory $SingleShopDiscountsStateCopyWith(SingleShopDiscountsState value,
          $Res Function(SingleShopDiscountsState) then) =
      _$SingleShopDiscountsStateCopyWithImpl<$Res, SingleShopDiscountsState>;
  @useResult
  $Res call({bool isLoading, List<ProductData> products});
}

/// @nodoc
class _$SingleShopDiscountsStateCopyWithImpl<$Res,
        $Val extends SingleShopDiscountsState>
    implements $SingleShopDiscountsStateCopyWith<$Res> {
  _$SingleShopDiscountsStateCopyWithImpl(this._value, this._then);

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
abstract class _$$SingleShopDiscountsStateImplCopyWith<$Res>
    implements $SingleShopDiscountsStateCopyWith<$Res> {
  factory _$$SingleShopDiscountsStateImplCopyWith(
          _$SingleShopDiscountsStateImpl value,
          $Res Function(_$SingleShopDiscountsStateImpl) then) =
      __$$SingleShopDiscountsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<ProductData> products});
}

/// @nodoc
class __$$SingleShopDiscountsStateImplCopyWithImpl<$Res>
    extends _$SingleShopDiscountsStateCopyWithImpl<$Res,
        _$SingleShopDiscountsStateImpl>
    implements _$$SingleShopDiscountsStateImplCopyWith<$Res> {
  __$$SingleShopDiscountsStateImplCopyWithImpl(
      _$SingleShopDiscountsStateImpl _value,
      $Res Function(_$SingleShopDiscountsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? products = null,
  }) {
    return _then(_$SingleShopDiscountsStateImpl(
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

class _$SingleShopDiscountsStateImpl extends _SingleShopDiscountsState {
  const _$SingleShopDiscountsStateImpl(
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
    return 'SingleShopDiscountsState(isLoading: $isLoading, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleShopDiscountsStateImpl &&
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
  _$$SingleShopDiscountsStateImplCopyWith<_$SingleShopDiscountsStateImpl>
      get copyWith => __$$SingleShopDiscountsStateImplCopyWithImpl<
          _$SingleShopDiscountsStateImpl>(this, _$identity);
}

abstract class _SingleShopDiscountsState extends SingleShopDiscountsState {
  const factory _SingleShopDiscountsState(
      {final bool isLoading,
      final List<ProductData> products}) = _$SingleShopDiscountsStateImpl;
  const _SingleShopDiscountsState._() : super._();

  @override
  bool get isLoading;
  @override
  List<ProductData> get products;
  @override
  @JsonKey(ignore: true)
  _$$SingleShopDiscountsStateImplCopyWith<_$SingleShopDiscountsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
