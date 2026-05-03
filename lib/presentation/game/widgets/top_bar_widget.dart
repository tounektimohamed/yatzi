import 'package:flutter/material.dart';
import 'package:yatzy_multiplayer/presentation/game/widgets/game_colors.dart';

class TopBarWidget extends StatelessWidget {
  final String playerName;
  final int score;
  final int opponentScore;
  final String opponentName;
  final Color accentColor;
  final VoidCallback? onHomeTap;

  const TopBarWidget({
    super.key,
    required this.playerName,
    required this.score,
    this.opponentScore = 0,
    this.opponentName = '',
    this.accentColor = GameColors.primary,
    this.onHomeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [GameColors.primaryLight, GameColors.primary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 2)),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            _buildPlayerChip(playerName, score, accentColor, true),
            const SizedBox(width: 6),
            if (opponentName.isNotEmpty)
              _buildPlayerChip(opponentName, opponentScore, GameColors.playerColors[1], false),
            const Spacer(),
            GestureDetector(
              onTap: onHomeTap,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.home_rounded, color: Colors.white, size: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerChip(String name, int pts, Color color, bool isMain) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: isMain ? Colors.white.withValues(alpha: 0.2) : Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.white,
            child: Text(
              name.isNotEmpty ? name[0].toUpperCase() : '?',
              style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(name, style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
              Text('$pts pts', style: TextStyle(color: Colors.amber.shade300, fontSize: 11, fontWeight: FontWeight.w700)),
            ],
          ),
        ],
      ),
    );
  }
}
