// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blog_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BlogDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  BlogDetailsResponse? get blogDetails => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlogDetailsStateCopyWith<BlogDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogDetailsStateCopyWith<$Res> {
  factory $BlogDetailsStateCopyWith(
          BlogDetailsState value, $Res Function(BlogDetailsState) then) =
      _$BlogDetailsStateCopyWithImpl<$Res, BlogDetailsState>;
  @useResult
  $Res call({bool isLoading, BlogDetailsResponse? blogDetails});
}

/// @nodoc
class _$BlogDetailsStateCopyWithImpl<$Res, $Val extends BlogDetailsState>
    implements $BlogDetailsStateCopyWith<$Res> {
  _$BlogDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? blogDetails = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      blogDetails: freezed == blogDetails
          ? _value.blogDetails
          : blogDetails // ignore: cast_nullable_to_non_nullable
              as BlogDetailsResponse?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlogDetailsStateImplCopyWith<$Res>
    implements $BlogDetailsStateCopyWith<$Res> {
  factory _$$BlogDetailsStateImplCopyWith(_$BlogDetailsStateImpl value,
          $Res Function(_$BlogDetailsStateImpl) then) =
      __$$BlogDetailsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, BlogDetailsResponse? blogDetails});
}

/// @nodoc
class __$$BlogDetailsStateImplCopyWithImpl<$Res>
    extends _$BlogDetailsStateCopyWithImpl<$Res, _$BlogDetailsStateImpl>
    implements _$$BlogDetailsStateImplCopyWith<$Res> {
  __$$BlogDetailsStateImplCopyWithImpl(_$BlogDetailsStateImpl _value,
      $Res Function(_$BlogDetailsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? blogDetails = freezed,
  }) {
    return _then(_$BlogDetailsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      blogDetails: freezed == blogDetails
          ? _value.blogDetails
          : blogDetails // ignore: cast_nullable_to_non_nullable
              as BlogDetailsResponse?,
    ));
  }
}

/// @nodoc

class _$BlogDetailsStateImpl extends _BlogDetailsState {
  const _$BlogDetailsStateImpl({this.isLoading = false, this.blogDetails})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final BlogDetailsResponse? blogDetails;

  @override
  String toString() {
    return 'BlogDetailsState(isLoading: $isLoading, blogDetails: $blogDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogDetailsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.blogDetails, blogDetails) ||
                other.blogDetails == blogDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, blogDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogDetailsStateImplCopyWith<_$BlogDetailsStateImpl> get copyWith =>
      __$$BlogDetailsStateImplCopyWithImpl<_$BlogDetailsStateImpl>(
          this, _$identity);
}

abstract class _BlogDetailsState extends BlogDetailsState {
  const factory _BlogDetailsState(
      {final bool isLoading,
      final BlogDetailsResponse? blogDetails}) = _$BlogDetailsStateImpl;
  const _BlogDetailsState._() : super._();

  @override
  bool get isLoading;
  @override
  BlogDetailsResponse? get blogDetails;
  @override
  @JsonKey(ignore: true)
  _$$BlogDetailsStateImplCopyWith<_$BlogDetailsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
