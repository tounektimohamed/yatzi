import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:yatzy_multiplayer/core/constants/game_constants.dart';
import 'package:yatzy_multiplayer/core/errors/app_exception.dart';
import 'package:yatzy_multiplayer/data/models/dice_model.dart';
import 'package:yatzy_multiplayer/data/models/score_model.dart';
import 'package:yatzy_multiplayer/domain/game_logic/bot_brain.dart';
import 'package:yatzy_multiplayer/presentation/auth/auth_provider.dart';
import 'package:yatzy_multiplayer/presentation/game/game_provider.dart';
import 'package:yatzy_multiplayer/presentation/game/widgets/dice_panel_widget.dart';
import 'package:yatzy_multiplayer/presentation/game/widgets/game_colors.dart';
import 'package:yatzy_multiplayer/presentation/game/widgets/game_strings.dart';
import 'package:yatzy_multiplayer/presentation/game/widgets/score_sheet_widget.dart';
import 'package:yatzy_multiplayer/presentation/game/widgets/top_bar_widget.dart';
import 'package:yatzy_multiplayer/presentation/lobby/lobby_provider.dart';

class GameScreen extends ConsumerStatefulWidget {
  final String gameId;

  const GameScreen({super.key, required this.gameId});

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen>
    with SingleTickerProviderStateMixin {
  final BotBrain _bot = BotBrain();
  String? _lastBotTurnId;
  bool _botPlaying = false;
  late AnimationController _pulseController;
  late Animation<double> _pulseAnim;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);
    _pulseAnim = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gameAsync = ref.watch(gameStreamProvider(widget.gameId));
    final playersAsync = ref.watch(playersStreamProvider(widget.gameId));
    final user = ref.watch(authStateChangesProvider).value;
    final selectedCategory = ref.watch(selectedCategoryProvider);

    final game = gameAsync.value;
    final players = playersAsync.value ?? [];
    final currentTurnId = game?.currentTurnPlayerId ?? '';
    final isMyTurn = currentTurnId == user?.uid && game?.isPlaying == true;
    final isFinished = game?.isFinished == true;
    final isBotTurn = currentTurnId.startsWith('bot_') && game?.isPlaying == true;

    if (gameAsync.isLoading || game == null) {
      return const Scaffold(
        backgroundColor: GameColors.background,
        body: Center(
          child: CircularProgressIndicator(color: GameColors.primary),
        ),
      );
    }

    if (isFinished) {
      return _buildFinishedScreen(players);
    }

    if (isBotTurn && !_botPlaying && _lastBotTurnId != currentTurnId) {
      _lastBotTurnId = currentTurnId;
      _playBotTurn(currentTurnId);
    }

    // Réinitialiser pour que le bot puisse rejouer au prochain tour
    if (!isBotTurn && _lastBotTurnId != null) {
      _lastBotTurnId = null;
    }

    final currentPlayer =
        players.where((p) => p.playerId == user?.uid).firstOrNull;
    final scoresMap = ref.watch(scoresStreamProvider(widget.gameId)).value ?? {};
    final myScore = scoresMap[user?.uid];
    final opponent = players.where((p) => p.playerId != user?.uid).firstOrNull;
    final opponentScore = scoresMap[opponent?.playerId];
    final myTotalScore = myScore?.totalScore ?? 0;
    final oppTotalScore = opponentScore?.totalScore ?? 0;

