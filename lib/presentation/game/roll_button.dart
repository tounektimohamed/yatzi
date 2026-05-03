import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yatzy_multiplayer/core/constants/game_constants.dart';
import 'package:yatzy_multiplayer/data/models/dice_model.dart';
import 'package:yatzy_multiplayer/presentation/auth/auth_provider.dart';
import 'package:yatzy_multiplayer/presentation/game/game_provider.dart';

class RollButton extends ConsumerWidget {
  final String gameId;
  final bool isMyTurn;

  const RollButton({
    super.key,
    required this.gameId,
    required this.isMyTurn,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diceAsync = ref.watch(diceStreamProvider(gameId));
    final dice = diceAsync.value ?? DiceModel();
    final selectedCategory = ref.watch(selectedCategoryProvider);

    final canRoll = isMyTurn && dice.canRoll;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            GameConstants.maxRolls,
            (index) {
              final rolled = index < GameConstants.maxRolls - dice.rollsLeft;
              return Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: rolled
                      ? Colors.amber.shade400
                      : Colors.white.withValues(alpha: 0.15),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: 200,
          height: 48,
          child: ElevatedButton(
            onPressed: canRoll
                ? () async {
                    await ref.read(firebaseServiceProvider).rollDice(
                          gameId,
                          dice.held,
                        );
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: canRoll
                  ? Colors.amber.shade400
                  : Colors.white.withValues(alpha: 0.08),
              foregroundColor:
                  canRoll ? const Color(0xFF1A1A2E) : Colors.white24,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.casino,
                  size: 22,
                  color: canRoll ? const Color(0xFF1A1A2E) : Colors.white24,
                ),
                const SizedBox(width: 8),
                Text(
                  canRoll
                      ? 'ROLL (${dice.rollsLeft})'
                      : selectedCategory != null
                          ? 'CHOOSE CATEGORY'
                          : 'NO ROLLS LEFT',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: canRoll ? const Color(0xFF1A1A2E) : Colors.white24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
