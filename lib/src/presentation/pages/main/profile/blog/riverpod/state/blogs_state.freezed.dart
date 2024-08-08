// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blogs_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BlogsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  List<BlogData> get blogs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlogsStateCopyWith<BlogsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogsStateCopyWith<$Res> {
  factory $BlogsStateCopyWith(
          BlogsState value, $Res Function(BlogsState) then) =
      _$BlogsStateCopyWithImpl<$Res, BlogsState>;
  @useResult
  $Res call({bool isLoading, bool isMoreLoading, List<BlogData> blogs});
}

/// @nodoc
class _$BlogsStateCopyWithImpl<$Res, $Val extends BlogsState>
    implements $BlogsStateCopyWith<$Res> {
  _$BlogsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? blogs = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      blogs: null == blogs
          ? _value.blogs
          : blogs // ignore: cast_nullable_to_non_nullable
              as List<BlogData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlogsStateImplCopyWith<$Res>
    implements $BlogsStateCopyWith<$Res> {
  factory _$$BlogsStateImplCopyWith(
          _$BlogsStateImpl value, $Res Function(_$BlogsStateImpl) then) =
      __$$BlogsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isMoreLoading, List<BlogData> blogs});
}

/// @nodoc
class __$$BlogsStateImplCopyWithImpl<$Res>
    extends _$BlogsStateCopyWithImpl<$Res, _$BlogsStateImpl>
    implements _$$BlogsStateImplCopyWith<$Res> {
  __$$BlogsStateImplCopyWithImpl(
      _$BlogsStateImpl _value, $Res Function(_$BlogsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? blogs = null,
  }) {
    return _then(_$BlogsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      blogs: null == blogs
          ? _value._blogs
          : blogs // ignore: cast_nullable_to_non_nullable
              as List<BlogData>,
    ));
  }
}

/// @nodoc

class _$BlogsStateImpl extends _BlogsState {
  const _$BlogsStateImpl(
      {this.isLoading = false,
      this.isMoreLoading = false,
      final List<BlogData> blogs = const []})
      : _blogs = blogs,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isMoreLoading;
  final List<BlogData> _blogs;
  @override
  @JsonKey()
  List<BlogData> get blogs {
    if (_blogs is EqualUnmodifiableListView) return _blogs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blogs);
  }

  @override
  String toString() {
    return 'BlogsState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, blogs: $blogs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlogsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isMoreLoading, isMoreLoading) ||
                other.isMoreLoading == isMoreLoading) &&
            const DeepCollectionEquality().equals(other._blogs, _blogs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isMoreLoading,
      const DeepCollectionEquality().hash(_blogs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlogsStateImplCopyWith<_$BlogsStateImpl> get copyWith =>
      __$$BlogsStateImplCopyWithImpl<_$BlogsStateImpl>(this, _$identity);
}

abstract class _BlogsState extends BlogsState {
  const factory _BlogsState(
      {final bool isLoading,
      final bool isMoreLoading,
      final List<BlogData> blogs}) = _$BlogsStateImpl;
  const _BlogsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  List<BlogData> get blogs;
  @override
  @JsonKey(ignore: true)
  _$$BlogsStateImplCopyWith<_$BlogsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
