import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yatzy_multiplayer/data/models/dice_model.dart';
import 'package:yatzy_multiplayer/data/models/game_model.dart';
import 'package:yatzy_multiplayer/data/models/player_model.dart';
import 'package:yatzy_multiplayer/data/models/score_model.dart';

import '../auth/auth_provider.dart';

final gameStreamProvider =
    StreamProvider.family<GameModel, String>((ref, gameId) {
  return ref.watch(firebaseServiceProvider).listenToRoom(gameId);
});

final playersStreamProvider =
    StreamProvider.family<List<PlayerModel>, String>((ref, gameId) {
  return ref.watch(firebaseServiceProvider).watchPlayers(gameId);
});

final diceStreamProvider =
    StreamProvider.family<DiceModel, String>((ref, gameId) {
  return ref.watch(firebaseServiceProvider).watchDice(gameId);
});

final scoresStreamProvider =
    StreamProvider.family<Map<String, ScoreModel>, String>((ref, gameId) {
  return ref.watch(firebaseServiceProvider).watchScores(gameId);
});

final selectedCategoryProvider = StateProvider<String?>((ref) => null);
