// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_shop_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SingleShopState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;
  List<String> get deliveryTimes => throw _privateConstructorUsedError;
  ShopData? get shop => throw _privateConstructorUsedError;
  DateTime? get selectedDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SingleShopStateCopyWith<SingleShopState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleShopStateCopyWith<$Res> {
  factory $SingleShopStateCopyWith(
          SingleShopState value, $Res Function(SingleShopState) then) =
      _$SingleShopStateCopyWithImpl<$Res, SingleShopState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSaved,
      List<String> deliveryTimes,
      ShopData? shop,
      DateTime? selectedDate});
}

/// @nodoc
class _$SingleShopStateCopyWithImpl<$Res, $Val extends SingleShopState>
    implements $SingleShopStateCopyWith<$Res> {
  _$SingleShopStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaved = null,
    Object? deliveryTimes = null,
    Object? shop = freezed,
    Object? selectedDate = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryTimes: null == deliveryTimes
          ? _value.deliveryTimes
          : deliveryTimes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      shop: freezed == shop
          ? _value.shop
          : shop // ignore: cast_nullable_to_non_nullable
              as ShopData?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SingleShopStateImplCopyWith<$Res>
    implements $SingleShopStateCopyWith<$Res> {
  factory _$$SingleShopStateImplCopyWith(_$SingleShopStateImpl value,
          $Res Function(_$SingleShopStateImpl) then) =
      __$$SingleShopStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSaved,
      List<String> deliveryTimes,
      ShopData? shop,
      DateTime? selectedDate});
}

/// @nodoc
class __$$SingleShopStateImplCopyWithImpl<$Res>
    extends _$SingleShopStateCopyWithImpl<$Res, _$SingleShopStateImpl>
    implements _$$SingleShopStateImplCopyWith<$Res> {
  __$$SingleShopStateImplCopyWithImpl(
      _$SingleShopStateImpl _value, $Res Function(_$SingleShopStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaved = null,
    Object? deliveryTimes = null,
    Object? shop = freezed,
    Object? selectedDate = freezed,
  }) {
    return _then(_$SingleShopStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaved: null == isSaved
          ? _value.isSaved
          : isSaved // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveryTimes: null == deliveryTimes
          ? _value._deliveryTimes
          : deliveryTimes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      shop: freezed == shop
          ? _value.shop
          : shop // ignore: cast_nullable_to_non_nullable
              as ShopData?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$SingleShopStateImpl extends _SingleShopState {
  const _$SingleShopStateImpl(
      {this.isLoading = false,
      this.isSaved = false,
      final List<String> deliveryTimes = const [],
      this.shop,
      this.selectedDate})
      : _deliveryTimes = deliveryTimes,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSaved;
  final List<String> _deliveryTimes;
  @override
  @JsonKey()
  List<String> get deliveryTimes {
    if (_deliveryTimes is EqualUnmodifiableListView) return _deliveryTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deliveryTimes);
  }

  @override
  final ShopData? shop;
  @override
  final DateTime? selectedDate;

  @override
  String toString() {
    return 'SingleShopState(isLoading: $isLoading, isSaved: $isSaved, deliveryTimes: $deliveryTimes, shop: $shop, selectedDate: $selectedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleShopStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            const DeepCollectionEquality()
                .equals(other._deliveryTimes, _deliveryTimes) &&
            (identical(other.shop, shop) || other.shop == shop) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSaved,
      const DeepCollectionEquality().hash(_deliveryTimes), shop, selectedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleShopStateImplCopyWith<_$SingleShopStateImpl> get copyWith =>
      __$$SingleShopStateImplCopyWithImpl<_$SingleShopStateImpl>(
          this, _$identity);
}

abstract class _SingleShopState extends SingleShopState {
  const factory _SingleShopState(
      {final bool isLoading,
      final bool isSaved,
      final List<String> deliveryTimes,
      final ShopData? shop,
      final DateTime? selectedDate}) = _$SingleShopStateImpl;
  const _SingleShopState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isSaved;
  @override
  List<String> get deliveryTimes;
  @override
  ShopData? get shop;
  @override
  DateTime? get selectedDate;
  @override
  @JsonKey(ignore: true)
  _$$SingleShopStateImplCopyWith<_$SingleShopStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
