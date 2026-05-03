import 'package:flutter/material.dart';
import 'package:yatzy_multiplayer/presentation/game/widgets/game_colors.dart';

enum ScoreBoxState { empty, ghost, filled }

class ScoreBoxWidget extends StatelessWidget {
  final int? score;
  final int? ghostScore;
  final int? opponentScore;
  final bool isSelected;
  final VoidCallback? onTap;
  final double size;

  const ScoreBoxWidget({
    super.key,
    this.score,
    this.ghostScore,
    this.opponentScore,
    this.isSelected = false,
    this.onTap,
    this.size = 50,
  });

  ScoreBoxState get _state {
    if (score != null) return ScoreBoxState.filled;
    if (ghostScore != null) return ScoreBoxState.ghost;
    return ScoreBoxState.empty;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _state != ScoreBoxState.filled ? onTap : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: _borderColor,
            width: isSelected ? 2 : 1.5,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: _buildMainContent(),
            ),
            if (opponentScore != null && opponentScore! > 0)
              Positioned(
                top: 1,
                right: 2,
                child: Text(
                  '$opponentScore',
                  style: TextStyle(
                    fontSize: size * 0.2,
                    fontWeight: FontWeight.w600,
                    color: GameColors.playerColors[1].withValues(alpha: 0.7),
                    height: 1,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color get _backgroundColor {
    switch (_state) {
      case ScoreBoxState.filled:
        return GameColors.primary.withValues(alpha: 0.1);
      case ScoreBoxState.ghost:
        return Colors.white;
      case ScoreBoxState.empty:
        return Colors.white;
    }
  }

  Color get _borderColor {
    if (isSelected) return GameColors.primary;
    switch (_state) {
      case ScoreBoxState.filled:
        return GameColors.primary.withValues(alpha: 0.35);
      case ScoreBoxState.ghost:
        return GameColors.primary.withValues(alpha: 0.25);
      case ScoreBoxState.empty:
        if (opponentScore != null && opponentScore! > 0) {
          return GameColors.playerColors[1].withValues(alpha: 0.3);
        }
        return const Color(0xFFE0E0E0);
    }
  }

  Widget _buildMainContent() {
    switch (_state) {
      case ScoreBoxState.filled:
        return Text(
          '$score',
          key: const ValueKey('filled'),
          style: TextStyle(
            color: GameColors.filledText,
            fontSize: size * 0.32,
            fontWeight: FontWeight.bold,
          ),
        );
      case ScoreBoxState.ghost:
        return Text(
          '$ghostScore',
          key: const ValueKey('ghost'),
          style: TextStyle(
            color: GameColors.ghostText,
            fontSize: size * 0.3,
            fontWeight: FontWeight.w500,
          ),
        );
      case ScoreBoxState.empty:
        if (opponentScore != null && opponentScore! > 0) {
          return Text(
            '-',
            key: const ValueKey('opp-filled'),
            style: TextStyle(
              color: GameColors.playerColors[1].withValues(alpha: 0.4),
              fontSize: size * 0.28,
              fontWeight: FontWeight.w400,
            ),
          );
        }
        return const SizedBox(key: ValueKey('empty'));
    }
  }
}
