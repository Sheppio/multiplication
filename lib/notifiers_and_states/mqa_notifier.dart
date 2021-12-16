import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  // var multiplierSettings = <MultiplierSetting>[
  //   MultiplierSetting(2, true),
  //   MultiplierSetting(3, true),
  //   MultiplierSetting(4, false),
  //   MultiplierSetting(5, true),
  //   MultiplierSetting(6, false),
  //   MultiplierSetting(7, false),
  //   MultiplierSetting(8, false),
  //   MultiplierSetting(9, false),
  //   MultiplierSetting(10, true),
  //   MultiplierSetting(11, false),
  //   MultiplierSetting(12, false),
  // ];

  setSelectedIndex(int index) {
    newQuestionAfterDelay(index == state.correctAnswerIndex
        ? Duration(milliseconds: 1000)
        : Duration(milliseconds: 3000));
    state = state.copyWith(
        selectedIndex: index, progress: MQAStateProgress.showingAnswer);
  }

  newQuestionAfterDelay(Duration duration) {
    Future.delayed(duration, () {
      state = newQuestionState();
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
      question: "$multiplicand x $multiplier",
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
