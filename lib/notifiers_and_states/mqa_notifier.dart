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

  // 1. initialize with current time
  MQANotifier(this.ref) : super(MQAState()) {
    // for (int x = 0; x < 100; x++) {
    //   newQuestionState();
    // }
  }

  saveResultToStorage(MQAResult result) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var results = <String>[];
    if (prefs.containsKey('MultiplicationResultHistory')) {
      results.addAll(
          prefs.getStringList('MultiplicationResultHistory') as List<String>);
    }
    results.add(jsonEncode(result.toJson()));
    //print(results.last);
    await prefs.setStringList('MultiplicationResultHistory', results);
  }

  // loadFromStorage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   //int counter = (prefs.getInt('counter') ?? 0) + 1;
  //   //print('Pressed $counter times.');
  //   if (prefs.containsKey('MultiplicationResultHistory')) {
  //     state = MSettingsState.fromJson(
  //         jsonDecode(prefs.getString('MultiplierSetting') as String));
  //   }
  // }

  setSelectedIndex(int index) {
    var result = MQAResult(
        multiplicand: state.multiplicand,
        multiplier: state.multiplier,
        timeToAnswer: Duration(
            microseconds: DateTime.now().millisecondsSinceEpoch -
                timerStartedAt.millisecondsSinceEpoch),
        givenAnswer: state.possibleAnswers[index]);
    saveResultToStorage(result);
    newQuestionAfterDelay(index == state.correctAnswerIndex
        ? Duration(milliseconds: 1000)
        : Duration(milliseconds: 3000));
    state = state.copyWith(
        selectedIndex: index, progress: MQAStateProgress.showingAnswer);
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
    //print('Multipliers: $multipliers');
    var multiplicand = minimumNum + rng.nextInt(12 + 1 - minimumNum);
    var multiplier = multipliers[rng.nextInt(multipliers.length)];
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
    var tempState = MQAState(
      multiplicand: multiplicand,
      multiplier: multiplier,
      // question: "$multiplicand x $multiplier",
      progress: MQAStateProgress.asking,
      possibleAnswers: possibleAnswers,
      correctAnswerIndex: correctAnswerIndex,
    );
    //print(tempState.toString() + ' ${tempState.correctAnswer}');
    return tempState;
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
