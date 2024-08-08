// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeCategoriesState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<CategoryData> get categories => throw _privateConstructorUsedError;
  List<CategoryData> get subCategories => throw _privateConstructorUsedError;
  int get selectedCategoryId => throw _privateConstructorUsedError;
  CategoryData? get selectedCategory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeCategoriesStateCopyWith<HomeCategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeCategoriesStateCopyWith<$Res> {
  factory $HomeCategoriesStateCopyWith(
          HomeCategoriesState value, $Res Function(HomeCategoriesState) then) =
      _$HomeCategoriesStateCopyWithImpl<$Res, HomeCategoriesState>;
  @useResult
  $Res call(
      {bool isLoading,
      List<CategoryData> categories,
      List<CategoryData> subCategories,
      int selectedCategoryId,
      CategoryData? selectedCategory});
}

/// @nodoc
class _$HomeCategoriesStateCopyWithImpl<$Res, $Val extends HomeCategoriesState>
    implements $HomeCategoriesStateCopyWith<$Res> {
  _$HomeCategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
    Object? subCategories = null,
    Object? selectedCategoryId = null,
    Object? selectedCategory = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      subCategories: null == subCategories
          ? _value.subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      selectedCategoryId: null == selectedCategoryId
          ? _value.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeCategoriesStateImplCopyWith<$Res>
    implements $HomeCategoriesStateCopyWith<$Res> {
  factory _$$HomeCategoriesStateImplCopyWith(_$HomeCategoriesStateImpl value,
          $Res Function(_$HomeCategoriesStateImpl) then) =
      __$$HomeCategoriesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      List<CategoryData> categories,
      List<CategoryData> subCategories,
      int selectedCategoryId,
      CategoryData? selectedCategory});
}

/// @nodoc
class __$$HomeCategoriesStateImplCopyWithImpl<$Res>
    extends _$HomeCategoriesStateCopyWithImpl<$Res, _$HomeCategoriesStateImpl>
    implements _$$HomeCategoriesStateImplCopyWith<$Res> {
  __$$HomeCategoriesStateImplCopyWithImpl(_$HomeCategoriesStateImpl _value,
      $Res Function(_$HomeCategoriesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? categories = null,
    Object? subCategories = null,
    Object? selectedCategoryId = null,
    Object? selectedCategory = freezed,
  }) {
    return _then(_$HomeCategoriesStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      subCategories: null == subCategories
          ? _value._subCategories
          : subCategories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      selectedCategoryId: null == selectedCategoryId
          ? _value.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      selectedCategory: freezed == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
    ));
  }
}

/// @nodoc

class _$HomeCategoriesStateImpl extends _HomeCategoriesState {
  const _$HomeCategoriesStateImpl(
      {this.isLoading = false,
      final List<CategoryData> categories = const [],
      final List<CategoryData> subCategories = const [],
      this.selectedCategoryId = 0,
      this.selectedCategory})
      : _categories = categories,
        _subCategories = subCategories,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<CategoryData> _categories;
  @override
  @JsonKey()
  List<CategoryData> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<CategoryData> _subCategories;
  @override
  @JsonKey()
  List<CategoryData> get subCategories {
    if (_subCategories is EqualUnmodifiableListView) return _subCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subCategories);
  }

  @override
  @JsonKey()
  final int selectedCategoryId;
  @override
  final CategoryData? selectedCategory;

  @override
  String toString() {
    return 'HomeCategoriesState(isLoading: $isLoading, categories: $categories, subCategories: $subCategories, selectedCategoryId: $selectedCategoryId, selectedCategory: $selectedCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeCategoriesStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._subCategories, _subCategories) &&
            (identical(other.selectedCategoryId, selectedCategoryId) ||
                other.selectedCategoryId == selectedCategoryId) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_subCategories),
      selectedCategoryId,
      selectedCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeCategoriesStateImplCopyWith<_$HomeCategoriesStateImpl> get copyWith =>
      __$$HomeCategoriesStateImplCopyWithImpl<_$HomeCategoriesStateImpl>(
          this, _$identity);
}

abstract class _HomeCategoriesState extends HomeCategoriesState {
  const factory _HomeCategoriesState(
      {final bool isLoading,
      final List<CategoryData> categories,
      final List<CategoryData> subCategories,
      final int selectedCategoryId,
      final CategoryData? selectedCategory}) = _$HomeCategoriesStateImpl;
  const _HomeCategoriesState._() : super._();

  @override
  bool get isLoading;
  @override
  List<CategoryData> get categories;
  @override
  List<CategoryData> get subCategories;
  @override
  int get selectedCategoryId;
  @override
  CategoryData? get selectedCategory;
  @override
  @JsonKey(ignore: true)
  _$$HomeCategoriesStateImplCopyWith<_$HomeCategoriesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
