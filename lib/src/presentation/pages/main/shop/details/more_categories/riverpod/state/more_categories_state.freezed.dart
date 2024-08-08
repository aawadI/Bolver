// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'more_categories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MoreCategoriesState {
  bool get isLoading => throw _privateConstructorUsedError;
  CategoryData? get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MoreCategoriesStateCopyWith<MoreCategoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoreCategoriesStateCopyWith<$Res> {
  factory $MoreCategoriesStateCopyWith(
          MoreCategoriesState value, $Res Function(MoreCategoriesState) then) =
      _$MoreCategoriesStateCopyWithImpl<$Res, MoreCategoriesState>;
  @useResult
  $Res call({bool isLoading, CategoryData? category});
}

/// @nodoc
class _$MoreCategoriesStateCopyWithImpl<$Res, $Val extends MoreCategoriesState>
    implements $MoreCategoriesStateCopyWith<$Res> {
  _$MoreCategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoreCategoriesStateImplCopyWith<$Res>
    implements $MoreCategoriesStateCopyWith<$Res> {
  factory _$$MoreCategoriesStateImplCopyWith(_$MoreCategoriesStateImpl value,
          $Res Function(_$MoreCategoriesStateImpl) then) =
      __$$MoreCategoriesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, CategoryData? category});
}

/// @nodoc
class __$$MoreCategoriesStateImplCopyWithImpl<$Res>
    extends _$MoreCategoriesStateCopyWithImpl<$Res, _$MoreCategoriesStateImpl>
    implements _$$MoreCategoriesStateImplCopyWith<$Res> {
  __$$MoreCategoriesStateImplCopyWithImpl(_$MoreCategoriesStateImpl _value,
      $Res Function(_$MoreCategoriesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? category = freezed,
  }) {
    return _then(_$MoreCategoriesStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryData?,
    ));
  }
}

/// @nodoc

class _$MoreCategoriesStateImpl extends _MoreCategoriesState {
  const _$MoreCategoriesStateImpl({this.isLoading = false, this.category})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final CategoryData? category;

  @override
  String toString() {
    return 'MoreCategoriesState(isLoading: $isLoading, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoreCategoriesStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoreCategoriesStateImplCopyWith<_$MoreCategoriesStateImpl> get copyWith =>
      __$$MoreCategoriesStateImplCopyWithImpl<_$MoreCategoriesStateImpl>(
          this, _$identity);
}

abstract class _MoreCategoriesState extends MoreCategoriesState {
  const factory _MoreCategoriesState(
      {final bool isLoading,
      final CategoryData? category}) = _$MoreCategoriesStateImpl;
  const _MoreCategoriesState._() : super._();

  @override
  bool get isLoading;
  @override
  CategoryData? get category;
  @override
  @JsonKey(ignore: true)
  _$$MoreCategoriesStateImplCopyWith<_$MoreCategoriesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
