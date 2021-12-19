// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mqa_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MQAResult _$MQAResultFromJson(Map<String, dynamic> json) {
  return _MQAResult.fromJson(json);
}

/// @nodoc
class _$MQAResultTearOff {
  const _$MQAResultTearOff();

  _MQAResult call(
      {required int multiplicand,
      required int multiplier,
      required Duration duration,
      required int answer}) {
    return _MQAResult(
      multiplicand: multiplicand,
      multiplier: multiplier,
      duration: duration,
      answer: answer,
    );
  }

  MQAResult fromJson(Map<String, Object?> json) {
    return MQAResult.fromJson(json);
  }
}

/// @nodoc
const $MQAResult = _$MQAResultTearOff();

/// @nodoc
mixin _$MQAResult {
  int get multiplicand => throw _privateConstructorUsedError;
  int get multiplier => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  int get answer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MQAResultCopyWith<MQAResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MQAResultCopyWith<$Res> {
  factory $MQAResultCopyWith(MQAResult value, $Res Function(MQAResult) then) =
      _$MQAResultCopyWithImpl<$Res>;
  $Res call({int multiplicand, int multiplier, Duration duration, int answer});
}

/// @nodoc
class _$MQAResultCopyWithImpl<$Res> implements $MQAResultCopyWith<$Res> {
  _$MQAResultCopyWithImpl(this._value, this._then);

  final MQAResult _value;
  // ignore: unused_field
  final $Res Function(MQAResult) _then;

  @override
  $Res call({
    Object? multiplicand = freezed,
    Object? multiplier = freezed,
    Object? duration = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      multiplicand: multiplicand == freezed
          ? _value.multiplicand
          : multiplicand // ignore: cast_nullable_to_non_nullable
              as int,
      multiplier: multiplier == freezed
          ? _value.multiplier
          : multiplier // ignore: cast_nullable_to_non_nullable
              as int,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$MQAResultCopyWith<$Res> implements $MQAResultCopyWith<$Res> {
  factory _$MQAResultCopyWith(
          _MQAResult value, $Res Function(_MQAResult) then) =
      __$MQAResultCopyWithImpl<$Res>;
  @override
  $Res call({int multiplicand, int multiplier, Duration duration, int answer});
}

/// @nodoc
class __$MQAResultCopyWithImpl<$Res> extends _$MQAResultCopyWithImpl<$Res>
    implements _$MQAResultCopyWith<$Res> {
  __$MQAResultCopyWithImpl(_MQAResult _value, $Res Function(_MQAResult) _then)
      : super(_value, (v) => _then(v as _MQAResult));

  @override
  _MQAResult get _value => super._value as _MQAResult;

  @override
  $Res call({
    Object? multiplicand = freezed,
    Object? multiplier = freezed,
    Object? duration = freezed,
    Object? answer = freezed,
  }) {
    return _then(_MQAResult(
      multiplicand: multiplicand == freezed
          ? _value.multiplicand
          : multiplicand // ignore: cast_nullable_to_non_nullable
              as int,
      multiplier: multiplier == freezed
          ? _value.multiplier
          : multiplier // ignore: cast_nullable_to_non_nullable
              as int,
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MQAResult extends _MQAResult {
  _$_MQAResult(
      {required this.multiplicand,
      required this.multiplier,
      required this.duration,
      required this.answer})
      : super._();

  factory _$_MQAResult.fromJson(Map<String, dynamic> json) =>
      _$$_MQAResultFromJson(json);

  @override
  final int multiplicand;
  @override
  final int multiplier;
  @override
  final Duration duration;
  @override
  final int answer;

  @override
  String toString() {
    return 'MQAResult(multiplicand: $multiplicand, multiplier: $multiplier, duration: $duration, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MQAResult &&
            const DeepCollectionEquality()
                .equals(other.multiplicand, multiplicand) &&
            const DeepCollectionEquality()
                .equals(other.multiplier, multiplier) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.answer, answer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(multiplicand),
      const DeepCollectionEquality().hash(multiplier),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(answer));

  @JsonKey(ignore: true)
  @override
  _$MQAResultCopyWith<_MQAResult> get copyWith =>
      __$MQAResultCopyWithImpl<_MQAResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MQAResultToJson(this);
  }
}

abstract class _MQAResult extends MQAResult {
  factory _MQAResult(
      {required int multiplicand,
      required int multiplier,
      required Duration duration,
      required int answer}) = _$_MQAResult;
  _MQAResult._() : super._();

  factory _MQAResult.fromJson(Map<String, dynamic> json) =
      _$_MQAResult.fromJson;

  @override
  int get multiplicand;
  @override
  int get multiplier;
  @override
  Duration get duration;
  @override
  int get answer;
  @override
  @JsonKey(ignore: true)
  _$MQAResultCopyWith<_MQAResult> get copyWith =>
      throw _privateConstructorUsedError;
}
