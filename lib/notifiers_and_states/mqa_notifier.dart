import 'dart:async';

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
      state = MQAState();
    });
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
