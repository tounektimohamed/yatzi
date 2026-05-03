import 'dart:math';
import 'package:flutter/material.dart';
import 'package:yatzy_multiplayer/core/constants/game_constants.dart';
import 'package:yatzy_multiplayer/presentation/game/widgets/die_face_widget.dart';
import 'package:yatzy_multiplayer/presentation/game/widgets/game_colors.dart';
import 'package:yatzy_multiplayer/presentation/game/widgets/game_strings.dart';

class DicePanelWidget extends StatefulWidget {
  final List<int> diceValues;
  final List<bool> heldDice;
  final int rollsLeft;
  final bool canRoll;
  final bool showRollDice;
  final String? selectedCategory;
  final int currentScore;
  final VoidCallback onRoll;
  final void Function(int index) onToggleHold;
  final VoidCallback onAddScore;

  const DicePanelWidget({
    super.key,
    required this.diceValues,
    required this.heldDice,
    required this.rollsLeft,
    required this.canRoll,
    this.showRollDice = false,
    this.selectedCategory,
    this.currentScore = 0,
    required this.onRoll,
    required this.onToggleHold,
    required this.onAddScore,
  });

  @override
  State<DicePanelWidget> createState() => _DicePanelWidgetState();
}

class _DicePanelWidgetState extends State<DicePanelWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _shakeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void triggerShake() {
    _shakeController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final hasNotRolled = widget.rollsLeft == GameConstants.maxRolls;
    final showBigRoll = widget.showRollDice && widget.canRoll && hasNotRolled;

    return Container(
      padding: const EdgeInsets.fromLTRB(10, 6, 10, 8),
      decoration: const BoxDecoration(
        color: GameColors.dicePanelBg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, -2)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showBigRoll) _buildRollPrompt(),
          _buildDiceRow(),
          const SizedBox(height: 6),
          _buildRollSection(showBigRoll),
        ],
      ),
    );
  }

  Widget _buildRollPrompt() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('🎲 Roll the dice!', style: TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildDiceRow() {
    return AnimatedBuilder(
      animation: _shakeAnimation,
      builder: (context, child) {
        final shake = _shakeAnimation.value;
        return Transform.rotate(
          angle: shake * 0.08 * sin(shake * pi * 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              GameConstants.diceCount,
              (index) => _buildDieSlot(index),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDieSlot(int index) {
    final isHeld = index < widget.heldDice.length && widget.heldDice[index];
    final value = index < widget.diceValues.length ? widget.diceValues[index] : 1;

    return GestureDetector(
      onTap: widget.canRoll ? () => widget.onToggleHold(index) : null,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: isHeld ? GameColors.diceSlotHeld : GameColors.diceSlot,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isHeld ? GameColors.diceSlotHeldGlow : GameColors.diceSlotHeld.withValues(alpha: 0.3),
            width: isHeld ? 3 : 1.5,
          ),
          boxShadow: isHeld
              ? [
                  BoxShadow(
                    color: GameColors.diceSlotHeldGlow.withValues(alpha: 0.5),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        child: Center(
          child: DieFaceWidget(value: value, isHeld: isHeld, size: 48),
        ),
      ),
    );
  }

  Widget _buildRollSection(bool showBigRoll) {
    final rollsRemaining = widget.rollsLeft;
    final maxRolls = GameConstants.maxRolls;
    final usedRolls = maxRolls - rollsRemaining;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!showBigRoll) ...[
          ...List.generate(usedRolls, (_) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: Icon(Icons.circle, size: 14, color: Colors.white),
          )),
          ...List.generate(rollsRemaining, (_) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: Icon(Icons.circle_outlined, size: 14, color: Colors.white38),
          )),
          const SizedBox(width: 12),
        ],
        GestureDetector(
          onTap: widget.canRoll ? () { triggerShake(); widget.onRoll(); } : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: showBigRoll ? 200 : 130,
            height: showBigRoll ? 54 : 40,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: widget.canRoll
                    ? const [GameColors.rollButtonStart, GameColors.rollButtonEnd]
                    : const [Colors.grey, Colors.grey],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(28),
              boxShadow: widget.canRoll
                  ? [BoxShadow(color: GameColors.rollButtonEnd.withValues(alpha: 0.5), blurRadius: 12, offset: const Offset(0, 4))]
                  : null,
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (showBigRoll) const Text('🎲', style: TextStyle(fontSize: 20)),
                  if (showBigRoll) const SizedBox(width: 8),
                  Text(
                    widget.canRoll ? 'ROLL' : 'DONE',
                    style: TextStyle(color: Colors.white, fontSize: showBigRoll ? 20 : 16, fontWeight: FontWeight.bold, letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
