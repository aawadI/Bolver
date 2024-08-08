// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShopListState {
  bool get isBannersLoading => throw _privateConstructorUsedError;
  bool get isCategoriesLoading => throw _privateConstructorUsedError;
  bool get isSavedShopsLoading => throw _privateConstructorUsedError;
  List<BannerData> get banners => throw _privateConstructorUsedError;
  List<ShopData> get savedShops => throw _privateConstructorUsedError;
  List<CategoryData> get categories => throw _privateConstructorUsedError;
  int get activeBanner => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopListStateCopyWith<ShopListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopListStateCopyWith<$Res> {
  factory $ShopListStateCopyWith(
          ShopListState value, $Res Function(ShopListState) then) =
      _$ShopListStateCopyWithImpl<$Res, ShopListState>;
  @useResult
  $Res call(
      {bool isBannersLoading,
      bool isCategoriesLoading,
      bool isSavedShopsLoading,
      List<BannerData> banners,
      List<ShopData> savedShops,
      List<CategoryData> categories,
      int activeBanner});
}

/// @nodoc
class _$ShopListStateCopyWithImpl<$Res, $Val extends ShopListState>
    implements $ShopListStateCopyWith<$Res> {
  _$ShopListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBannersLoading = null,
    Object? isCategoriesLoading = null,
    Object? isSavedShopsLoading = null,
    Object? banners = null,
    Object? savedShops = null,
    Object? categories = null,
    Object? activeBanner = null,
  }) {
    return _then(_value.copyWith(
      isBannersLoading: null == isBannersLoading
          ? _value.isBannersLoading
          : isBannersLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCategoriesLoading: null == isCategoriesLoading
          ? _value.isCategoriesLoading
          : isCategoriesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSavedShopsLoading: null == isSavedShopsLoading
          ? _value.isSavedShopsLoading
          : isSavedShopsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      banners: null == banners
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannerData>,
      savedShops: null == savedShops
          ? _value.savedShops
          : savedShops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      activeBanner: null == activeBanner
          ? _value.activeBanner
          : activeBanner // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopListStateImplCopyWith<$Res>
    implements $ShopListStateCopyWith<$Res> {
  factory _$$ShopListStateImplCopyWith(
          _$ShopListStateImpl value, $Res Function(_$ShopListStateImpl) then) =
      __$$ShopListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isBannersLoading,
      bool isCategoriesLoading,
      bool isSavedShopsLoading,
      List<BannerData> banners,
      List<ShopData> savedShops,
      List<CategoryData> categories,
      int activeBanner});
}

/// @nodoc
class __$$ShopListStateImplCopyWithImpl<$Res>
    extends _$ShopListStateCopyWithImpl<$Res, _$ShopListStateImpl>
    implements _$$ShopListStateImplCopyWith<$Res> {
  __$$ShopListStateImplCopyWithImpl(
      _$ShopListStateImpl _value, $Res Function(_$ShopListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBannersLoading = null,
    Object? isCategoriesLoading = null,
    Object? isSavedShopsLoading = null,
    Object? banners = null,
    Object? savedShops = null,
    Object? categories = null,
    Object? activeBanner = null,
  }) {
    return _then(_$ShopListStateImpl(
      isBannersLoading: null == isBannersLoading
          ? _value.isBannersLoading
          : isBannersLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCategoriesLoading: null == isCategoriesLoading
          ? _value.isCategoriesLoading
          : isCategoriesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSavedShopsLoading: null == isSavedShopsLoading
          ? _value.isSavedShopsLoading
          : isSavedShopsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      banners: null == banners
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannerData>,
      savedShops: null == savedShops
          ? _value._savedShops
          : savedShops // ignore: cast_nullable_to_non_nullable
              as List<ShopData>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      activeBanner: null == activeBanner
          ? _value.activeBanner
          : activeBanner // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ShopListStateImpl extends _ShopListState {
  const _$ShopListStateImpl(
      {this.isBannersLoading = false,
      this.isCategoriesLoading = false,
      this.isSavedShopsLoading = false,
      final List<BannerData> banners = const [],
      final List<ShopData> savedShops = const [],
      final List<CategoryData> categories = const [],
      this.activeBanner = 0})
      : _banners = banners,
        _savedShops = savedShops,
        _categories = categories,
        super._();

  @override
  @JsonKey()
  final bool isBannersLoading;
  @override
  @JsonKey()
  final bool isCategoriesLoading;
  @override
  @JsonKey()
  final bool isSavedShopsLoading;
  final List<BannerData> _banners;
  @override
  @JsonKey()
  List<BannerData> get banners {
    if (_banners is EqualUnmodifiableListView) return _banners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  final List<ShopData> _savedShops;
  @override
  @JsonKey()
  List<ShopData> get savedShops {
    if (_savedShops is EqualUnmodifiableListView) return _savedShops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_savedShops);
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
  final int activeBanner;

  @override
  String toString() {
    return 'ShopListState(isBannersLoading: $isBannersLoading, isCategoriesLoading: $isCategoriesLoading, isSavedShopsLoading: $isSavedShopsLoading, banners: $banners, savedShops: $savedShops, categories: $categories, activeBanner: $activeBanner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopListStateImpl &&
            (identical(other.isBannersLoading, isBannersLoading) ||
                other.isBannersLoading == isBannersLoading) &&
            (identical(other.isCategoriesLoading, isCategoriesLoading) ||
                other.isCategoriesLoading == isCategoriesLoading) &&
            (identical(other.isSavedShopsLoading, isSavedShopsLoading) ||
                other.isSavedShopsLoading == isSavedShopsLoading) &&
            const DeepCollectionEquality().equals(other._banners, _banners) &&
            const DeepCollectionEquality()
                .equals(other._savedShops, _savedShops) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.activeBanner, activeBanner) ||
                other.activeBanner == activeBanner));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isBannersLoading,
      isCategoriesLoading,
      isSavedShopsLoading,
      const DeepCollectionEquality().hash(_banners),
      const DeepCollectionEquality().hash(_savedShops),
      const DeepCollectionEquality().hash(_categories),
      activeBanner);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopListStateImplCopyWith<_$ShopListStateImpl> get copyWith =>
      __$$ShopListStateImplCopyWithImpl<_$ShopListStateImpl>(this, _$identity);
}

abstract class _ShopListState extends ShopListState {
  const factory _ShopListState(
      {final bool isBannersLoading,
      final bool isCategoriesLoading,
      final bool isSavedShopsLoading,
      final List<BannerData> banners,
      final List<ShopData> savedShops,
      final List<CategoryData> categories,
      final int activeBanner}) = _$ShopListStateImpl;
  const _ShopListState._() : super._();

  @override
  bool get isBannersLoading;
  @override
  bool get isCategoriesLoading;
  @override
  bool get isSavedShopsLoading;
  @override
  List<BannerData> get banners;
  @override
  List<ShopData> get savedShops;
  @override
  List<CategoryData> get categories;
  @override
  int get activeBanner;
  @override
  @JsonKey(ignore: true)
  _$$ShopListStateImplCopyWith<_$ShopListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
