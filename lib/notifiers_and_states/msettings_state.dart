import 'package:freezed_annotation/freezed_annotation.dart';

part 'msettings_state.freezed.dart';
part 'msettings_state.g.dart';

@freezed
class MSettingsState with _$MSettingsState {
  const MSettingsState._();
  factory MSettingsState(
      {@Default(<int, bool>{
        2: true,
        3: true,
        4: false,
        5: true,
        6: false,
        7: false,
        8: false,
        9: false,
        10: true,
        11: false,
        12: false,
      })
          Map<int, bool> multiplierSettings}) = _MSettingsState;

  factory MSettingsState.fromJson(Map<String, dynamic> json) =>
      _$MSettingsStateFromJson(json);

  // Duration get fullDuration {
  //   if (pastSplits.length == 0)
  //     return duration;
  //   else
  //     return duration + pastSplits.reduce((value, element) => value + element);
  // }
}
