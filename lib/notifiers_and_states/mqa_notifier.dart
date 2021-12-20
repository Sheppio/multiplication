import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiplication/notifiers_and_states/mqa_result.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'mqa_state.dart';

class MQANotifier extends StateNotifier<MQAState> {
  final Ref ref;
  //late Timer _timer;
  DateTime timerStartedAt = DateTime.now();
  List<MQAResult> resultHistory = [];

  // 1. initialize with current time
  MQANotifier(this.ref) : super(MQAState()) {
    init();
  }

  init() async {
    resultHistory.addAll(await getResultHistoryFromSharedPrefs());
  }

  Future<List<MQAResult>> getResultHistoryFromSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('MultiplicationResultHistory');
    if (prefs.containsKey('MultiplicationResultHistory')) {
      return (prefs.getStringList('MultiplicationResultHistory')
              as List<String>)
          .map((e) => MQAResult.fromJson(jsonDecode(e)))
          .toList();
    } else {
      return <MQAResult>[];
    }
  }

  saveResult(MQAResult result) async {
    resultHistory.add(result);
    await saveResultHistoryToSharedPrefs(resultHistory);
  }

  Future<bool> saveResultHistoryToSharedPrefs(
      List<MQAResult> resultHistory) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var temp = resultHistory.map((e) => jsonEncode(e.toJson())).toList();
    return await prefs.setStringList('MultiplicationResultHistory', temp);
  }

  setSelectedIndex(int index) {
    var result = MQAResult(
        multiplicand: state.multiplicand,
        multiplier: state.multiplier,
        askedAt: timerStartedAt,
        timeToAnswer: Duration(
            microseconds: DateTime.now().millisecondsSinceEpoch -
                timerStartedAt.millisecondsSinceEpoch),
        givenAnswer: state.possibleAnswers[index]);
    saveResult(result);
    newQuestionAfterDelay(index == state.correctAnswerIndex
        ? Duration(milliseconds: 1000)
        : Duration(milliseconds: 3000));
    state = state.copyWith(
        selectedIndex: index,
        progress: MQAStateProgress.showingAnswer,
        answerHistory: mapResultsToAnswerState(
            getResultsHistory(state.multiplicand, state.multiplier),
            numberOfResults: 4));
  }

  List<AnswerState> mapResultsToAnswerState(List<MQAResult> results,
      {int? numberOfResults}) {
    var temp = results
        .map((e) => e.isCorrect ? AnswerState.correct : AnswerState.incorrect)
        .toList();
    if (numberOfResults != null) {
      if (temp.length > numberOfResults)
        temp = temp.sublist(temp.length - numberOfResults);
      else if (temp.length < numberOfResults) {
        temp = [
          ...List.filled(
              numberOfResults - temp.length, AnswerState.notAnswered),
          ...temp
        ];
      }
    }
    return temp;
  }

  newQuestionAfterDelay(Duration duration) {
    Future.delayed(duration, () {
      state = newQuestionState();
      timerStartedAt = DateTime.now();
    });
  }

  MQAState newQuestionState() {
    var multiplierSettings = ref.read(mSettingsNotifier);
    var minimumNum = 2;
    var rng = Random();
    var multipliers = multiplierSettings.multiplierSettings.entries
        .where((e) => e.value == true)
        .map((e) => e.key)
        .toList();
    var multiplicand = 0;
    var multiplier = 0;
    //Make sure we don't ask the same question twice in a row.
    do {
      multiplicand = minimumNum + rng.nextInt(12 + 1 - minimumNum);
      multiplier = multipliers[rng.nextInt(multipliers.length)];
    } while (
        multiplicand == state.multiplicand && multiplier == state.multiplier);

    var answer = multiplicand * multiplier;
    var correctAnswerIndex = -1;
    // TODO: The below definitley needs correcting for boudaries
    do {
      correctAnswerIndex = rng.nextInt(9);
    } while (answer <= correctAnswerIndex);
    var before = List<int>.generate(answer - 1, (i) => i + 1)..shuffle();
    before = before.sublist(0, correctAnswerIndex);
    var after = List<int>.generate(144 - (answer + 1), (i) => answer + i + 1)
      ..shuffle();
    after = after.sublist(0, 9 - (correctAnswerIndex + 1));
    before.sort();
    after.sort();
    var possibleAnswers = [...before, answer, ...after];
    var answerHistory = getResultsHistory(multiplicand, multiplier);
    var answerHistoryAnswerStates = mapResultsToAnswerState(
        getResultsHistory(multiplicand, multiplier),
        numberOfResults: 3);
    answerHistoryAnswerStates.add(AnswerState.notAnswered);
    var tempState = MQAState(
        multiplicand: multiplicand,
        multiplier: multiplier,
        // question: "$multiplicand x $multiplier",
        progress: MQAStateProgress.asking,
        possibleAnswers: possibleAnswers,
        correctAnswerIndex: correctAnswerIndex,
        answerHistory: answerHistoryAnswerStates);
    //print(tempState.toString() + ' ${tempState.correctAnswer}');
    return tempState;
  }

  List<MQAResult> getResultsHistory(int multiplicand, int multiplier) {
    var temp = resultHistory
        .where(
            (e) => e.multiplicand == multiplicand && e.multiplier == multiplier)
        .toList();
    temp.sort((a, b) => a.askedAt.compareTo(b.askedAt));
    return temp;
  }

  int get correctAnswer {
    return state.possibleAnswers[state.correctAnswerIndex];
  }
}







// class TimerXState {
//   Duration d = Duration(milliseconds: 0);
//   bool isRunning = false;

//   TimerXState(this.d, this.isRunning);
// }
