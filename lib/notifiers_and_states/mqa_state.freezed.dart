// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'mqa_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MQAStateTearOff {
  const _$MQAStateTearOff();

  _MQAState call(
      {String question = '2 x 3',
      MQAStateProgress progress = MQAStateProgress.asking,
      List<int> possibleAnswers = const <int>[1, 2, 3, 4, 5, 6, 7, 8, 9],
      int correctAnswerIndex = 5,
      int selectedIndex = -1}) {
    return _MQAState(
      question: question,
      progress: progress,
      possibleAnswers: possibleAnswers,
      correctAnswerIndex: correctAnswerIndex,
      selectedIndex: selectedIndex,
    );
  }
}

/// @nodoc
const $MQAState = _$MQAStateTearOff();

/// @nodoc
mixin _$MQAState {
  String get question => throw _privateConstructorUsedError;
  MQAStateProgress get progress => throw _privateConstructorUsedError;
  List<int> get possibleAnswers => throw _privateConstructorUsedError;
  int get correctAnswerIndex => throw _privateConstructorUsedError;
  int get selectedIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MQAStateCopyWith<MQAState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MQAStateCopyWith<$Res> {
  factory $MQAStateCopyWith(MQAState value, $Res Function(MQAState) then) =
      _$MQAStateCopyWithImpl<$Res>;
  $Res call(
      {String question,
      MQAStateProgress progress,
      List<int> possibleAnswers,
      int correctAnswerIndex,
      int selectedIndex});
}

/// @nodoc
class _$MQAStateCopyWithImpl<$Res> implements $MQAStateCopyWith<$Res> {
  _$MQAStateCopyWithImpl(this._value, this._then);

  final MQAState _value;
  // ignore: unused_field
  final $Res Function(MQAState) _then;

  @override
  $Res call({
    Object? question = freezed,
    Object? progress = freezed,
    Object? possibleAnswers = freezed,
    Object? correctAnswerIndex = freezed,
    Object? selectedIndex = freezed,
  }) {
    return _then(_value.copyWith(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as MQAStateProgress,
      possibleAnswers: possibleAnswers == freezed
          ? _value.possibleAnswers
          : possibleAnswers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      correctAnswerIndex: correctAnswerIndex == freezed
          ? _value.correctAnswerIndex
          : correctAnswerIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedIndex: selectedIndex == freezed
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$MQAStateCopyWith<$Res> implements $MQAStateCopyWith<$Res> {
  factory _$MQAStateCopyWith(_MQAState value, $Res Function(_MQAState) then) =
      __$MQAStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String question,
      MQAStateProgress progress,
      List<int> possibleAnswers,
      int correctAnswerIndex,
      int selectedIndex});
}

/// @nodoc
class __$MQAStateCopyWithImpl<$Res> extends _$MQAStateCopyWithImpl<$Res>
    implements _$MQAStateCopyWith<$Res> {
  __$MQAStateCopyWithImpl(_MQAState _value, $Res Function(_MQAState) _then)
      : super(_value, (v) => _then(v as _MQAState));

  @override
  _MQAState get _value => super._value as _MQAState;

  @override
  $Res call({
    Object? question = freezed,
    Object? progress = freezed,
    Object? possibleAnswers = freezed,
    Object? correctAnswerIndex = freezed,
    Object? selectedIndex = freezed,
  }) {
    return _then(_MQAState(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as MQAStateProgress,
      possibleAnswers: possibleAnswers == freezed
          ? _value.possibleAnswers
          : possibleAnswers // ignore: cast_nullable_to_non_nullable
              as List<int>,
      correctAnswerIndex: correctAnswerIndex == freezed
          ? _value.correctAnswerIndex
          : correctAnswerIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedIndex: selectedIndex == freezed
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_MQAState extends _MQAState {
  _$_MQAState(
      {this.question = '2 x 3',
      this.progress = MQAStateProgress.asking,
      this.possibleAnswers = const <int>[1, 2, 3, 4, 5, 6, 7, 8, 9],
      this.correctAnswerIndex = 5,
      this.selectedIndex = -1})
      : super._();

  @JsonKey()
  @override
  final String question;
  @JsonKey()
  @override
  final MQAStateProgress progress;
  @JsonKey()
  @override
  final List<int> possibleAnswers;
  @JsonKey()
  @override
  final int correctAnswerIndex;
  @JsonKey()
  @override
  final int selectedIndex;

  @override
  String toString() {
    return 'MQAState(question: $question, progress: $progress, possibleAnswers: $possibleAnswers, correctAnswerIndex: $correctAnswerIndex, selectedIndex: $selectedIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MQAState &&
            const DeepCollectionEquality().equals(other.question, question) &&
            const DeepCollectionEquality().equals(other.progress, progress) &&
            const DeepCollectionEquality()
                .equals(other.possibleAnswers, possibleAnswers) &&
            const DeepCollectionEquality()
                .equals(other.correctAnswerIndex, correctAnswerIndex) &&
            const DeepCollectionEquality()
                .equals(other.selectedIndex, selectedIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(question),
      const DeepCollectionEquality().hash(progress),
      const DeepCollectionEquality().hash(possibleAnswers),
      const DeepCollectionEquality().hash(correctAnswerIndex),
      const DeepCollectionEquality().hash(selectedIndex));

  @JsonKey(ignore: true)
  @override
  _$MQAStateCopyWith<_MQAState> get copyWith =>
      __$MQAStateCopyWithImpl<_MQAState>(this, _$identity);
}

abstract class _MQAState extends MQAState {
  factory _MQAState(
      {String question,
      MQAStateProgress progress,
      List<int> possibleAnswers,
      int correctAnswerIndex,
      int selectedIndex}) = _$_MQAState;
  _MQAState._() : super._();

  @override
  String get question;
  @override
  MQAStateProgress get progress;
  @override
  List<int> get possibleAnswers;
  @override
  int get correctAnswerIndex;
  @override
  int get selectedIndex;
  @override
  @JsonKey(ignore: true)
  _$MQAStateCopyWith<_MQAState> get copyWith =>
      throw _privateConstructorUsedError;
}
