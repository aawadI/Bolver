// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SystemSettingsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<CurrencyData> get currencies => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SystemSettingsStateCopyWith<SystemSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemSettingsStateCopyWith<$Res> {
  factory $SystemSettingsStateCopyWith(
          SystemSettingsState value, $Res Function(SystemSettingsState) then) =
      _$SystemSettingsStateCopyWithImpl<$Res, SystemSettingsState>;
  @useResult
  $Res call({bool isLoading, List<CurrencyData> currencies});
}

/// @nodoc
class _$SystemSettingsStateCopyWithImpl<$Res, $Val extends SystemSettingsState>
    implements $SystemSettingsStateCopyWith<$Res> {
  _$SystemSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currencies = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currencies: null == currencies
          ? _value.currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<CurrencyData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SystemSettingsStateImplCopyWith<$Res>
    implements $SystemSettingsStateCopyWith<$Res> {
  factory _$$SystemSettingsStateImplCopyWith(_$SystemSettingsStateImpl value,
          $Res Function(_$SystemSettingsStateImpl) then) =
      __$$SystemSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<CurrencyData> currencies});
}

/// @nodoc
class __$$SystemSettingsStateImplCopyWithImpl<$Res>
    extends _$SystemSettingsStateCopyWithImpl<$Res, _$SystemSettingsStateImpl>
    implements _$$SystemSettingsStateImplCopyWith<$Res> {
  __$$SystemSettingsStateImplCopyWithImpl(_$SystemSettingsStateImpl _value,
      $Res Function(_$SystemSettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? currencies = null,
  }) {
    return _then(_$SystemSettingsStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currencies: null == currencies
          ? _value._currencies
          : currencies // ignore: cast_nullable_to_non_nullable
              as List<CurrencyData>,
    ));
  }
}

/// @nodoc

class _$SystemSettingsStateImpl extends _SystemSettingsState {
  const _$SystemSettingsStateImpl(
      {this.isLoading = false, final List<CurrencyData> currencies = const []})
      : _currencies = currencies,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  final List<CurrencyData> _currencies;
  @override
  @JsonKey()
  List<CurrencyData> get currencies {
    if (_currencies is EqualUnmodifiableListView) return _currencies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currencies);
  }

  @override
  String toString() {
    return 'SystemSettingsState(isLoading: $isLoading, currencies: $currencies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SystemSettingsStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._currencies, _currencies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_currencies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SystemSettingsStateImplCopyWith<_$SystemSettingsStateImpl> get copyWith =>
      __$$SystemSettingsStateImplCopyWithImpl<_$SystemSettingsStateImpl>(
          this, _$identity);
}

abstract class _SystemSettingsState extends SystemSettingsState {
  const factory _SystemSettingsState(
      {final bool isLoading,
      final List<CurrencyData> currencies}) = _$SystemSettingsStateImpl;
  const _SystemSettingsState._() : super._();

  @override
  bool get isLoading;
  @override
  List<CurrencyData> get currencies;
  @override
  @JsonKey(ignore: true)
  _$$SystemSettingsStateImplCopyWith<_$SystemSettingsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
