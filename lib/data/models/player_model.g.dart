// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerModelImpl _$$PlayerModelImplFromJson(Map<String, dynamic> json) =>
    _$PlayerModelImpl(
      playerId: json['playerId'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      customSoundUrl: json['customSoundUrl'] as String?,
      isReady: json['isReady'] as bool? ?? false,
      isConnected: json['isConnected'] as bool? ?? true,
      joinedAt: DateTime.parse(json['joinedAt'] as String),
    );

Map<String, dynamic> _$$PlayerModelImplToJson(_$PlayerModelImpl instance) =>
    <String, dynamic>{
      'playerId': instance.playerId,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'customSoundUrl': instance.customSoundUrl,
      'isReady': instance.isReady,
      'isConnected': instance.isConnected,
      'joinedAt': instance.joinedAt.toIso8601String(),
    };
