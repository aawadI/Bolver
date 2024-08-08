// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_confirmation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResetConfirmationState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isTimeExpired => throw _privateConstructorUsedError;
  bool get isResending => throw _privateConstructorUsedError;
  bool get isConfirmCodeError => throw _privateConstructorUsedError;
  String get confirmCode => throw _privateConstructorUsedError;
  String get timerText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResetConfirmationStateCopyWith<ResetConfirmationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetConfirmationStateCopyWith<$Res> {
  factory $ResetConfirmationStateCopyWith(ResetConfirmationState value,
          $Res Function(ResetConfirmationState) then) =
      _$ResetConfirmationStateCopyWithImpl<$Res, ResetConfirmationState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isTimeExpired,
      bool isResending,
      bool isConfirmCodeError,
      String confirmCode,
      String timerText});
}

/// @nodoc
class _$ResetConfirmationStateCopyWithImpl<$Res,
        $Val extends ResetConfirmationState>
    implements $ResetConfirmationStateCopyWith<$Res> {
  _$ResetConfirmationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isTimeExpired = null,
    Object? isResending = null,
    Object? isConfirmCodeError = null,
    Object? confirmCode = null,
    Object? timerText = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isTimeExpired: null == isTimeExpired
          ? _value.isTimeExpired
          : isTimeExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      isResending: null == isResending
          ? _value.isResending
          : isResending // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmCodeError: null == isConfirmCodeError
          ? _value.isConfirmCodeError
          : isConfirmCodeError // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmCode: null == confirmCode
          ? _value.confirmCode
          : confirmCode // ignore: cast_nullable_to_non_nullable
              as String,
      timerText: null == timerText
          ? _value.timerText
          : timerText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetConfirmationStateImplCopyWith<$Res>
    implements $ResetConfirmationStateCopyWith<$Res> {
  factory _$$ResetConfirmationStateImplCopyWith(
          _$ResetConfirmationStateImpl value,
          $Res Function(_$ResetConfirmationStateImpl) then) =
      __$$ResetConfirmationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isTimeExpired,
      bool isResending,
      bool isConfirmCodeError,
      String confirmCode,
      String timerText});
}

/// @nodoc
class __$$ResetConfirmationStateImplCopyWithImpl<$Res>
    extends _$ResetConfirmationStateCopyWithImpl<$Res,
        _$ResetConfirmationStateImpl>
    implements _$$ResetConfirmationStateImplCopyWith<$Res> {
  __$$ResetConfirmationStateImplCopyWithImpl(
      _$ResetConfirmationStateImpl _value,
      $Res Function(_$ResetConfirmationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isTimeExpired = null,
    Object? isResending = null,
    Object? isConfirmCodeError = null,
    Object? confirmCode = null,
    Object? timerText = null,
  }) {
    return _then(_$ResetConfirmationStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isTimeExpired: null == isTimeExpired
          ? _value.isTimeExpired
          : isTimeExpired // ignore: cast_nullable_to_non_nullable
              as bool,
      isResending: null == isResending
          ? _value.isResending
          : isResending // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmCodeError: null == isConfirmCodeError
          ? _value.isConfirmCodeError
          : isConfirmCodeError // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmCode: null == confirmCode
          ? _value.confirmCode
          : confirmCode // ignore: cast_nullable_to_non_nullable
              as String,
      timerText: null == timerText
          ? _value.timerText
          : timerText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ResetConfirmationStateImpl extends _ResetConfirmationState {
  const _$ResetConfirmationStateImpl(
      {this.isLoading = false,
      this.isTimeExpired = false,
      this.isResending = false,
      this.isConfirmCodeError = false,
      this.confirmCode = '',
      this.timerText = ''})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isTimeExpired;
  @override
  @JsonKey()
  final bool isResending;
  @override
  @JsonKey()
  final bool isConfirmCodeError;
  @override
  @JsonKey()
  final String confirmCode;
  @override
  @JsonKey()
  final String timerText;

  @override
  String toString() {
    return 'ResetConfirmationState(isLoading: $isLoading, isTimeExpired: $isTimeExpired, isResending: $isResending, isConfirmCodeError: $isConfirmCodeError, confirmCode: $confirmCode, timerText: $timerText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetConfirmationStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isTimeExpired, isTimeExpired) ||
                other.isTimeExpired == isTimeExpired) &&
            (identical(other.isResending, isResending) ||
                other.isResending == isResending) &&
            (identical(other.isConfirmCodeError, isConfirmCodeError) ||
                other.isConfirmCodeError == isConfirmCodeError) &&
            (identical(other.confirmCode, confirmCode) ||
                other.confirmCode == confirmCode) &&
            (identical(other.timerText, timerText) ||
                other.timerText == timerText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isTimeExpired,
      isResending, isConfirmCodeError, confirmCode, timerText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetConfirmationStateImplCopyWith<_$ResetConfirmationStateImpl>
      get copyWith => __$$ResetConfirmationStateImplCopyWithImpl<
          _$ResetConfirmationStateImpl>(this, _$identity);
}

abstract class _ResetConfirmationState extends ResetConfirmationState {
  const factory _ResetConfirmationState(
      {final bool isLoading,
      final bool isTimeExpired,
      final bool isResending,
      final bool isConfirmCodeError,
      final String confirmCode,
      final String timerText}) = _$ResetConfirmationStateImpl;
  const _ResetConfirmationState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isTimeExpired;
  @override
  bool get isResending;
  @override
  bool get isConfirmCodeError;
  @override
  String get confirmCode;
  @override
  String get timerText;
  @override
  @JsonKey(ignore: true)
  _$$ResetConfirmationStateImplCopyWith<_$ResetConfirmationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