    return Scaffold(
      backgroundColor: GameColors.background,
      body: Column(
        children: [
          TopBarWidget(
            playerName: currentPlayer?.name ?? user?.displayName ?? 'Player',
            score: myTotalScore,
            opponentName: opponent?.name ?? '',
            opponentScore: oppTotalScore,
            accentColor: GameColors.playerColors[0],
            onHomeTap: () => ref.read(lobbyProvider.notifier).leaveRoom(),
          ),
          _buildTurnBanner(isMyTurn, isBotTurn),
          Expanded(
            child: _buildScoreSheet(
              myScore,
              opponentScore,
              isMyTurn,
              selectedCategory,
            ),
          ),
          _buildDicePanel(isMyTurn, myTotalScore),
        ],
      ),
    );
  }

  Widget _buildTurnBanner(bool isMyTurn, bool isBotTurn) {
    if (isBotTurn || _botPlaying) {
      return AnimatedBuilder(
        animation: _pulseAnim,
        builder: (context, child) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.amber.shade200,
                  Colors.amber.shade100,
                  Colors.amber.shade200,
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '🤖',
                  style: TextStyle(fontSize: 16 * _pulseAnim.value),
                ),
                const SizedBox(width: 8),
                Text(
                  'Bot is thinking...',
                  style: TextStyle(
                    color: Colors.amber.shade900,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.amber.shade700),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    if (isMyTurn) {
      final diceAsync = ref.watch(diceStreamProvider(widget.gameId));
      final dice = diceAsync.value;
      final hasRolled = dice != null && dice.rollsLeft < GameConstants.maxRolls;
      final selectedCategory = ref.watch(selectedCategoryProvider);

      String message;
      Color bgColor;
      Color textColor;
      IconData icon;

      if (selectedCategory != null) {
        message = 'Tap again to confirm "${_categoryDisplayName(selectedCategory)}"';
        bgColor = GameColors.primary.withValues(alpha: 0.1);
        textColor = GameColors.primary;
        icon = Icons.touch_app;
      } else if (hasRolled) {
        message = 'Select a category';
        bgColor = Colors.green.shade50;
        textColor = Colors.green.shade800;
        icon = Icons.checklist;
      } else {
        message = 'Roll the dice!';
        bgColor = Colors.orange.shade50;
        textColor = Colors.orange.shade800;
        icon = Icons.casino;
      }

      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border(
            bottom: BorderSide(color: bgColor.withValues(alpha: 0.8)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: textColor),
            const SizedBox(width: 6),
            Text(
              message,
              style: TextStyle(
                color: textColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }

  String _categoryDisplayName(String category) {
    switch (category) {
      case 'ones': return 'Ones';
      case 'twos': return 'Twos';
      case 'threes': return 'Threes';
      case 'fours': return 'Fours';
      case 'fives': return 'Fives';
      case 'sixes': return 'Sixes';
      case 'pair': return 'One Pair';
      case 'twoPairs': return 'Two Pairs';
      case 'threeOfAKind': return 'Three of a Kind';
      case 'fourOfAKind': return 'Four of a Kind';
      case 'fullHouse': return 'Full House';
      case 'smallStraight': return 'Small Straight';
      case 'largeStraight': return 'Large Straight';
      case 'chance': return 'Chance';
      case 'yatzy': return 'Yatzy';
      default: return category;
    }
  }

  Widget _buildScoreSheet(
    ScoreModel? score,
    ScoreModel? opponentScore,
    bool isMyTurn,
    String? selectedCategory,
  ) {
    final diceAsync = ref.watch(diceStreamProvider(widget.gameId));
    final dice = diceAsync.value;

    if (dice == null || score == null) {
      return const Center(
        child: CircularProgressIndicator(color: GameColors.primary),
      );
    }

    return ScoreSheetWidget(
      score: score,
      opponentScore: opponentScore,
      diceValues: dice.values,
      isMyTurn: isMyTurn,
      rollsLeft: dice.rollsLeft,
      selectedCategory: selectedCategory,
      onCategoryTap: isMyTurn
          ? (category) async {
              if (dice.rollsLeft >= GameConstants.maxRolls) return;
              final currentSelected = ref.read(selectedCategoryProvider);
              if (currentSelected == category) {
                await _submitScore(category);
              } else {
                ref.read(selectedCategoryProvider.notifier).state = category;
              }
            }
          : (_) {},
    );
  }

  Widget _buildDicePanel(bool isMyTurn, int totalScore) {
    final diceAsync = ref.watch(diceStreamProvider(widget.gameId));
    final dice = diceAsync.value ?? DiceModel();
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return DicePanelWidget(
      diceValues: dice.values,
      heldDice: dice.held,
      rollsLeft: dice.rollsLeft,
      canRoll: isMyTurn && dice.canRoll,
      showRollDice: isMyTurn && dice.rollsLeft == GameConstants.maxRolls,
      selectedCategory: selectedCategory,
      currentScore: totalScore,
      onRoll: () async {
        try {
          ref.read(selectedCategoryProvider.notifier).state = null;
          await ref.read(firebaseServiceProvider).rollDice(
                widget.gameId,
                dice.held,
              );
        } on AppException {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No more rolls')),
            );
          }
        }
      },
      onToggleHold: isMyTurn
          ? (index) async {
              final currentHeld = ref
                      .read(diceStreamProvider(widget.gameId))
                      .value
                      ?.held ??
                  [];
              if (index < currentHeld.length) {
                await ref.read(firebaseServiceProvider).holdDie(
                      widget.gameId,
                      index,
                      !currentHeld[index],
                    );
              }
            }
          : (_) {},
      onAddScore: () {},
    );
  }

  Future<void> _submitScore(String category) async {
    final user = ref.read(authStateChangesProvider).value;
    if (user == null) return;

    try {
      await ref.read(firebaseServiceProvider).submitScore(
            widget.gameId,
            user.uid,
            category,
          );
      ref.read(selectedCategoryProvider.notifier).state = null;

      // Félicitations selon le score
      if (mounted) _showCongrats(category);

      // Passer le tour au joueur suivant
      await ref.read(firebaseServiceProvider).endTurn(widget.gameId);
      // Vérifier si le jeu est terminé
      await _checkGameEnd();
    } on AppException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    }
  }

  void _showCongrats(String category) {
    final scoresSnap = ref.read(scoresStreamProvider(widget.gameId)).value ?? {};
    final user = ref.read(authStateChangesProvider).value;
    final myScore = scoresSnap[user?.uid];
    if (myScore == null) return;

    String? msg;
    final score = myScore.getCategoryScore(category) ?? 0;

    if (category == 'yatzy' && score >= 50) {
      msg = '🎉 YATZY! 50 points!';
    } else if (category == 'largeStraight' && score >= 20) {
      msg = '🔥 Large Straight! 20 pts!';
    } else if (category == 'smallStraight' && score >= 15) {
      msg = '✨ Small Straight! 15 pts!';
    } else if (category == 'fullHouse' && score > 0) {
      msg = '🏠 Full House! ${score} pts';
    }

    if (msg == null && myScore.computedUpperBonus >= 45) {
      msg = '⭐ BONUS +${GameConstants.upperBonusPoints} unlocked!';
    }

    if (msg != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.amber.shade700,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.all(20),
        ),
      );
    }
  }

  Future<void> _checkGameEnd() async {
    final gameAsync = ref.read(gameStreamProvider(widget.gameId));
    final game = gameAsync.value;
    if (game == null) return;

    final scoresSnap = ref.read(scoresStreamProvider(widget.gameId)).value;
    if (scoresSnap == null) return;

    bool allPlayersComplete = true;
    for (final pid in game.playerOrder) {
      final score = scoresSnap[pid];
      if (score == null || !score.isComplete) {
        allPlayersComplete = false;
        break;
      }
    }

    if (allPlayersComplete) {
      await ref.read(firebaseServiceProvider).endGame(widget.gameId);
    }
  }

  Future<void> _playBotTurn(String botId) async {
    setState(() => _botPlaying = true);
    final service = ref.read(firebaseServiceProvider);
    final gameId = widget.gameId;

    try {
      await Future.delayed(const Duration(milliseconds: 500));

      List<bool> holds = List.filled(5, false);
      for (int roll = 0; roll < 3; roll++) {
        await service.rollDice(gameId, holds);
        await Future.delayed(const Duration(milliseconds: 250));

        final diceSnap = ref.read(diceStreamProvider(gameId)).value;
        if (diceSnap == null) break;

        final scoresSnap = ref.read(scoresStreamProvider(gameId)).value;
        final botScores = scoresSnap?[botId];
        final filled = <String>[];
        if (botScores != null) {
          for (final cat in GameConstants.allCategories) {
            if (botScores.getCategoryScore(cat) != null) filled.add(cat);
          }
        }

        if (roll < 2) {
          holds = _bot.decideHolds(diceSnap.values, filled);
        }
      }

      final diceSnap = ref.read(diceStreamProvider(gameId)).value;
      final scoresSnap = ref.read(scoresStreamProvider(gameId)).value;
      if (diceSnap == null || scoresSnap == null) {
        setState(() => _botPlaying = false);
        return;
      }

      final botScores = scoresSnap[botId];
      final filled = <String>[];
      if (botScores != null) {
        for (final cat in GameConstants.allCategories) {
          if (botScores.getCategoryScore(cat) != null) filled.add(cat);
        }
      }

      final category = _bot.pickCategory(diceSnap.values, filled);
      await Future.delayed(const Duration(milliseconds: 200));
      await service.submitScore(gameId, botId, category);
      await Future.delayed(const Duration(milliseconds: 300));
      await service.endTurn(gameId);
      await _checkGameEnd();
    } catch (_) {
    } finally {
      if (mounted) setState(() => _botPlaying = false);
    }
  }

  Widget _buildFinishedScreen(List<dynamic> players) {
    final scoresAsync = ref.watch(scoresStreamProvider(widget.gameId));
    final scores = scoresAsync.value ?? {};

    String winnerName = '';
    int highestScore = -1;
    scores.forEach((pid, s) {
      if (s.totalScore > highestScore) {
        highestScore = s.totalScore;
        winnerName =
            players.where((p) => p.playerId == pid).firstOrNull?.name ?? '?';
      }
    });

    final isDraw = scores.values.where((s) => s.totalScore == highestScore).length > 1;

    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.emoji_events,
                    size: 80, color: Colors.amber.shade400),
                const SizedBox(height: 12),
                Text(
                  GameStrings.gameOver,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  isDraw ? 'Draw!' : '$winnerName wins!',
                  style: TextStyle(
                    color: Colors.amber.shade400,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                ...players.map((player) {
                  final playerScore = scores[player.playerId];
                  final isWinner = player.name == winnerName && !isDraw;
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 14),
                    decoration: BoxDecoration(
                      color: isWinner
                          ? Colors.amber.shade700.withValues(alpha: 0.9)
                          : Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: isWinner
                          ? Border.all(color: Colors.amber.shade400, width: 2)
                          : null,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: isWinner
                                  ? Colors.amber.shade200
                                  : Colors.white24,
                              child: Text(
                                player.name.isNotEmpty
                                    ? player.name[0].toUpperCase()
                                    : '?',
                                style: TextStyle(
                                  color: isWinner
                                      ? Colors.black
                                      : Colors.white70,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              player.name,
                              style: TextStyle(
                                color:
                                    isWinner ? Colors.black : Colors.white,
                                fontSize: 17,
                                fontWeight: isWinner
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '${playerScore?.totalScore ?? 0} pts',
                          style: TextStyle(
                            color: isWinner
                                ? Colors.black
                                : Colors.amber.shade400,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 28),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ref.read(lobbyProvider.notifier).leaveRoom();
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text(
                      'BACK TO LOBBY',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade400,
                      foregroundColor: const Color(0xFF1A1A2E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
