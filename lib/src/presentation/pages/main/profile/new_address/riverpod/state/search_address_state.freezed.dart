// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_address_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchAddressState {
  bool get isSearching => throw _privateConstructorUsedError;
  List<Place> get searchedLocations => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchAddressStateCopyWith<SearchAddressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchAddressStateCopyWith<$Res> {
  factory $SearchAddressStateCopyWith(
          SearchAddressState value, $Res Function(SearchAddressState) then) =
      _$SearchAddressStateCopyWithImpl<$Res, SearchAddressState>;
  @useResult
  $Res call({bool isSearching, List<Place> searchedLocations});
}

/// @nodoc
class _$SearchAddressStateCopyWithImpl<$Res, $Val extends SearchAddressState>
    implements $SearchAddressStateCopyWith<$Res> {
  _$SearchAddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? searchedLocations = null,
  }) {
    return _then(_value.copyWith(
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedLocations: null == searchedLocations
          ? _value.searchedLocations
          : searchedLocations // ignore: cast_nullable_to_non_nullable
              as List<Place>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchAddressStateImplCopyWith<$Res>
    implements $SearchAddressStateCopyWith<$Res> {
  factory _$$SearchAddressStateImplCopyWith(_$SearchAddressStateImpl value,
          $Res Function(_$SearchAddressStateImpl) then) =
      __$$SearchAddressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSearching, List<Place> searchedLocations});
}

/// @nodoc
class __$$SearchAddressStateImplCopyWithImpl<$Res>
    extends _$SearchAddressStateCopyWithImpl<$Res, _$SearchAddressStateImpl>
    implements _$$SearchAddressStateImplCopyWith<$Res> {
  __$$SearchAddressStateImplCopyWithImpl(_$SearchAddressStateImpl _value,
      $Res Function(_$SearchAddressStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSearching = null,
    Object? searchedLocations = null,
  }) {
    return _then(_$SearchAddressStateImpl(
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchedLocations: null == searchedLocations
          ? _value._searchedLocations
          : searchedLocations // ignore: cast_nullable_to_non_nullable
              as List<Place>,
    ));
  }
}

/// @nodoc

class _$SearchAddressStateImpl extends _SearchAddressState {
  const _$SearchAddressStateImpl(
      {this.isSearching = false,
      final List<Place> searchedLocations = const []})
      : _searchedLocations = searchedLocations,
        super._();

  @override
  @JsonKey()
  final bool isSearching;
  final List<Place> _searchedLocations;
  @override
  @JsonKey()
  List<Place> get searchedLocations {
    if (_searchedLocations is EqualUnmodifiableListView)
      return _searchedLocations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedLocations);
  }

  @override
  String toString() {
    return 'SearchAddressState(isSearching: $isSearching, searchedLocations: $searchedLocations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchAddressStateImpl &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            const DeepCollectionEquality()
                .equals(other._searchedLocations, _searchedLocations));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSearching,
      const DeepCollectionEquality().hash(_searchedLocations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchAddressStateImplCopyWith<_$SearchAddressStateImpl> get copyWith =>
      __$$SearchAddressStateImplCopyWithImpl<_$SearchAddressStateImpl>(
          this, _$identity);
}

abstract class _SearchAddressState extends SearchAddressState {
  const factory _SearchAddressState(
      {final bool isSearching,
      final List<Place> searchedLocations}) = _$SearchAddressStateImpl;
  const _SearchAddressState._() : super._();

  @override
  bool get isSearching;
  @override
  List<Place> get searchedLocations;
  @override
  @JsonKey(ignore: true)
  _$$SearchAddressStateImplCopyWith<_$SearchAddressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
