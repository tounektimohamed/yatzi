// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScoreModelImpl _$$ScoreModelImplFromJson(Map<String, dynamic> json) =>
    _$ScoreModelImpl(
      playerId: json['playerId'] as String,
      ones: (json['ones'] as num?)?.toInt(),
      twos: (json['twos'] as num?)?.toInt(),
      threes: (json['threes'] as num?)?.toInt(),
      fours: (json['fours'] as num?)?.toInt(),
      fives: (json['fives'] as num?)?.toInt(),
      sixes: (json['sixes'] as num?)?.toInt(),
      pair: (json['pair'] as num?)?.toInt(),
      twoPairs: (json['twoPairs'] as num?)?.toInt(),
      threeOfAKind: (json['threeOfAKind'] as num?)?.toInt(),
      fourOfAKind: (json['fourOfAKind'] as num?)?.toInt(),
      fullHouse: (json['fullHouse'] as num?)?.toInt(),
      smallStraight: (json['smallStraight'] as num?)?.toInt(),
      largeStraight: (json['largeStraight'] as num?)?.toInt(),
      chance: (json['chance'] as num?)?.toInt(),
      yatzy: (json['yatzy'] as num?)?.toInt(),
      upperBonus: (json['upperBonus'] as num?)?.toInt() ?? 0,
      totalScore: (json['totalScore'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ScoreModelImplToJson(_$ScoreModelImpl instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'ones': instance.ones,
      'twos': instance.twos,
      'threes': instance.threes,
      'fours': instance.fours,
      'fives': instance.fives,
      'sixes': instance.sixes,
      'pair': instance.pair,
      'twoPairs': instance.twoPairs,
      'threeOfAKind': instance.threeOfAKind,
      'fourOfAKind': instance.fourOfAKind,
      'fullHouse': instance.fullHouse,
      'smallStraight': instance.smallStraight,
      'largeStraight': instance.largeStraight,
      'chance': instance.chance,
      'yatzy': instance.yatzy,
      'upperBonus': instance.upperBonus,
      'totalScore': instance.totalScore,
    };
