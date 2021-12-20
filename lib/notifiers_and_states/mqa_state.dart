import 'package:freezed_annotation/freezed_annotation.dart';

part 'mqa_state.freezed.dart';

enum MQAStateProgress { asking, showingAnswer }
enum AnswerState { notAnswered, correct, correctSlow, correctFast, incorrect }

@freezed
class MQAState with _$MQAState {
  const MQAState._();
  factory MQAState(
      {@Default(2)
          int multiplicand,
      @Default(3)
          int multiplier,
      @Default(MQAStateProgress.asking)
          MQAStateProgress progress,
      @Default(<int>[1, 2, 3, 4, 5, 6, 7, 8, 9])
          List<int> possibleAnswers,
      @Default(5)
          int correctAnswerIndex,
      @Default(-1)
          int selectedIndex,
      @Default(<AnswerState>[AnswerState.incorrect])
          List<AnswerState> answerHistory}) = _MQAState;

  int get correctAnswer {
    return possibleAnswers[correctAnswerIndex];
  }

  String get question {
    return '$multiplicand x $multiplier';
  }
}
