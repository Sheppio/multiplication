// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'msettings_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MSettingsState _$$_MSettingsStateFromJson(Map<String, dynamic> json) =>
    _$_MSettingsState(
      multiplierSettings:
          (json['multiplierSettings'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(int.parse(k), e as bool),
              ) ??
              const <int, bool>{
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
                12: false
              },
    );

Map<String, dynamic> _$$_MSettingsStateToJson(_$_MSettingsState instance) =>
    <String, dynamic>{
      'multiplierSettings':
          instance.multiplierSettings.map((k, e) => MapEntry(k.toString(), e)),
    };
