// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeliveryState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<NewDeliveryData> get deliveries => throw _privateConstructorUsedError;
  int get addressIndex => throw _privateConstructorUsedError;
  int get selectedDeliveryIndex => throw _privateConstructorUsedError;
  ShippingDeliveryVisibilityType get visibilityType =>
      throw _privateConstructorUsedError;
  DeliveryTypeEnum get selectedDeliveryType =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeliveryStateCopyWith<DeliveryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryStateCopyWith<$Res> {
  factory $DeliveryStateCopyWith(
          DeliveryState value, $Res Function(DeliveryState) then) =
      _$DeliveryStateCopyWithImpl<$Res, DeliveryState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<NewDeliveryData> deliveries,
      int addressIndex,
      int selectedDeliveryIndex,
      ShippingDeliveryVisibilityType visibilityType,
      DeliveryTypeEnum selectedDeliveryType});
}

/// @nodoc
class _$DeliveryStateCopyWithImpl<$Res, $Val extends DeliveryState>
    implements $DeliveryStateCopyWith<$Res> {
  _$DeliveryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? deliveries = null,
    Object? addressIndex = null,
    Object? selectedDeliveryIndex = null,
    Object? visibilityType = null,
    Object? selectedDeliveryType = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveries: null == deliveries
          ? _value.deliveries
          : deliveries // ignore: cast_nullable_to_non_nullable
              as List<NewDeliveryData>,
      addressIndex: null == addressIndex
          ? _value.addressIndex
          : addressIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedDeliveryIndex: null == selectedDeliveryIndex
          ? _value.selectedDeliveryIndex
          : selectedDeliveryIndex // ignore: cast_nullable_to_non_nullable
              as int,
      visibilityType: null == visibilityType
          ? _value.visibilityType
          : visibilityType // ignore: cast_nullable_to_non_nullable
              as ShippingDeliveryVisibilityType,
      selectedDeliveryType: null == selectedDeliveryType
          ? _value.selectedDeliveryType
          : selectedDeliveryType // ignore: cast_nullable_to_non_nullable
              as DeliveryTypeEnum,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryStateImplCopyWith<$Res>
    implements $DeliveryStateCopyWith<$Res> {
  factory _$$DeliveryStateImplCopyWith(
          _$DeliveryStateImpl value, $Res Function(_$DeliveryStateImpl) then) =
      __$$DeliveryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<NewDeliveryData> deliveries,
      int addressIndex,
      int selectedDeliveryIndex,
      ShippingDeliveryVisibilityType visibilityType,
      DeliveryTypeEnum selectedDeliveryType});
}

/// @nodoc
class __$$DeliveryStateImplCopyWithImpl<$Res>
    extends _$DeliveryStateCopyWithImpl<$Res, _$DeliveryStateImpl>
    implements _$$DeliveryStateImplCopyWith<$Res> {
  __$$DeliveryStateImplCopyWithImpl(
      _$DeliveryStateImpl _value, $Res Function(_$DeliveryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? deliveries = null,
    Object? addressIndex = null,
    Object? selectedDeliveryIndex = null,
    Object? visibilityType = null,
    Object? selectedDeliveryType = null,
  }) {
    return _then(_$DeliveryStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      deliveries: null == deliveries
          ? _value._deliveries
          : deliveries // ignore: cast_nullable_to_non_nullable
              as List<NewDeliveryData>,
      addressIndex: null == addressIndex
          ? _value.addressIndex
          : addressIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedDeliveryIndex: null == selectedDeliveryIndex
          ? _value.selectedDeliveryIndex
          : selectedDeliveryIndex // ignore: cast_nullable_to_non_nullable
              as int,
      visibilityType: null == visibilityType
          ? _value.visibilityType
          : visibilityType // ignore: cast_nullable_to_non_nullable
              as ShippingDeliveryVisibilityType,
      selectedDeliveryType: null == selectedDeliveryType
          ? _value.selectedDeliveryType
          : selectedDeliveryType // ignore: cast_nullable_to_non_nullable
              as DeliveryTypeEnum,
    ));
  }
}

/// @nodoc

class _$DeliveryStateImpl extends _DeliveryState {
  const _$DeliveryStateImpl(
      {this.isLoading = false,
      final List<NewDeliveryData> deliveries = const [],
      this.addressIndex = 0,
      this.selectedDeliveryIndex = 0,
      this.visibilityType = ShippingDeliveryVisibilityType.cantOrder,
      this.selectedDeliveryType = DeliveryTypeEnum.delivery})
      : _deliveries = deliveries,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<NewDeliveryData> _deliveries;
  @override
  @JsonKey()
  List<NewDeliveryData> get deliveries {
    if (_deliveries is EqualUnmodifiableListView) return _deliveries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deliveries);
  }

  @override
  @JsonKey()
  final int addressIndex;
  @override
  @JsonKey()
  final int selectedDeliveryIndex;
  @override
  @JsonKey()
  final ShippingDeliveryVisibilityType visibilityType;
  @override
  @JsonKey()
  final DeliveryTypeEnum selectedDeliveryType;

  @override
  String toString() {
    return 'DeliveryState(isLoading: $isLoading, deliveries: $deliveries, addressIndex: $addressIndex, selectedDeliveryIndex: $selectedDeliveryIndex, visibilityType: $visibilityType, selectedDeliveryType: $selectedDeliveryType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._deliveries, _deliveries) &&
            (identical(other.addressIndex, addressIndex) ||
                other.addressIndex == addressIndex) &&
            (identical(other.selectedDeliveryIndex, selectedDeliveryIndex) ||
                other.selectedDeliveryIndex == selectedDeliveryIndex) &&
            (identical(other.visibilityType, visibilityType) ||
                other.visibilityType == visibilityType) &&
            (identical(other.selectedDeliveryType, selectedDeliveryType) ||
                other.selectedDeliveryType == selectedDeliveryType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_deliveries),
      addressIndex,
      selectedDeliveryIndex,
      visibilityType,
      selectedDeliveryType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryStateImplCopyWith<_$DeliveryStateImpl> get copyWith =>
      __$$DeliveryStateImplCopyWithImpl<_$DeliveryStateImpl>(this, _$identity);
}

abstract class _DeliveryState extends DeliveryState {
  const factory _DeliveryState(
      {final bool isLoading,
      final List<NewDeliveryData> deliveries,
      final int addressIndex,
      final int selectedDeliveryIndex,
      final ShippingDeliveryVisibilityType visibilityType,
      final DeliveryTypeEnum selectedDeliveryType}) = _$DeliveryStateImpl;
  const _DeliveryState._() : super._();

  @override
  bool get isLoading;
  @override
  List<NewDeliveryData> get deliveries;
  @override
  int get addressIndex;
  @override
  int get selectedDeliveryIndex;
  @override
  ShippingDeliveryVisibilityType get visibilityType;
  @override
  DeliveryTypeEnum get selectedDeliveryType;
  @override
  @JsonKey(ignore: true)
  _$$DeliveryStateImplCopyWith<_$DeliveryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
