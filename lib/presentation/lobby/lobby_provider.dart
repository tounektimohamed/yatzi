import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yatzy_multiplayer/data/models/player_model.dart';

import '../auth/auth_provider.dart';

final lobbyProvider =
    AsyncNotifierProvider<LobbyNotifier, LobbyState>(LobbyNotifier.new);

class LobbyState {
  final String? gameId;
  final String? roomCode;
  final List<PlayerModel> players;
  final bool isCreating;
  final bool isJoining;
  final String? error;

  const LobbyState({
    this.gameId,
    this.roomCode,
    this.players = const [],
    this.isCreating = false,
    this.isJoining = false,
    this.error,
  });

  LobbyState copyWith({
    String? gameId,
    String? roomCode,
    List<PlayerModel>? players,
    bool? isCreating,
    bool? isJoining,
    String? error,
    bool clearError = false,
  }) {
    return LobbyState(
      gameId: gameId ?? this.gameId,
      roomCode: roomCode ?? this.roomCode,
      players: players ?? this.players,
      isCreating: isCreating ?? this.isCreating,
      isJoining: isJoining ?? this.isJoining,
      error: clearError ? null : (error ?? this.error),
    );
  }
}

class LobbyNotifier extends AsyncNotifier<LobbyState> {
  @override
  Future<LobbyState> build() async {
    return const LobbyState();
  }

  Future<void> createRoom(PlayerModel player) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final game = await ref.read(firebaseServiceProvider).createRoom(player);
      return LobbyState(
        gameId: game.gameId,
        roomCode: game.roomCode,
        players: [player],
      );
    });
  }

  Future<void> joinRoom(String roomCode, PlayerModel player) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(firebaseServiceProvider)
          .joinRoom(roomCode, player);
      return state.value!.copyWith(
        roomCode: roomCode,
        isJoining: false,
        clearError: true,
      );
    });
  }

  void updatePlayers(List<PlayerModel> players) {
    final current = state.value;
    if (current == null) return;
    state = AsyncValue.data(current.copyWith(players: players));
  }

  void setGameId(String gameId, String roomCode) {
    final current = state.value;
    if (current == null) return;
    state = AsyncValue.data(current.copyWith(
      gameId: gameId,
      roomCode: roomCode,
    ));
  }

  Future<void> leaveRoom() async {
    final current = state.value;
    final user = ref.read(authStateChangesProvider).value;
    if (current?.gameId == null || user == null) return;

    try {
      await ref
          .read(firebaseServiceProvider)
          .leaveRoom(current!.gameId!, user.uid);
    } catch (_) {}
    state = AsyncValue.data(const LobbyState());
  }
}
