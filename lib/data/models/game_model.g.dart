// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameModelImpl _$$GameModelImplFromJson(Map<String, dynamic> json) =>
    _$GameModelImpl(
      gameId: json['gameId'] as String,
      status: $enumDecode(_$GameStatusEnumMap, json['status']),
      hostId: json['hostId'] as String,
      roomCode: json['roomCode'] as String,
      maxPlayers: (json['maxPlayers'] as num?)?.toInt() ?? 4,
      currentTurnIndex: (json['currentTurnIndex'] as num?)?.toInt() ?? 0,
      playerOrder:
          (json['playerOrder'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      roundNumber: (json['roundNumber'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$GameModelImplToJson(_$GameModelImpl instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'status': _$GameStatusEnumMap[instance.status]!,
      'hostId': instance.hostId,
      'roomCode': instance.roomCode,
      'maxPlayers': instance.maxPlayers,
      'currentTurnIndex': instance.currentTurnIndex,
      'playerOrder': instance.playerOrder,
      'roundNumber': instance.roundNumber,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$GameStatusEnumMap = {
  GameStatus.waiting: 'waiting',
  GameStatus.playing: 'playing',
  GameStatus.finished: 'finished',
};
