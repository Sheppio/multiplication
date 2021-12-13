import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'mqa_state.dart';

class MQANotifier extends StateNotifier<MQAState> {
  late Timer _timer;
  DateTime timerStartedAt = DateTime.now();

  // 1. initialize with current time
  MQANotifier() : super(MQAState()) {}

  setSelectedIndex(int index) {
    newQuestionAfterDelay(index == state.correctAnswerIndex
        ? Duration(milliseconds: 1500)
        : Duration(milliseconds: 3000));
    state = state.copyWith(
        selectedIndex: index, progress: MQAStateProgress.showingAnswer);
  }

  newQuestionAfterDelay(Duration duration) {
    Future.delayed(duration, () {
      state = newQuestionState();
    });
  }

  newQuestionState() {
    var minimumNum = 2;
    var rng = new Random();
    var a = minimumNum + rng.nextInt(9 - minimumNum);
    var b = minimumNum + rng.nextInt(9 - minimumNum);
    var answer = a * b;
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
    state = MQAState(
      question: "$a x $b",
      progress: MQAStateProgress.asking,
      possibleAnswers: possibleAnswers,
      correctAnswerIndex: correctAnswerIndex,
    );
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


// class TimerXState {
//   Duration d = Duration(milliseconds: 0);
//   bool isRunning = false;

//   TimerXState(this.d, this.isRunning);
// }
