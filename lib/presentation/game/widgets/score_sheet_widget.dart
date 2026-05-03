import 'package:flutter/material.dart';
import 'package:yatzy_multiplayer/core/constants/game_constants.dart';
import 'package:yatzy_multiplayer/data/models/score_model.dart';
import 'package:yatzy_multiplayer/domain/game_logic/yatzy_rules.dart';
import 'package:yatzy_multiplayer/presentation/game/widgets/die_face_widget.dart';
import 'package:yatzy_multiplayer/presentation/game/widgets/game_colors.dart';
import 'package:yatzy_multiplayer/presentation/game/widgets/score_box_widget.dart';

class ScoreSheetWidget extends StatelessWidget {
  final ScoreModel score;
  final ScoreModel? opponentScore;
  final List<int> diceValues;
  final bool isMyTurn;
  final int rollsLeft;
  final String? selectedCategory;
  final void Function(String category) onCategoryTap;

  const ScoreSheetWidget({
    super.key,
    required this.score,
    this.opponentScore,
    required this.diceValues,
    required this.isMyTurn,
    required this.rollsLeft,
    this.selectedCategory,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final leftRows = GameConstants.upperCategories.length + 1.15;
        final rightRows = GameConstants.lowerCategories.length;
        final leftRowH = ((constraints.maxHeight - 4) / leftRows).clamp(34.0, 64.0);
        final rightRowH = ((constraints.maxHeight - 4) / rightRows).clamp(26.0, 64.0);
        final minRowH = leftRowH < rightRowH ? leftRowH : rightRowH;
        final dieSize = (minRowH * 0.78).clamp(26.0, 40.0);
        final boxSize = (minRowH * 0.82).clamp(26.0, 44.0);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: _buildLeftColumn(leftRowH, dieSize, boxSize),
              ),
              const SizedBox(width: 3),
              Expanded(
                flex: 5,
                child: _buildRightColumn(rightRowH, boxSize),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLeftColumn(double rowH, double dieSize, double boxSize) {
    return Column(
      children: [
        ...GameConstants.upperCategories.asMap().entries.map((entry) {
          final idx = entry.key;
          final cat = entry.value;
          final bg = idx.isEven ? GameColors.rowAlt1 : GameColors.rowAlt2;
          return _buildUpperRow(cat, bg, rowH, dieSize, boxSize);
        }),
        _buildBonusSection(rowH),
      ],
    );
  }

  Widget _buildRightColumn(double rowH, double boxSize) {
    return Column(
      children: [
        ...GameConstants.lowerCategories.asMap().entries.map((entry) {
          final idx = entry.key;
          final cat = entry.value;
          final bg = idx.isEven ? GameColors.rowAlt1 : GameColors.rowAlt2;
          return _buildLowerRow(cat, bg, rowH, boxSize);
        }),
      ],
    );
  }

  Widget _buildUpperRow(String category, Color bgColor, double rowH, double dieSize, double boxSize) {
    final isFilled = score.isCategoryFilled(category);
    final hasRolled = rollsLeft < 3;
    final canSelect = isMyTurn && !isFilled && hasRolled;

    int? ghostScore;
    if (!isFilled && hasRolled) {
      ghostScore = YatzyRules.getGhostScore(category, diceValues);
    }

    final dieValue = GameConstants.upperCategories.indexOf(category) + 1;

    return SizedBox(
      height: rowH,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          border: const Border(bottom: BorderSide(color: Color(0xFFE8E8E8), width: 0.5)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Row(
          children: [
            Tooltip(
              message: 'Sum of dice showing $dieValue',
              child: SizedBox(
                width: dieSize,
                height: dieSize,
                child: DieFaceWidget(value: dieValue, size: dieSize),
              ),
            ),
            const Spacer(),
            ScoreBoxWidget(
              score: score.getCategoryScore(category),
              ghostScore: ghostScore,
              opponentScore: opponentScore?.getCategoryScore(category),
              isSelected: selectedCategory == category,
              size: boxSize,
              onTap: canSelect ? () => onCategoryTap(category) : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLowerRow(String category, Color bgColor, double rowH, double boxSize) {
    final isFilled = score.isCategoryFilled(category);
    final hasRolled = rollsLeft < 3;
    final canSelect = isMyTurn && !isFilled && hasRolled;

    int? ghostScore;
    if (!isFilled && hasRolled) {
      ghostScore = YatzyRules.getGhostScore(category, diceValues);
    }

    return SizedBox(
      height: rowH,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          border: const Border(bottom: BorderSide(color: Color(0xFFE8E8E8), width: 0.5)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Row(
          children: [
            Tooltip(
              message: _longLabel(category),
              child: SizedBox(
                width: 30,
                child: Center(
                  child: Text(
                    _shortLabel(category),
                    style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: GameColors.categoryIconText, height: 1.1),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
              ),
            ),
            const Spacer(),
            ScoreBoxWidget(
              score: score.getCategoryScore(category),
              ghostScore: ghostScore,
              opponentScore: opponentScore?.getCategoryScore(category),
              isSelected: selectedCategory == category,
              size: boxSize,
              onTap: canSelect ? () => onCategoryTap(category) : null,
            ),
          ],
        ),
      ),
    );
  }

  String _shortLabel(String category) {
    switch (category) {
      case 'pair': return 'PAIR';
      case 'threeOfAKind': return '3x';
      case 'twoPairs': return '2 PAIRS';
      case 'fourOfAKind': return '4x';
      case 'fullHouse': return 'FULL';
      case 'smallStraight': return 'SMALL';
      case 'largeStraight': return 'LRG';
      case 'chance': return 'CH';
      case 'yatzy': return '5x';
      default: return category.toUpperCase().substring(0, 3);
    }
  }

  String _longLabel(String category) {
    switch (category) {
      case 'pair': return 'One Pair: Two dice same value';
      case 'threeOfAKind': return 'Three of a Kind: Sum all dice';
      case 'twoPairs': return 'Two Pairs: Two different pairs';
      case 'fourOfAKind': return 'Four of a Kind: Sum all dice';
      case 'fullHouse': return 'Full House: 3 of a kind + a pair';
      case 'smallStraight': return 'Small Straight: 1-2-3-4-5 (15 pts)';
      case 'largeStraight': return 'Large Straight: 2-3-4-5-6 (20 pts)';
      case 'chance': return 'Chance: Sum of all dice';
      case 'yatzy': return 'Yatzy: 5 same dice (50 pts)';
      default: return category;
    }
  }

  Widget _buildBonusSection(double rowH) {
    final myUpperSum = score.computedUpperSum;
    final myBonus = score.computedUpperBonus;
    final myProgress = (myUpperSum / GameConstants.upperBonusThreshold).clamp(0.0, 1.0);
    final oppUpperSum = opponentScore?.computedUpperSum ?? 0;
    final oppBonus = opponentScore?.computedUpperBonus ?? 0;
    final oppProgress = (oppUpperSum / GameConstants.upperBonusThreshold).clamp(0.0, 1.0);

    return SizedBox(
      height: rowH * 1.15,
      child: Row(
        children: [
          Expanded(child: _buildPlayerBonus('YOU', myUpperSum, myBonus, myProgress, GameColors.playerColors[0])),
          const SizedBox(width: 4),
          Expanded(child: _buildPlayerBonus(
            opponentScore != null ? 'ADV' : '-',
            oppUpperSum,
            oppBonus,
            oppProgress,
            GameColors.playerColors[1],
          )),
        ],
      ),
    );
  }

  Widget _buildPlayerBonus(String label, int sum, int bonus, double progress, Color color) {
    final hasBonus = bonus > 0;
    final circleSize = 26.0;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      decoration: BoxDecoration(
        color: hasBonus ? color.withValues(alpha: 0.08) : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: hasBonus ? color.withValues(alpha: 0.4) : Colors.grey.shade200),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: TextStyle(fontSize: 7, fontWeight: FontWeight.w700, color: color)),
          SizedBox(
            width: circleSize,
            height: circleSize,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: circleSize,
                  height: circleSize,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 3,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(hasBonus ? Colors.green : color),
                  ),
                ),
                Text('$sum', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: color)),
              ],
            ),
          ),
          Text(hasBonus ? '+45' : '+0', style: TextStyle(fontSize: 7, fontWeight: FontWeight.w700, color: hasBonus ? Colors.green.shade700 : Colors.grey)),
        ],
      ),
    );
  }
}
