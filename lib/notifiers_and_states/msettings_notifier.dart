import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiplication/data/multiplier_settings.dart';
import 'msettings_state.dart';

class MSettingsNotifier extends StateNotifier<MSettingsState> {
  //late Timer _timer;
  //DateTime timerStartedAt = DateTime.now();

  // 1. initialize with current time
  MSettingsNotifier(
      StateNotifierProviderRef<MSettingsNotifier, MSettingsState> ref)
      : super(MSettingsState()) {}

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

  toggleMultiplierSetting(int multiplier) {
    var t = Map.from(state.multiplierSettings);
    t[multiplier] = !t[multiplier];
    //var index = t.indexWhere((e) => e.multiplier == multiplier);
    //freezed so we now need to create new state...
    //t[index] = MultiplierSetting(multiplier, !t[index].selectable);
    state = state.copyWith(multiplierSettings: {...t});
    print('toggleMultiplierSettings state: $state');
  }
}







// class TimerXState {
//   Duration d = Duration(milliseconds: 0);
//   bool isRunning = false;

//   TimerXState(this.d, this.isRunning);
// }
