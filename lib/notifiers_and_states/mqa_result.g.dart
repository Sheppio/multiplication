// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mqa_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MQAResult _$$_MQAResultFromJson(Map<String, dynamic> json) => _$_MQAResult(
      multiplicand: json['multiplicand'] as int,
      multiplier: json['multiplier'] as int,
      askedAt: DateTime.parse(json['askedAt'] as String),
      timeToAnswer: Duration(microseconds: json['timeToAnswer'] as int),
      givenAnswer: json['givenAnswer'] as int,
    );

Map<String, dynamic> _$$_MQAResultToJson(_$_MQAResult instance) =>
    <String, dynamic>{
      'multiplicand': instance.multiplicand,
      'multiplier': instance.multiplier,
      'askedAt': instance.askedAt.toIso8601String(),
      'timeToAnswer': instance.timeToAnswer.inMicroseconds,
      'givenAnswer': instance.givenAnswer,
    };
