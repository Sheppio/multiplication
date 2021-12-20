import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'msettings_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MSettingsNotifier extends StateNotifier<MSettingsState> {
  MSettingsNotifier(
      StateNotifierProviderRef<MSettingsNotifier, MSettingsState> ref)
      : super(MSettingsState()) {
    this.loadFromStorage();
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

  toggleMultiplierSetting(int multiplier) {
    var t = Map.from(state.multiplierSettings);
    t[multiplier] = !t[multiplier];
    state = state.copyWith(multiplierSettings: {...t});
  }

  saveToStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //int counter = (prefs.getInt('counter') ?? 0) + 1;
    //print('Pressed $counter times.');
    await prefs.setString('MultiplierSetting', jsonEncode(state.toJson()));
  }

  loadFromStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //int counter = (prefs.getInt('counter') ?? 0) + 1;
    //print('Pressed $counter times.');
    if (prefs.containsKey('MultiplierSetting')) {
      state = MSettingsState.fromJson(
          jsonDecode(prefs.getString('MultiplierSetting') as String));
    }
  }
}







// class TimerXState {
//   Duration d = Duration(milliseconds: 0);
//   bool isRunning = false;

//   TimerXState(this.d, this.isRunning);
// }
