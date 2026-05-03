import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_model.freezed.dart';
part 'game_model.g.dart';

enum GameStatus { waiting, playing, finished }

@freezed
class GameModel with _$GameModel {
  const GameModel._();

  const factory GameModel({
    required String gameId,
    required GameStatus status,
    required String hostId,
    required String roomCode,
    @Default(4) int maxPlayers,
    @Default(0) int currentTurnIndex,
    @Default([]) List<String> playerOrder,
    @Default(0) int roundNumber,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _GameModel;

  factory GameModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
    SnapshotOptions? options,
  ) {
    final data = doc.data()!;
    return GameModel(
      gameId: doc.id,
      status: GameStatus.values.byName(data['status'] as String),
      hostId: data['hostId'] as String,
      roomCode: data['roomCode'] as String,
      maxPlayers: (data['maxPlayers'] as num?)?.toInt() ?? 4,
      currentTurnIndex: (data['currentTurnIndex'] as num?)?.toInt() ?? 0,
      playerOrder: (data['playerOrder'] as List?)?.cast<String>() ?? [],
      roundNumber: (data['roundNumber'] as num?)?.toInt() ?? 0,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  Map<String, Object?> toFirestore() {
    return {
      'status': status.name,
      'hostId': hostId,
      'roomCode': roomCode,
      'maxPlayers': maxPlayers,
      'currentTurnIndex': currentTurnIndex,
      'playerOrder': playerOrder,
      'roundNumber': roundNumber,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);

  bool get isWaiting => status == GameStatus.waiting;
  bool get isPlaying => status == GameStatus.playing;
  bool get isFinished => status == GameStatus.finished;

  String get currentTurnPlayerId {
    if (playerOrder.isEmpty || currentTurnIndex >= playerOrder.length) return '';
    return playerOrder[currentTurnIndex];
  }

  int get currentRound {
    if (playerOrder.isEmpty) return 0;
    return (currentTurnIndex ~/ playerOrder.length) + 1;
  }
}
