// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DiceModelImpl _$$DiceModelImplFromJson(Map<String, dynamic> json) =>
    _$DiceModelImpl(
      values:
          (json['values'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [1, 1, 1, 1, 1],
      held:
          (json['held'] as List<dynamic>?)?.map((e) => e as bool).toList() ??
          const [false, false, false, false, false],
      rollsLeft: (json['rollsLeft'] as num?)?.toInt() ?? 3,
      lastRolledAt: json['lastRolledAt'] == null
          ? null
          : DateTime.parse(json['lastRolledAt'] as String),
    );

Map<String, dynamic> _$$DiceModelImplToJson(_$DiceModelImpl instance) =>
    <String, dynamic>{
      'values': instance.values,
      'held': instance.held,
      'rollsLeft': instance.rollsLeft,
      'lastRolledAt': instance.lastRolledAt?.toIso8601String(),
    };
