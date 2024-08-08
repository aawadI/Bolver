// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NotificationsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isDetailLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  List<BlogData> get notifications => throw _privateConstructorUsedError;
  BlogData? get notificationDetail => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationsStateCopyWith<NotificationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsStateCopyWith<$Res> {
  factory $NotificationsStateCopyWith(
          NotificationsState value, $Res Function(NotificationsState) then) =
      _$NotificationsStateCopyWithImpl<$Res, NotificationsState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isDetailLoading,
      bool isMoreLoading,
      List<BlogData> notifications,
      BlogData? notificationDetail});
}

/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res, $Val extends NotificationsState>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isDetailLoading = null,
    Object? isMoreLoading = null,
    Object? notifications = null,
    Object? notificationDetail = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDetailLoading: null == isDetailLoading
          ? _value.isDetailLoading
          : isDetailLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<BlogData>,
      notificationDetail: freezed == notificationDetail
          ? _value.notificationDetail
          : notificationDetail // ignore: cast_nullable_to_non_nullable
              as BlogData?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationsStateImplCopyWith<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  factory _$$NotificationsStateImplCopyWith(_$NotificationsStateImpl value,
          $Res Function(_$NotificationsStateImpl) then) =
      __$$NotificationsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isDetailLoading,
      bool isMoreLoading,
      List<BlogData> notifications,
      BlogData? notificationDetail});
}

/// @nodoc
class __$$NotificationsStateImplCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res, _$NotificationsStateImpl>
    implements _$$NotificationsStateImplCopyWith<$Res> {
  __$$NotificationsStateImplCopyWithImpl(_$NotificationsStateImpl _value,
      $Res Function(_$NotificationsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isDetailLoading = null,
    Object? isMoreLoading = null,
    Object? notifications = null,
    Object? notificationDetail = freezed,
  }) {
    return _then(_$NotificationsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isDetailLoading: null == isDetailLoading
          ? _value.isDetailLoading
          : isDetailLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<BlogData>,
      notificationDetail: freezed == notificationDetail
          ? _value.notificationDetail
          : notificationDetail // ignore: cast_nullable_to_non_nullable
              as BlogData?,
    ));
  }
}

/// @nodoc

class _$NotificationsStateImpl extends _NotificationsState {
  const _$NotificationsStateImpl(
      {this.isLoading = false,
      this.isDetailLoading = false,
      this.isMoreLoading = false,
      final List<BlogData> notifications = const [],
      this.notificationDetail})
      : _notifications = notifications,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isDetailLoading;
  @override
  @JsonKey()
  final bool isMoreLoading;
  final List<BlogData> _notifications;
  @override
  @JsonKey()
  List<BlogData> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  final BlogData? notificationDetail;

  @override
  String toString() {
    return 'NotificationsState(isLoading: $isLoading, isDetailLoading: $isDetailLoading, isMoreLoading: $isMoreLoading, notifications: $notifications, notificationDetail: $notificationDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isDetailLoading, isDetailLoading) ||
                other.isDetailLoading == isDetailLoading) &&
            (identical(other.isMoreLoading, isMoreLoading) ||
                other.isMoreLoading == isMoreLoading) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.notificationDetail, notificationDetail) ||
                other.notificationDetail == notificationDetail));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isDetailLoading,
      isMoreLoading,
      const DeepCollectionEquality().hash(_notifications),
      notificationDetail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationsStateImplCopyWith<_$NotificationsStateImpl> get copyWith =>
      __$$NotificationsStateImplCopyWithImpl<_$NotificationsStateImpl>(
          this, _$identity);
}

abstract class _NotificationsState extends NotificationsState {
  const factory _NotificationsState(
      {final bool isLoading,
      final bool isDetailLoading,
      final bool isMoreLoading,
      final List<BlogData> notifications,
      final BlogData? notificationDetail}) = _$NotificationsStateImpl;
  const _NotificationsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isDetailLoading;
  @override
  bool get isMoreLoading;
  @override
  List<BlogData> get notifications;
  @override
  BlogData? get notificationDetail;
  @override
  @JsonKey(ignore: true)
  _$$NotificationsStateImplCopyWith<_$NotificationsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
