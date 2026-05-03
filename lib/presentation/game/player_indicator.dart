import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yatzy_multiplayer/presentation/game/game_provider.dart';

class PlayerIndicator extends ConsumerWidget {
  final String playerId;
  final int index;
  final String gameId;

  const PlayerIndicator({
    super.key,
    required this.playerId,
    required this.index,
    required this.gameId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameAsync = ref.watch(gameStreamProvider(gameId));
    final playersAsync = ref.watch(playersStreamProvider(gameId));
    final scoresAsync = ref.watch(scoresStreamProvider(gameId));

    final game = gameAsync.value;
    final players = playersAsync.value ?? [];
    final scores = scoresAsync.value ?? {};

    final player = players.where((p) => p.playerId == playerId).firstOrNull;
    final score = scores[playerId];
    final isCurrentTurn = game?.currentTurnPlayerId == playerId;
    final colors = [Colors.red, Colors.blue, Colors.green, Colors.orange];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: isCurrentTurn
            ? colors[index % colors.length].withValues(alpha: 0.3)
            : Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(10),
        border: isCurrentTurn
            ? Border.all(
                color: colors[index % colors.length],
                width: 2,
              )
            : Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colors[index % colors.length].withValues(alpha: 0.3),
            ),
            child: Center(
              child: Text(
                player?.name.isNotEmpty == true
                    ? player!.name[0].toUpperCase()
                    : '?',
                style: TextStyle(
                  color: colors[index % colors.length],
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            player?.name ?? 'Waiting...',
            style: TextStyle(
              color: isCurrentTurn ? Colors.white : Colors.white54,
              fontSize: 11,
              fontWeight: isCurrentTurn ? FontWeight.bold : FontWeight.normal,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Text(
            '${score?.totalScore ?? 0}',
            style: TextStyle(
              color: Colors.amber.shade400,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
