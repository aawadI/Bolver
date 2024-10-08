// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_lang_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectLangState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  List<LanguageData> get languages => throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectLangStateCopyWith<SelectLangState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectLangStateCopyWith<$Res> {
  factory $SelectLangStateCopyWith(
          SelectLangState value, $Res Function(SelectLangState) then) =
      _$SelectLangStateCopyWithImpl<$Res, SelectLangState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isSaving,
      List<LanguageData> languages,
      int selectedIndex});
}

/// @nodoc
class _$SelectLangStateCopyWithImpl<$Res, $Val extends SelectLangState>
    implements $SelectLangStateCopyWith<$Res> {
  _$SelectLangStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaving = null,
    Object? languages = null,
    Object? selectedIndex = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<LanguageData>,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectLangStateImplCopyWith<$Res>
    implements $SelectLangStateCopyWith<$Res> {
  factory _$$SelectLangStateImplCopyWith(_$SelectLangStateImpl value,
          $Res Function(_$SelectLangStateImpl) then) =
      __$$SelectLangStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isSaving,
      List<LanguageData> languages,
      int selectedIndex});
}

/// @nodoc
class __$$SelectLangStateImplCopyWithImpl<$Res>
    extends _$SelectLangStateCopyWithImpl<$Res, _$SelectLangStateImpl>
    implements _$$SelectLangStateImplCopyWith<$Res> {
  __$$SelectLangStateImplCopyWithImpl(
      _$SelectLangStateImpl _value, $Res Function(_$SelectLangStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isSaving = null,
    Object? languages = null,
    Object? selectedIndex = null,
  }) {
    return _then(_$SelectLangStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      languages: null == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<LanguageData>,
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SelectLangStateImpl extends _SelectLangState {
  const _$SelectLangStateImpl(
      {this.isLoading = false,
      this.isSaving = false,
      final List<LanguageData> languages = const [],
      this.selectedIndex = 0})
      : _languages = languages,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSaving;
  final List<LanguageData> _languages;
  @override
  @JsonKey()
  List<LanguageData> get languages {
    if (_languages is EqualUnmodifiableListView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_languages);
  }

  @override
  @JsonKey()
  final int selectedIndex;

  @override
  String toString() {
    return 'SelectLangState(isLoading: $isLoading, isSaving: $isSaving, languages: $languages, selectedIndex: $selectedIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectLangStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages) &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isSaving,
      const DeepCollectionEquality().hash(_languages), selectedIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectLangStateImplCopyWith<_$SelectLangStateImpl> get copyWith =>
      __$$SelectLangStateImplCopyWithImpl<_$SelectLangStateImpl>(
          this, _$identity);
}

abstract class _SelectLangState extends SelectLangState {
  const factory _SelectLangState(
      {final bool isLoading,
      final bool isSaving,
      final List<LanguageData> languages,
      final int selectedIndex}) = _$SelectLangStateImpl;
  const _SelectLangState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isSaving;
  @override
  List<LanguageData> get languages;
  @override
  int get selectedIndex;
  @override
  @JsonKey(ignore: true)
  _$$SelectLangStateImplCopyWith<_$SelectLangStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
