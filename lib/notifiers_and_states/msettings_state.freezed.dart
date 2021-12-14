// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'msettings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MSettingsStateTearOff {
  const _$MSettingsStateTearOff();

  _MSettingsState call(
      {Map<int, bool> multiplierSettings = const <int, bool>{
        2: true,
        3: true,
        4: false,
        5: true,
        6: false,
        7: false,
        8: false,
        9: false,
        10: true,
        11: false,
        12: false
      }}) {
    return _MSettingsState(
      multiplierSettings: multiplierSettings,
    );
  }
}

/// @nodoc
const $MSettingsState = _$MSettingsStateTearOff();

/// @nodoc
mixin _$MSettingsState {
  Map<int, bool> get multiplierSettings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MSettingsStateCopyWith<MSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MSettingsStateCopyWith<$Res> {
  factory $MSettingsStateCopyWith(
          MSettingsState value, $Res Function(MSettingsState) then) =
      _$MSettingsStateCopyWithImpl<$Res>;
  $Res call({Map<int, bool> multiplierSettings});
}

/// @nodoc
class _$MSettingsStateCopyWithImpl<$Res>
    implements $MSettingsStateCopyWith<$Res> {
  _$MSettingsStateCopyWithImpl(this._value, this._then);

  final MSettingsState _value;
  // ignore: unused_field
  final $Res Function(MSettingsState) _then;

  @override
  $Res call({
    Object? multiplierSettings = freezed,
  }) {
    return _then(_value.copyWith(
      multiplierSettings: multiplierSettings == freezed
          ? _value.multiplierSettings
          : multiplierSettings // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>,
    ));
  }
}

/// @nodoc
abstract class _$MSettingsStateCopyWith<$Res>
    implements $MSettingsStateCopyWith<$Res> {
  factory _$MSettingsStateCopyWith(
          _MSettingsState value, $Res Function(_MSettingsState) then) =
      __$MSettingsStateCopyWithImpl<$Res>;
  @override
  $Res call({Map<int, bool> multiplierSettings});
}

/// @nodoc
class __$MSettingsStateCopyWithImpl<$Res>
    extends _$MSettingsStateCopyWithImpl<$Res>
    implements _$MSettingsStateCopyWith<$Res> {
  __$MSettingsStateCopyWithImpl(
      _MSettingsState _value, $Res Function(_MSettingsState) _then)
      : super(_value, (v) => _then(v as _MSettingsState));

  @override
  _MSettingsState get _value => super._value as _MSettingsState;

  @override
  $Res call({
    Object? multiplierSettings = freezed,
  }) {
    return _then(_MSettingsState(
      multiplierSettings: multiplierSettings == freezed
          ? _value.multiplierSettings
          : multiplierSettings // ignore: cast_nullable_to_non_nullable
              as Map<int, bool>,
    ));
  }
}

/// @nodoc

class _$_MSettingsState extends _MSettingsState {
  _$_MSettingsState(
      {this.multiplierSettings = const <int, bool>{
        2: true,
        3: true,
        4: false,
        5: true,
        6: false,
        7: false,
        8: false,
        9: false,
        10: true,
        11: false,
        12: false
      }})
      : super._();

  @JsonKey()
  @override
  final Map<int, bool> multiplierSettings;

  @override
  String toString() {
    return 'MSettingsState(multiplierSettings: $multiplierSettings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MSettingsState &&
            const DeepCollectionEquality()
                .equals(other.multiplierSettings, multiplierSettings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(multiplierSettings));

  @JsonKey(ignore: true)
  @override
  _$MSettingsStateCopyWith<_MSettingsState> get copyWith =>
      __$MSettingsStateCopyWithImpl<_MSettingsState>(this, _$identity);
}

abstract class _MSettingsState extends MSettingsState {
  factory _MSettingsState({Map<int, bool> multiplierSettings}) =
      _$_MSettingsState;
  _MSettingsState._() : super._();

  @override
  Map<int, bool> get multiplierSettings;
  @override
  @JsonKey(ignore: true)
  _$MSettingsStateCopyWith<_MSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}
