import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yatzy_multiplayer/core/constants/game_constants.dart';
import 'package:yatzy_multiplayer/data/models/dice_model.dart';
import 'package:yatzy_multiplayer/data/models/score_model.dart';
import 'package:yatzy_multiplayer/domain/game_logic/yatzy_rules.dart';
import 'package:yatzy_multiplayer/presentation/game/game_provider.dart';

class ScoreSheet extends ConsumerWidget {
  final String gameId;
  final String playerId;
  final bool isMyTurn;

  const ScoreSheet({
    super.key,
    required this.gameId,
    required this.playerId,
    required this.isMyTurn,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scoresAsync = ref.watch(scoresStreamProvider(gameId));
    final diceAsync = ref.watch(diceStreamProvider(gameId));
    final selectedCategory = ref.watch(selectedCategoryProvider);

    final scores = scoresAsync.value ?? {};
    final dice = diceAsync.value ?? DiceModel();

    final myScore = scores[playerId] ??
        ScoreModel(playerId: playerId);

    return Column(
      children: [
        _buildSectionHeader('UPPER SECTION', Colors.blue),
        ...GameConstants.upperCategories.map(
          (cat) => _buildCategoryRow(
            context,
            ref,
            cat,
            dice,
            myScore,
            isMyTurn,
            selectedCategory,
          ),
        ),
        _buildSectionHeader('LOWER SECTION', Colors.green),
        ...GameConstants.lowerCategories.map(
          (cat) => _buildCategoryRow(
            context,
            ref,
            cat,
            dice,
            myScore,
            isMyTurn,
            selectedCategory,
          ),
        ),
        const Divider(color: Colors.white24, height: 24),
        _buildTotalRow(myScore),
      ],
    );
  }

  Widget _buildSectionHeader(String title, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      margin: const EdgeInsets.only(bottom: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
      ),
    );
  }

  Widget _buildCategoryRow(
    BuildContext context,
    WidgetRef ref,
    String category,
    DiceModel dice,
    ScoreModel score,
    bool isMyTurn,
    String? selectedCategory,
  ) {
    final isFilled = score.isCategoryFilled(category);
    final possibleScore = isFilled ? null : YatzyRules.getGhostScore(category, dice.values);
    final actualScore = score.getCategoryScore(category);
    final canSelect = isMyTurn && !isFilled && dice.rollsLeft < 3;
    final isSelected = selectedCategory == category;

    return InkWell(
      onTap: canSelect
          ? () {
              if (isSelected) {
                ref.read(selectedCategoryProvider.notifier).state = null;
              } else {
                ref.read(selectedCategoryProvider.notifier).state = category;
              }
            }
          : null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.amber.shade400.withValues(alpha: 0.2)
              : isFilled
                  ? Colors.white.withValues(alpha: 0.03)
                  : null,
          border: isSelected
              ? Border.all(color: Colors.amber.shade400, width: 1.5)
              : null,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(
                GameConstants.categoryLabels[category] ?? category,
                style: TextStyle(
                  color: isFilled ? Colors.white54 : Colors.white,
                  fontSize: 13,
                  decoration: isFilled ? TextDecoration.none : null,
                ),
              ),
            ),
            if (!isFilled && possibleScore != null)
              Text(
                '($possibleScore)',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.2),
                  fontSize: 12,
                ),
              ),
            const SizedBox(width: 8),
            Container(
              width: 40,
              alignment: Alignment.centerRight,
              child: Text(
                isFilled ? '$actualScore' : '-',
                style: TextStyle(
                  color: isFilled ? Colors.amber.shade400 : Colors.white24,
                  fontSize: 15,
                  fontWeight:
                      isFilled ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalRow(ScoreModel score) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'TOTAL',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          Text(
            '${score.totalScore}',
            style: TextStyle(
              color: Colors.amber.shade400,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
