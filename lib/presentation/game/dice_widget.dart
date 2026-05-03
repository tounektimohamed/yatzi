import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yatzy_multiplayer/data/models/dice_model.dart';
import 'package:yatzy_multiplayer/presentation/auth/auth_provider.dart';
import 'package:yatzy_multiplayer/presentation/game/game_provider.dart';

class DiceWidget extends ConsumerWidget {
  final String gameId;
  final bool isMyTurn;

  const DiceWidget({
    super.key,
    required this.gameId,
    required this.isMyTurn,
  });

  static const Map<int, String> _diceFaces = {
    1: '⚀',
    2: '⚁',
    3: '⚂',
    4: '⚃',
    5: '⚄',
    6: '⚅',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diceAsync = ref.watch(diceStreamProvider(gameId));
    final dice = diceAsync.value ?? DiceModel();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: isMyTurn
              ? () async {
                  final newHeld = !dice.held[index];
                  await ref
                      .read(firebaseServiceProvider)
                      .holdDie(gameId, index, newHeld);
                }
              : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: dice.held[index]
                  ? Colors.amber.shade400.withValues(alpha: 0.3)
                  : Colors.white.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: dice.held[index]
                    ? Colors.amber.shade400
                    : Colors.white.withValues(alpha: 0.15),
                width: dice.held[index] ? 2.5 : 1.5,
              ),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              switchInCurve: Curves.easeInBack,
              switchOutCurve: Curves.easeOutBack,
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: Text(
                _diceFaces[dice.values[index]] ?? '?',
                key: ValueKey('${index}_${dice.values[index]}'),
                style: TextStyle(
                  fontSize: 28,
                  color: dice.held[index]
                      ? Colors.amber.shade400
                      : Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      }),
    );
  }
}
