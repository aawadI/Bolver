// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_details_search_filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShopDetailsSearchFilterState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<BrandData> get brands => throw _privateConstructorUsedError;
  int get brandCount => throw _privateConstructorUsedError;
  int get selectedBrandId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopDetailsSearchFilterStateCopyWith<ShopDetailsSearchFilterState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopDetailsSearchFilterStateCopyWith<$Res> {
  factory $ShopDetailsSearchFilterStateCopyWith(
          ShopDetailsSearchFilterState value,
          $Res Function(ShopDetailsSearchFilterState) then) =
      _$ShopDetailsSearchFilterStateCopyWithImpl<$Res,
          ShopDetailsSearchFilterState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<BrandData> brands,
      int brandCount,
      int selectedBrandId});
}

/// @nodoc
class _$ShopDetailsSearchFilterStateCopyWithImpl<$Res,
        $Val extends ShopDetailsSearchFilterState>
    implements $ShopDetailsSearchFilterStateCopyWith<$Res> {
  _$ShopDetailsSearchFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? brands = null,
    Object? brandCount = null,
    Object? selectedBrandId = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      brands: null == brands
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
      brandCount: null == brandCount
          ? _value.brandCount
          : brandCount // ignore: cast_nullable_to_non_nullable
              as int,
      selectedBrandId: null == selectedBrandId
          ? _value.selectedBrandId
          : selectedBrandId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopDetailsSearchFilterStateImplCopyWith<$Res>
    implements $ShopDetailsSearchFilterStateCopyWith<$Res> {
  factory _$$ShopDetailsSearchFilterStateImplCopyWith(
          _$ShopDetailsSearchFilterStateImpl value,
          $Res Function(_$ShopDetailsSearchFilterStateImpl) then) =
      __$$ShopDetailsSearchFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<BrandData> brands,
      int brandCount,
      int selectedBrandId});
}

/// @nodoc
class __$$ShopDetailsSearchFilterStateImplCopyWithImpl<$Res>
    extends _$ShopDetailsSearchFilterStateCopyWithImpl<$Res,
        _$ShopDetailsSearchFilterStateImpl>
    implements _$$ShopDetailsSearchFilterStateImplCopyWith<$Res> {
  __$$ShopDetailsSearchFilterStateImplCopyWithImpl(
      _$ShopDetailsSearchFilterStateImpl _value,
      $Res Function(_$ShopDetailsSearchFilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? brands = null,
    Object? brandCount = null,
    Object? selectedBrandId = null,
  }) {
    return _then(_$ShopDetailsSearchFilterStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      brands: null == brands
          ? _value._brands
          : brands // ignore: cast_nullable_to_non_nullable
              as List<BrandData>,
      brandCount: null == brandCount
          ? _value.brandCount
          : brandCount // ignore: cast_nullable_to_non_nullable
              as int,
      selectedBrandId: null == selectedBrandId
          ? _value.selectedBrandId
          : selectedBrandId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ShopDetailsSearchFilterStateImpl extends _ShopDetailsSearchFilterState {
  const _$ShopDetailsSearchFilterStateImpl(
      {this.isLoading = false,
      final List<BrandData> brands = const [],
      this.brandCount = 10,
      this.selectedBrandId = 0})
      : _brands = brands,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<BrandData> _brands;
  @override
  @JsonKey()
  List<BrandData> get brands {
    if (_brands is EqualUnmodifiableListView) return _brands;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brands);
  }

  @override
  @JsonKey()
  final int brandCount;
  @override
  @JsonKey()
  final int selectedBrandId;

  @override
  String toString() {
    return 'ShopDetailsSearchFilterState(isLoading: $isLoading, brands: $brands, brandCount: $brandCount, selectedBrandId: $selectedBrandId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopDetailsSearchFilterStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._brands, _brands) &&
            (identical(other.brandCount, brandCount) ||
                other.brandCount == brandCount) &&
            (identical(other.selectedBrandId, selectedBrandId) ||
                other.selectedBrandId == selectedBrandId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_brands),
      brandCount,
      selectedBrandId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopDetailsSearchFilterStateImplCopyWith<
          _$ShopDetailsSearchFilterStateImpl>
      get copyWith => __$$ShopDetailsSearchFilterStateImplCopyWithImpl<
          _$ShopDetailsSearchFilterStateImpl>(this, _$identity);
}

abstract class _ShopDetailsSearchFilterState
    extends ShopDetailsSearchFilterState {
  const factory _ShopDetailsSearchFilterState(
      {final bool isLoading,
      final List<BrandData> brands,
      final int brandCount,
      final int selectedBrandId}) = _$ShopDetailsSearchFilterStateImpl;
  const _ShopDetailsSearchFilterState._() : super._();

  @override
  bool get isLoading;
  @override
  List<BrandData> get brands;
  @override
  int get brandCount;
  @override
  int get selectedBrandId;
  @override
  @JsonKey(ignore: true)
  _$$ShopDetailsSearchFilterStateImplCopyWith<
          _$ShopDetailsSearchFilterStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
