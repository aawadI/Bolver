// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_password_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NewPasswordState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get showNewPassword => throw _privateConstructorUsedError;
  bool get showConfirmNewPassword => throw _privateConstructorUsedError;
  bool get isConfirmPasswordSame => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;
  String get confirmNewPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewPasswordStateCopyWith<NewPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPasswordStateCopyWith<$Res> {
  factory $NewPasswordStateCopyWith(
          NewPasswordState value, $Res Function(NewPasswordState) then) =
      _$NewPasswordStateCopyWithImpl<$Res, NewPasswordState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool showNewPassword,
      bool showConfirmNewPassword,
      bool isConfirmPasswordSame,
      String newPassword,
      String confirmNewPassword});
}

/// @nodoc
class _$NewPasswordStateCopyWithImpl<$Res, $Val extends NewPasswordState>
    implements $NewPasswordStateCopyWith<$Res> {
  _$NewPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? showNewPassword = null,
    Object? showConfirmNewPassword = null,
    Object? isConfirmPasswordSame = null,
    Object? newPassword = null,
    Object? confirmNewPassword = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showNewPassword: null == showNewPassword
          ? _value.showNewPassword
          : showNewPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showConfirmNewPassword: null == showConfirmNewPassword
          ? _value.showConfirmNewPassword
          : showConfirmNewPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordSame: null == isConfirmPasswordSame
          ? _value.isConfirmPasswordSame
          : isConfirmPasswordSame // ignore: cast_nullable_to_non_nullable
              as bool,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      confirmNewPassword: null == confirmNewPassword
          ? _value.confirmNewPassword
          : confirmNewPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewPasswordStateImplCopyWith<$Res>
    implements $NewPasswordStateCopyWith<$Res> {
  factory _$$NewPasswordStateImplCopyWith(_$NewPasswordStateImpl value,
          $Res Function(_$NewPasswordStateImpl) then) =
      __$$NewPasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool showNewPassword,
      bool showConfirmNewPassword,
      bool isConfirmPasswordSame,
      String newPassword,
      String confirmNewPassword});
}

/// @nodoc
class __$$NewPasswordStateImplCopyWithImpl<$Res>
    extends _$NewPasswordStateCopyWithImpl<$Res, _$NewPasswordStateImpl>
    implements _$$NewPasswordStateImplCopyWith<$Res> {
  __$$NewPasswordStateImplCopyWithImpl(_$NewPasswordStateImpl _value,
      $Res Function(_$NewPasswordStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? showNewPassword = null,
    Object? showConfirmNewPassword = null,
    Object? isConfirmPasswordSame = null,
    Object? newPassword = null,
    Object? confirmNewPassword = null,
  }) {
    return _then(_$NewPasswordStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showNewPassword: null == showNewPassword
          ? _value.showNewPassword
          : showNewPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      showConfirmNewPassword: null == showConfirmNewPassword
          ? _value.showConfirmNewPassword
          : showConfirmNewPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordSame: null == isConfirmPasswordSame
          ? _value.isConfirmPasswordSame
          : isConfirmPasswordSame // ignore: cast_nullable_to_non_nullable
              as bool,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      confirmNewPassword: null == confirmNewPassword
          ? _value.confirmNewPassword
          : confirmNewPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NewPasswordStateImpl extends _NewPasswordState {
  const _$NewPasswordStateImpl(
      {this.isLoading = false,
      this.showNewPassword = false,
      this.showConfirmNewPassword = false,
      this.isConfirmPasswordSame = true,
      this.newPassword = '',
      this.confirmNewPassword = ''})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool showNewPassword;
  @override
  @JsonKey()
  final bool showConfirmNewPassword;
  @override
  @JsonKey()
  final bool isConfirmPasswordSame;
  @override
  @JsonKey()
  final String newPassword;
  @override
  @JsonKey()
  final String confirmNewPassword;

  @override
  String toString() {
    return 'NewPasswordState(isLoading: $isLoading, showNewPassword: $showNewPassword, showConfirmNewPassword: $showConfirmNewPassword, isConfirmPasswordSame: $isConfirmPasswordSame, newPassword: $newPassword, confirmNewPassword: $confirmNewPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewPasswordStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.showNewPassword, showNewPassword) ||
                other.showNewPassword == showNewPassword) &&
            (identical(other.showConfirmNewPassword, showConfirmNewPassword) ||
                other.showConfirmNewPassword == showConfirmNewPassword) &&
            (identical(other.isConfirmPasswordSame, isConfirmPasswordSame) ||
                other.isConfirmPasswordSame == isConfirmPasswordSame) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.confirmNewPassword, confirmNewPassword) ||
                other.confirmNewPassword == confirmNewPassword));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      showNewPassword,
      showConfirmNewPassword,
      isConfirmPasswordSame,
      newPassword,
      confirmNewPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewPasswordStateImplCopyWith<_$NewPasswordStateImpl> get copyWith =>
      __$$NewPasswordStateImplCopyWithImpl<_$NewPasswordStateImpl>(
          this, _$identity);
}

abstract class _NewPasswordState extends NewPasswordState {
  const factory _NewPasswordState(
      {final bool isLoading,
      final bool showNewPassword,
      final bool showConfirmNewPassword,
      final bool isConfirmPasswordSame,
      final String newPassword,
      final String confirmNewPassword}) = _$NewPasswordStateImpl;
  const _NewPasswordState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get showNewPassword;
  @override
  bool get showConfirmNewPassword;
  @override
  bool get isConfirmPasswordSame;
  @override
  String get newPassword;
  @override
  String get confirmNewPassword;
  @override
  @JsonKey(ignore: true)
  _$$NewPasswordStateImplCopyWith<_$NewPasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
