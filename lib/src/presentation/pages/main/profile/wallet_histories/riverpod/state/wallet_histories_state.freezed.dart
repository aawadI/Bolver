// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_histories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WalletHistoriesState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  List<WalletData> get wallets => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WalletHistoriesStateCopyWith<WalletHistoriesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletHistoriesStateCopyWith<$Res> {
  factory $WalletHistoriesStateCopyWith(WalletHistoriesState value,
          $Res Function(WalletHistoriesState) then) =
      _$WalletHistoriesStateCopyWithImpl<$Res, WalletHistoriesState>;
  @useResult
  $Res call({bool isLoading, bool isMoreLoading, List<WalletData> wallets});
}

/// @nodoc
class _$WalletHistoriesStateCopyWithImpl<$Res,
        $Val extends WalletHistoriesState>
    implements $WalletHistoriesStateCopyWith<$Res> {
  _$WalletHistoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? wallets = null,
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
      wallets: null == wallets
          ? _value.wallets
          : wallets // ignore: cast_nullable_to_non_nullable
              as List<WalletData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletHistoriesStateImplCopyWith<$Res>
    implements $WalletHistoriesStateCopyWith<$Res> {
  factory _$$WalletHistoriesStateImplCopyWith(_$WalletHistoriesStateImpl value,
          $Res Function(_$WalletHistoriesStateImpl) then) =
      __$$WalletHistoriesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, bool isMoreLoading, List<WalletData> wallets});
}

/// @nodoc
class __$$WalletHistoriesStateImplCopyWithImpl<$Res>
    extends _$WalletHistoriesStateCopyWithImpl<$Res, _$WalletHistoriesStateImpl>
    implements _$$WalletHistoriesStateImplCopyWith<$Res> {
  __$$WalletHistoriesStateImplCopyWithImpl(_$WalletHistoriesStateImpl _value,
      $Res Function(_$WalletHistoriesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isMoreLoading = null,
    Object? wallets = null,
  }) {
    return _then(_$WalletHistoriesStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: null == isMoreLoading
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      wallets: null == wallets
          ? _value._wallets
          : wallets // ignore: cast_nullable_to_non_nullable
              as List<WalletData>,
    ));
  }
}

/// @nodoc

class _$WalletHistoriesStateImpl extends _WalletHistoriesState {
  const _$WalletHistoriesStateImpl(
      {this.isLoading = false,
      this.isMoreLoading = false,
      final List<WalletData> wallets = const []})
      : _wallets = wallets,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isMoreLoading;
  final List<WalletData> _wallets;
  @override
  @JsonKey()
  List<WalletData> get wallets {
    if (_wallets is EqualUnmodifiableListView) return _wallets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wallets);
  }

  @override
  String toString() {
    return 'WalletHistoriesState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, wallets: $wallets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletHistoriesStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isMoreLoading, isMoreLoading) ||
                other.isMoreLoading == isMoreLoading) &&
            const DeepCollectionEquality().equals(other._wallets, _wallets));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isMoreLoading,
      const DeepCollectionEquality().hash(_wallets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletHistoriesStateImplCopyWith<_$WalletHistoriesStateImpl>
      get copyWith =>
          __$$WalletHistoriesStateImplCopyWithImpl<_$WalletHistoriesStateImpl>(
              this, _$identity);
}

abstract class _WalletHistoriesState extends WalletHistoriesState {
  const factory _WalletHistoriesState(
      {final bool isLoading,
      final bool isMoreLoading,
      final List<WalletData> wallets}) = _$WalletHistoriesStateImpl;
  const _WalletHistoriesState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  List<WalletData> get wallets;
  @override
  @JsonKey(ignore: true)
  _$$WalletHistoriesStateImplCopyWith<_$WalletHistoriesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
