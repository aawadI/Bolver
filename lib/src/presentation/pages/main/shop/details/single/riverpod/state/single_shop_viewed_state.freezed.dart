// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_shop_viewed_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SingleShopViewedState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<ProductData> get products => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SingleShopViewedStateCopyWith<SingleShopViewedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleShopViewedStateCopyWith<$Res> {
  factory $SingleShopViewedStateCopyWith(SingleShopViewedState value,
          $Res Function(SingleShopViewedState) then) =
      _$SingleShopViewedStateCopyWithImpl<$Res, SingleShopViewedState>;
  @useResult
  $Res call({bool isLoading, List<ProductData> products});
}

/// @nodoc
class _$SingleShopViewedStateCopyWithImpl<$Res,
        $Val extends SingleShopViewedState>
    implements $SingleShopViewedStateCopyWith<$Res> {
  _$SingleShopViewedStateCopyWithImpl(this._value, this._then);

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
abstract class _$$SingleShopViewedStateImplCopyWith<$Res>
    implements $SingleShopViewedStateCopyWith<$Res> {
  factory _$$SingleShopViewedStateImplCopyWith(
          _$SingleShopViewedStateImpl value,
          $Res Function(_$SingleShopViewedStateImpl) then) =
      __$$SingleShopViewedStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<ProductData> products});
}

/// @nodoc
class __$$SingleShopViewedStateImplCopyWithImpl<$Res>
    extends _$SingleShopViewedStateCopyWithImpl<$Res,
        _$SingleShopViewedStateImpl>
    implements _$$SingleShopViewedStateImplCopyWith<$Res> {
  __$$SingleShopViewedStateImplCopyWithImpl(_$SingleShopViewedStateImpl _value,
      $Res Function(_$SingleShopViewedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? products = null,
  }) {
    return _then(_$SingleShopViewedStateImpl(
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

class _$SingleShopViewedStateImpl extends _SingleShopViewedState {
  const _$SingleShopViewedStateImpl(
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
    return 'SingleShopViewedState(isLoading: $isLoading, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleShopViewedStateImpl &&
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
  _$$SingleShopViewedStateImplCopyWith<_$SingleShopViewedStateImpl>
      get copyWith => __$$SingleShopViewedStateImplCopyWithImpl<
          _$SingleShopViewedStateImpl>(this, _$identity);
}

abstract class _SingleShopViewedState extends SingleShopViewedState {
  const factory _SingleShopViewedState(
      {final bool isLoading,
      final List<ProductData> products}) = _$SingleShopViewedStateImpl;
  const _SingleShopViewedState._() : super._();

  @override
  bool get isLoading;
  @override
  List<ProductData> get products;
  @override
  @JsonKey(ignore: true)
  _$$SingleShopViewedStateImplCopyWith<_$SingleShopViewedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
