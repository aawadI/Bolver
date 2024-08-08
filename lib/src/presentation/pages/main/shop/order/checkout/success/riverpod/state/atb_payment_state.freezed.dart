// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'atb_payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AtbPaymentState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AtbPaymentStateCopyWith<AtbPaymentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AtbPaymentStateCopyWith<$Res> {
  factory $AtbPaymentStateCopyWith(
          AtbPaymentState value, $Res Function(AtbPaymentState) then) =
      _$AtbPaymentStateCopyWithImpl<$Res, AtbPaymentState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$AtbPaymentStateCopyWithImpl<$Res, $Val extends AtbPaymentState>
    implements $AtbPaymentStateCopyWith<$Res> {
  _$AtbPaymentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AtbPaymentStateImplCopyWith<$Res>
    implements $AtbPaymentStateCopyWith<$Res> {
  factory _$$AtbPaymentStateImplCopyWith(_$AtbPaymentStateImpl value,
          $Res Function(_$AtbPaymentStateImpl) then) =
      __$$AtbPaymentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$AtbPaymentStateImplCopyWithImpl<$Res>
    extends _$AtbPaymentStateCopyWithImpl<$Res, _$AtbPaymentStateImpl>
    implements _$$AtbPaymentStateImplCopyWith<$Res> {
  __$$AtbPaymentStateImplCopyWithImpl(
      _$AtbPaymentStateImpl _value, $Res Function(_$AtbPaymentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$AtbPaymentStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AtbPaymentStateImpl extends _AtbPaymentState {
  const _$AtbPaymentStateImpl({this.isLoading = false}) : super._();

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AtbPaymentState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AtbPaymentStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AtbPaymentStateImplCopyWith<_$AtbPaymentStateImpl> get copyWith =>
      __$$AtbPaymentStateImplCopyWithImpl<_$AtbPaymentStateImpl>(
          this, _$identity);
}

abstract class _AtbPaymentState extends AtbPaymentState {
  const factory _AtbPaymentState({final bool isLoading}) =
      _$AtbPaymentStateImpl;
  const _AtbPaymentState._() : super._();

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$AtbPaymentStateImplCopyWith<_$AtbPaymentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
