import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:yatzy_multiplayer/core/constants/game_constants.dart';
import 'package:yatzy_multiplayer/core/errors/app_exception.dart';
import 'package:yatzy_multiplayer/core/utils/validators.dart';
import 'package:yatzy_multiplayer/data/models/player_model.dart';
import 'package:yatzy_multiplayer/presentation/auth/auth_provider.dart';
import 'package:yatzy_multiplayer/presentation/game/game_provider.dart';
import 'package:yatzy_multiplayer/presentation/lobby/lobby_provider.dart';

class LobbyScreen extends ConsumerStatefulWidget {
  const LobbyScreen({super.key});

  @override
  ConsumerState<LobbyScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends ConsumerState<LobbyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  bool _isJoining = false;
  bool _isCreatingVsBot = false;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _createRoomVsBot() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    setState(() => _isCreatingVsBot = true);

    final player = PlayerModel(
      playerId: user.uid,
      name: user.displayName ?? 'Player',
      isReady: true,
      isConnected: true,
      joinedAt: DateTime.now().toUtc(),
    );

    try {
      final game = await ref.read(firebaseServiceProvider).createRoom(player);
      final botId = 'bot_${game.gameId}';
      final botPlayer = PlayerModel(
        playerId: botId,
        name: 'Bot',
        isReady: true,
        isConnected: true,
        joinedAt: DateTime.now().toUtc(),
      );
      await ref.read(firebaseServiceProvider).addBotToRoom(game.gameId, botPlayer);
      // Ne pas démarrer le jeu automatiquement - l'utilisateur reste dans le lobby
      ref.read(lobbyProvider.notifier).setGameId(game.gameId, game.roomCode);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isCreatingVsBot = false);
    }
  }

  Future<void> _createRoom() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final player = PlayerModel(
      playerId: user.uid,
      name: user.displayName ?? 'Player',
      isReady: false,
      isConnected: true,
      joinedAt: DateTime.now().toUtc(),
    );

    try {
      await ref.read(lobbyProvider.notifier).createRoom(player);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create room: $e')),
        );
      }
    }
  }

  Future<void> _joinRoom() async {
    if (!_formKey.currentState!.validate()) return;

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    setState(() => _isJoining = true);
    try {
      final code = _codeController.text.trim().toUpperCase();
      final player = PlayerModel(
        playerId: user.uid,
        name: user.displayName ?? 'Player',
        isReady: false,
        isConnected: true,
        joinedAt: DateTime.now().toUtc(),
      );

      final service = ref.read(firebaseServiceProvider);
      final success = await service.joinRoom(code, player);
      if (!success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to join room')),
          );
        }
      }
    } on AppException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) setState(() => _isJoining = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final lobbyState = ref.watch(lobbyProvider);
    final user = ref.watch(authStateChangesProvider).value;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F3460)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SA7BI',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 28,
                        color: Colors.amber.shade400,
                        letterSpacing: 4,
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () => FirebaseAuth.instance.signOut(),
                      icon: const Icon(Icons.logout, color: Colors.white54),
                      label: Text(
                        user?.displayName ?? 'Player',
                        style: const TextStyle(color: Colors.white54),
                      ),
                    ),
                  ],
                ),
                if (lobbyState.hasError) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.error_outline, color: Colors.redAccent, size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            lobbyState.error.toString(),
                            style: const TextStyle(color: Colors.redAccent, fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                if (lobbyState.value?.roomCode != null) ...[
                  _buildRoomInfo(lobbyState.value!.roomCode!),
                  const SizedBox(height: 16),
                  _buildPlayerList(lobbyState.value!.gameId ?? ''),
                  const SizedBox(height: 16),
                  _buildReadyButton(lobbyState.value!.gameId ?? ''),
                  const SizedBox(height: 16),
                  _buildStartGameButton(lobbyState.value!.gameId ?? ''),
                ] else ...[
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: ElevatedButton.icon(
                              onPressed: lobbyState.isLoading
                                  ? null
                                  : _createRoom,
                              icon: const Icon(Icons.add_circle_outline),
                              label: const Text('CREATE ROOM',
                                  style: TextStyle(fontSize: 18)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber.shade400,
                                foregroundColor: const Color(0xFF1A1A2E),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton.icon(
                              onPressed: _isCreatingVsBot
                                  ? null
                                  : _createRoomVsBot,
                              icon: _isCreatingVsBot
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Icon(Icons.smart_toy),
                              label: Text(
                                  _isCreatingVsBot ? 'CHARGEMENT...' : 'JOUER VS IA',
                                  style: const TextStyle(fontSize: 16)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0F3460),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              const Expanded(
                                child: Divider(color: Colors.white24),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16),
                                child: Text(
                                  'OR',
                                  style: TextStyle(
                                    color: Colors.white38,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Divider(color: Colors.white24),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Form(
                            key: _formKey,
                            child: TextFormField(
                              controller: _codeController,
                              validator: Validators.validateRoomCode,
                              textCapitalization: TextCapitalization.characters,
                              maxLength: 6,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                letterSpacing: 8,
                              ),
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                labelText: 'ROOM CODE',
                                labelStyle:
                                    const TextStyle(color: Colors.white54),
                                counterText: '',
                                filled: true,
                                fillColor: Colors.white.withValues(alpha: 0.1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.amber.shade400,
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: _isJoining ? null : _joinRoom,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0F3460),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: _isJoining
                                  ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text('JOIN ROOM',
                                      style: TextStyle(fontSize: 16)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoomInfo(String roomCode) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.meeting_room, color: Colors.white54),
          const SizedBox(width: 8),
          const Text('Room Code:',
              style: TextStyle(color: Colors.white54, fontSize: 16)),
          const SizedBox(width: 12),
          Text(
            roomCode,
            style: GoogleFonts.bebasNeue(
              fontSize: 32,
              color: Colors.amber.shade400,
              letterSpacing: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlayerList(String gameId) {
    final playersAsync = ref.watch(playersStreamProvider(gameId));
    final players = playersAsync.value ?? [];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'PLAYERS (${players.length}/${GameConstants.maxPlayers})',
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 14,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 12),
          ...List.generate(
            GameConstants.maxPlayers,
            (index) {
              if (index < players.length) {
                final player = players[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber.shade400.withValues(alpha: 0.2),
                        ),
                        child: Center(
                          child: Text(
                            player.name[0].toUpperCase(),
                            style: TextStyle(
                              color: Colors.amber.shade400,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          player.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Icon(
                        player.isReady
                            ? Icons.check_circle
                            : Icons.radio_button_unchecked,
                        color: player.isReady
                            ? Colors.green.shade400
                            : Colors.white24,
                      ),
                      if (!player.isConnected)
                        const Icon(Icons.wifi_off,
                            color: Colors.redAccent, size: 18),
                    ],
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.1),
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignOutside,
                        ),
                      ),
                      child: const Icon(Icons.person_add,
                          color: Colors.white24, size: 20),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Waiting...',
                      style: TextStyle(color: Colors.white24, fontSize: 14),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReadyButton(String gameId) {
    final user = ref.watch(authStateChangesProvider).value;
    final playersAsync = ref.watch(playersStreamProvider(gameId));
    final players = playersAsync.value ?? [];

    final currentPlayer = players.where((p) => p.playerId == user?.uid).firstOrNull;
    final isReady = currentPlayer?.isReady ?? false;

    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: () async {
          await ref.read(firebaseServiceProvider).updatePlayerReady(
                gameId,
                user!.uid,
                !isReady,
              );
        },
        icon: Icon(isReady ? Icons.check : Icons.hourglass_empty),
        label: Text(isReady ? 'READY' : 'NOT READY'),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isReady ? Colors.green.shade600 : Colors.white.withValues(alpha: 0.1),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildStartGameButton(String gameId) {
    final gameAsync = ref.watch(gameStreamProvider(gameId));
    final game = gameAsync.value;
    final user = ref.watch(authStateChangesProvider).value;
    final playersAsync = ref.watch(playersStreamProvider(gameId));
    final players = playersAsync.value ?? [];

    if (game == null || user == null) return const SizedBox.shrink();
    if (game.hostId != user.uid) return const SizedBox.shrink();

    // Debug info
    final playerCount = players.length;
    final readyCount = players.where((p) => p.isReady).length;
    final minPlayers = GameConstants.minPlayersToStart;
    final allReady = playerCount >= minPlayers && readyCount == playerCount;

    // Afficher le bouton si conditions remplies ou si en mode solo (2 joueurs avec bot)
    final canStart = allReady || (playerCount == 2 && readyCount == 2);

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: canStart
            ? () async {
                try {
                  await ref
                      .read(firebaseServiceProvider)
                      .startGame(gameId);
                } catch (e) {
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Erreur: $e'),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 5),
                      ),
                    );
                  }
                }
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red.shade700,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          canStart 
              ? 'START GAME' 
              : 'Joueurs: $readyCount/$playerCount (min: $minPlayers)',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
