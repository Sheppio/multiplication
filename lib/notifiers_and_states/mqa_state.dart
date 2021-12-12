import 'package:freezed_annotation/freezed_annotation.dart';

part 'mqa_state.freezed.dart';

enum MQAStateProgress { asking, showingAnswer }

@freezed
class MQAState with _$MQAState {
  const MQAState._();
  factory MQAState(
      {@Default('2 x 3') String question,
      @Default(MQAStateProgress.asking) MQAStateProgress progress,
      @Default(<int>[1, 2, 3, 4, 5, 6, 7, 8, 9]) List<int> possibleAnswers,
      @Default(5) int correctAnswerIndex}) = _MQAState;

  // Duration get fullDuration {
  //   if (pastSplits.length == 0)
  //     return duration;
  //   else
  //     return duration + pastSplits.reduce((value, element) => value + element);
  // }
}
