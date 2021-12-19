import 'package:freezed_annotation/freezed_annotation.dart';

part 'mqa_result.freezed.dart';
part 'mqa_result.g.dart';

//enum MQAStateProgress { asking, showingAnswer }

@freezed
class MQAResult with _$MQAResult {
  const MQAResult._();
  factory MQAResult(
      {required int multiplicand,
      required int multiplier,
      required Duration timeToAnswer,
      required int givenAnswer}) = _MQAResult;

  factory MQAResult.fromJson(Map<String, dynamic> json) =>
      _$MQAResultFromJson(json);

  bool get isCorrect {
    return (multiplicand * multiplier) == givenAnswer;
  }
}
