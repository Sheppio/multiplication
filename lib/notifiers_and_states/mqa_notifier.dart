import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'mqa_state.dart';

class MQANotifier extends StateNotifier<MQAState> {
  late Timer _timer;
  DateTime timerStartedAt = DateTime.now();

  // 1. initialize with current time
  MQANotifier()
      : super(MQAState(multiplierSettings: <MultiplierSetting>[
          MultiplierSetting(2, true),
          MultiplierSetting(3, true),
          MultiplierSetting(4, false),
          MultiplierSetting(5, true),
          MultiplierSetting(6, false),
          MultiplierSetting(7, false),
          MultiplierSetting(8, false),
          MultiplierSetting(9, false),
          MultiplierSetting(10, true),
          MultiplierSetting(11, false),
          MultiplierSetting(12, false),
        ])) {
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
        ? Duration(milliseconds: 1500)
        : Duration(milliseconds: 3000));
    state = state.copyWith(
        selectedIndex: index, progress: MQAStateProgress.showingAnswer);
  }

  toggleMultiplierSetting(int multiplier) {
    var t = state.multiplierSettings;
    var index = t.indexWhere((e) => e.multiplier == multiplier);
    t[index].selectable = !t[index].selectable;
    state = state.copyWith(multiplierSettings: [...t]);
    print('toggleMultiplierSettings state: $state');
  }

  newQuestionAfterDelay(Duration duration) {
    Future.delayed(duration, () {
      state = newQuestionState();
    });
  }

  MQAState newQuestionState() {
    var minimumNum = 2;
    var rng = Random();
    var multipliers = state.multiplierSettings
        .where((e) => e.selectable == true)
        .map((e) => e.multiplier)
        .toList();
    print('Multipliers: $multipliers');
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
        multiplierSettings: state.multiplierSettings);
    print(tempState.toString() + ' ${tempState.correctAnswer}');
    return tempState;
  }

  startTimer() {
    // timerStartedAt = DateTime.now();
    // state = state.copyWith(isRunning: true);
    // _timer = Timer.periodic(Duration(milliseconds: 10), (_) {
    //   // 3. update the state with the current time
    //   state = state.copyWith(
    //       duration: Duration(
    //           milliseconds: DateTime.now().millisecondsSinceEpoch -
    //               timerStartedAt.millisecondsSinceEpoch));
    // });
  }

  stopTimer() {
    // _timer.cancel();
    // state = state.copyWith(
    //     duration: const Duration(milliseconds: 0),
    //     isRunning: false,
    //     pastSplits: [...state.pastSplits, state.duration]);
  }

  resetTimer() {
    // state = MQAState();
  }
}

class MultiplierSetting {
  int multiplier;
  bool selectable;
  MultiplierSetting(this.multiplier, this.selectable);

  @override
  String toString() {
    return '${multiplier.toString()}:$selectable';
  }
}





// class TimerXState {
//   Duration d = Duration(milliseconds: 0);
//   bool isRunning = false;

//   TimerXState(this.d, this.isRunning);
// }
