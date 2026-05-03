import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_model.freezed.dart';
part 'player_model.g.dart';

@freezed
class PlayerModel with _$PlayerModel {
  const PlayerModel._();

  const factory PlayerModel({
    required String playerId,
    required String name,
    String? avatarUrl,
    String? customSoundUrl,
    @Default(false) bool isReady,
    @Default(true) bool isConnected,
    required DateTime joinedAt,
  }) = _PlayerModel;

  factory PlayerModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
    SnapshotOptions? options,
  ) {
    final data = doc.data()!;
    return PlayerModel(
      playerId: doc.id,
      name: data['name'] as String,
      avatarUrl: data['avatarUrl'] as String?,
      customSoundUrl: data['customSoundUrl'] as String?,
      isReady: data['isReady'] as bool? ?? false,
      isConnected: data['isConnected'] as bool? ?? true,
      joinedAt: (data['joinedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, Object?> toFirestore() {
    return {
      'name': name,
      'avatarUrl': avatarUrl,
      'customSoundUrl': customSoundUrl,
      'isReady': isReady,
      'isConnected': isConnected,
      'joinedAt': Timestamp.fromDate(joinedAt),
    };
  }

  factory PlayerModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerModelFromJson(json);
}
