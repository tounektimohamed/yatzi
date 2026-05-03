import 'package:yatzy_multiplayer/core/constants/game_constants.dart';
import 'package:yatzy_multiplayer/data/models/game_model.dart';

class TurnManager {
  TurnManager._();

  static String getCurrentPlayerId(GameModel game) {
    if (game.playerOrder.isEmpty) return '';
    if (game.currentTurnIndex < 0 ||
        game.currentTurnIndex >= game.playerOrder.length) {
      return '';
    }
    return game.playerOrder[game.currentTurnIndex];
  }

  static int getNextTurnIndex(GameModel game) {
    if (game.playerOrder.isEmpty) return 0;
    return (game.currentTurnIndex + 1) % game.playerOrder.length;
  }

  static int getCurrentRoundNumber(GameModel game) {
    if (game.playerOrder.isEmpty) return 0;
    return (game.currentTurnIndex ~/ game.playerOrder.length) + 1;
  }

  static bool isGameFinished(GameModel game, int completedPlayers) {
    if (game.playerOrder.isEmpty) return false;
    return completedPlayers >= game.playerOrder.length;
  }

  static int countCompletedCategories(Map<String, int?> scores) {
    int count = 0;
    for (final cat in GameConstants.allCategories) {
      if (scores[cat] != null) count++;
    }
    return count;
  }

  static bool hasFinishedAllCategories(Map<String, int?> scores) {
    return countCompletedCategories(scores) >= GameConstants.allCategories.length;
  }

  static String determineWinner(Map<String, int> finalScores) {
    if (finalScores.isEmpty) return '';
    String winner = '';
    int highest = -1;
    finalScores.forEach((playerId, score) {
      if (score > highest) {
        highest = score;
        winner = playerId;
      }
    });
    return winner;
  }

  static int getTurnForPlayer(GameModel game, String playerId) {
    final index = game.playerOrder.indexOf(playerId);
    if (index < 0) return -1;
    return index;
  }

  static bool isPlayerTurn(GameModel game, String playerId) {
    final currentId = getCurrentPlayerId(game);
    return currentId == playerId && game.isPlaying;
  }

  static int rollsThisTurn(int rollsLeft) {
    return GameConstants.maxRolls - rollsLeft;
  }
}
