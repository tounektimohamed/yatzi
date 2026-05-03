import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

import 'package:yatzy_multiplayer/core/constants/firestore_paths.dart';
import 'package:yatzy_multiplayer/core/constants/game_constants.dart';
import 'package:yatzy_multiplayer/core/errors/app_exception.dart';
import 'package:yatzy_multiplayer/data/models/dice_model.dart';
import 'package:yatzy_multiplayer/data/models/game_model.dart';
import 'package:yatzy_multiplayer/data/models/player_model.dart';
import 'package:yatzy_multiplayer/data/models/score_model.dart';
import 'package:yatzy_multiplayer/domain/game_logic/yatzy_rules.dart';

class FirebaseService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  FirebaseService({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _auth = auth ?? FirebaseAuth.instance;

  // ═════════════════════════════════════════════════════
  // TYPED REFERENCES (with .withConverter for type safety)
  // ═════════════════════════════════════════════════════

  DocumentReference<GameModel> _gameDoc(String gameId) =>
      _firestore.doc(FirestorePaths.gameDoc(gameId)).withConverter<GameModel>(
            fromFirestore: GameModel.fromFirestore,
            toFirestore: (model, _) => model.toFirestore(),
          );

  CollectionReference<GameModel> _gamesCol() =>
      _firestore.collection(FirestorePaths.games).withConverter<GameModel>(
            fromFirestore: GameModel.fromFirestore,
            toFirestore: (model, _) => model.toFirestore(),
          );

  DocumentReference<PlayerModel> _playerDoc(
    String gameId,
    String playerId,
  ) =>
      _firestore
          .doc(FirestorePaths.playerDoc(gameId, playerId))
          .withConverter<PlayerModel>(
            fromFirestore: PlayerModel.fromFirestore,
            toFirestore: (model, _) => model.toFirestore(),
          );

  CollectionReference<PlayerModel> _playersCol(String gameId) =>
      _firestore
          .collection(FirestorePaths.playersCollection(gameId))
          .withConverter<PlayerModel>(
            fromFirestore: PlayerModel.fromFirestore,
            toFirestore: (model, _) => model.toFirestore(),
          );

  DocumentReference<DiceModel> _diceDoc(String gameId) =>
      _firestore.doc(FirestorePaths.diceDoc(gameId)).withConverter<DiceModel>(
            fromFirestore: DiceModel.fromFirestore,
            toFirestore: (model, _) => model.toFirestore(),
          );

  CollectionReference<ScoreModel> _scoresCol(String gameId) =>
      _firestore
          .collection(FirestorePaths.scoresCollection(gameId))
          .withConverter<ScoreModel>(
            fromFirestore: ScoreModel.fromFirestore,
            toFirestore: (model, _) => model.toFirestore(),
          );

  // ═════════════════════════════════════════════════════
  // RAW REFERENCES (for atomic writes and transactions)
  // ═════════════════════════════════════════════════════

  DocumentReference<Map<String, dynamic>> _gameDocRaw(String gameId) =>
      _firestore.doc(FirestorePaths.gameDoc(gameId));

  DocumentReference<Map<String, dynamic>> _playerDocRaw(
    String gameId,
    String playerId,
  ) =>
      _firestore.doc(FirestorePaths.playerDoc(gameId, playerId));

  DocumentReference<Map<String, dynamic>> _diceDocRaw(String gameId) =>
      _firestore.doc(FirestorePaths.diceDoc(gameId));

  DocumentReference<Map<String, dynamic>> _scoreDocRaw(
    String gameId,
    String playerId,
  ) =>
      _firestore.doc(FirestorePaths.scoreDoc(gameId, playerId));

  // ═════════════════════════════════════════════════════
  // ROOM MANAGEMENT
  // ═════════════════════════════════════════════════════

  Future<GameModel> createRoom(PlayerModel hostPlayer) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) throw AppException.unauthorized();

      final gameId = const Uuid().v4();
      final roomCode = await _generateUniqueRoomCode();
      final now = DateTime.now().toUtc();

      final game = GameModel(
        gameId: gameId,
        status: GameStatus.waiting,
        hostId: hostPlayer.playerId,
        roomCode: roomCode,
        maxPlayers: GameConstants.maxPlayers,
        currentTurnIndex: 0,
        playerOrder: [hostPlayer.playerId],
        roundNumber: 0,
        createdAt: now,
        updatedAt: now,
      );

      final writeBatch = _firestore.batch();
      writeBatch.set(_gameDocRaw(gameId), game.toFirestore());
      writeBatch.set(
        _playerDocRaw(gameId, hostPlayer.playerId),
        hostPlayer.toFirestore(),
      );
      writeBatch.set(
        _diceDocRaw(gameId),
        DiceModel().toFirestore(),
      );

      await writeBatch.commit();
      return game;
    } on AppException {
      rethrow;
    } on FirebaseException catch (e) {
      throw AppException.serverError(details: e.message);
    } catch (e) {
      throw AppException.serverError(details: e.toString());
    }
  }

  Future<void> addBotToRoom(String gameId, PlayerModel botPlayer) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) throw AppException.unauthorized();

      final gameSnap = await _gameDoc(gameId).get();
      if (!gameSnap.exists) throw AppException.roomNotFound();

      final game = gameSnap.data()!;
      if (game.playerOrder.length >= game.maxPlayers) {
        throw AppException.roomFull();
      }

      final updatedOrder = [...game.playerOrder, botPlayer.playerId];
      await _firestore.runTransaction((transaction) async {
        transaction.set(
          _playerDocRaw(gameId, botPlayer.playerId),
          botPlayer.toFirestore(),
        );
        transaction.update(_gameDocRaw(gameId), {
          'playerOrder': updatedOrder,
          'updatedAt': FieldValue.serverTimestamp(),
        });
      });
    } on AppException {
      rethrow;
    } on FirebaseException catch (e) {
      throw AppException.serverError(details: e.message);
    } catch (e) {
      throw AppException.serverError(details: e.toString());
    }
  }

  Future<bool> joinRoom(String roomCode, PlayerModel player) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) throw AppException.unauthorized();

      final query = await _gamesCol()
          .where('roomCode', isEqualTo: roomCode.toUpperCase())
          .where('status', isEqualTo: 'waiting')
          .limit(1)
          .get();

      if (query.docs.isEmpty) throw AppException.roomNotFound();

      final game = query.docs.first.data();
      if (game.playerOrder.length >= game.maxPlayers) {
        throw AppException.roomFull();
      }

      if (game.playerOrder.contains(player.playerId)) {
        final playerSnap = await _playerDoc(game.gameId, player.playerId).get();
        if (playerSnap.exists) {
          final updatedPlayer = player.copyWith(isConnected: true);
          await _playerDoc(game.gameId, player.playerId)
              .set(updatedPlayer);
          return true;
        }
      }

      final updatedOrder = [...game.playerOrder, player.playerId];
      await _firestore.runTransaction((transaction) async {
        transaction.set(
          _playerDocRaw(game.gameId, player.playerId),
          player.toFirestore(),
        );
        transaction.update(_gameDocRaw(game.gameId), {
          'playerOrder': updatedOrder,
          'updatedAt': FieldValue.serverTimestamp(),
        });
      });

      return true;
    } on AppException {
      rethrow;
    } on FirebaseException catch (e) {
      throw AppException.serverError(details: e.message);
    } catch (e) {
      throw AppException.serverError(details: e.toString());
    }
  }

  Future<void> leaveRoom(String gameId, String playerId) async {
    try {
      final gameSnap = await _gameDoc(gameId).get();
      if (!gameSnap.exists) return;

      final game = gameSnap.data()!;
      final newOrder =
          game.playerOrder.where((id) => id != playerId).toList();

      if (playerId == game.hostId && newOrder.isNotEmpty) {
        await _gameDocRaw(gameId).update({
          'hostId': newOrder.first,
          'playerOrder': newOrder,
          'updatedAt': FieldValue.serverTimestamp(),
        });
      } else if (newOrder.isEmpty) {
        await _gameDocRaw(gameId).delete();
      } else {
        await _gameDocRaw(gameId).update({
          'playerOrder': newOrder,
          'updatedAt': FieldValue.serverTimestamp(),
        });
      }

      await _playerDocRaw(gameId, playerId).delete();
      await _scoreDocRaw(gameId, playerId).delete();
    } on AppException {
      rethrow;
    } on FirebaseException catch (e) {
      throw AppException.serverError(details: e.message);
    } catch (e) {
      throw AppException.serverError(details: e.toString());
    }
  }

  Stream<GameModel> listenToRoom(String gameId) {
    return _gameDoc(gameId).snapshots().map((snap) {
      if (!snap.exists) throw AppException.roomNotFound();
      return snap.data()!;
    });
  }

  // ═════════════════════════════════════════════════════
  // PLAYER MANAGEMENT
  // ═════════════════════════════════════════════════════

  Stream<List<PlayerModel>> watchPlayers(String gameId) {
    return _playersCol(gameId).snapshots().map((snap) {
      return snap.docs.map((doc) => doc.data()).toList();
    });
  }

  Future<void> updatePlayerReady(
    String gameId,
    String playerId,
    bool isReady,
  ) async {
    try {
      await _playerDocRaw(gameId, playerId).update({
        'isReady': isReady,
      });
    } on FirebaseException catch (e) {
      throw AppException.serverError(details: e.message);
    } catch (e) {
      throw AppException.serverError(details: e.toString());
    }
  }

  Future<void> startGame(String gameId) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) throw AppException.unauthorized();

      final gameSnap = await _gameDoc(gameId).get();
      if (!gameSnap.exists) throw AppException.roomNotFound();

      final game = gameSnap.data()!;
      if (game.hostId != currentUser.uid) throw AppException.notHost();
      if (game.playerOrder.length < GameConstants.minPlayersToStart) {
        throw AppException.notEnoughPlayers();
      }
      if (!game.isWaiting) throw AppException.gameAlreadyStarted();

      // Mettre à jour le statut du jeu
      await _gameDocRaw(gameId).update({
        'status': GameStatus.playing.name,
        'updatedAt': FieldValue.serverTimestamp(),
      });

      // Réinitialiser les dés
      await _diceDocRaw(gameId).set(DiceModel().toFirestore());

      // Initialiser les scores pour tous les joueurs
      for (final playerId in game.playerOrder) {
        await _scoreDocRaw(gameId, playerId).set({
          'playerId': playerId,
          'ones': null,
          'twos': null,
          'threes': null,
          'fours': null,
          'fives': null,
          'sixes': null,
          'pair': null,
          'twoPairs': null,
          'threeOfAKind': null,
          'fourOfAKind': null,
          'fullHouse': null,
          'smallStraight': null,
          'largeStraight': null,
          'chance': null,
          'yatzy': null,
          'upperBonus': 0,
          'totalScore': 0,
        });
      }
    } on AppException {
      rethrow;
    } on FirebaseException catch (e) {
      throw AppException.serverError(details: 'Firebase: ${e.message}');
    } catch (e) {
      throw AppException.serverError(details: e.toString());
    }
  }

  // ═════════════════════════════════════════════════════
  // GAMEPLAY
  // ═════════════════════════════════════════════════════

  Future<DiceModel> rollDice(String gameId, List<bool> heldDice) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) throw AppException.unauthorized();

      final diceSnap = await _diceDoc(gameId).get();
      if (!diceSnap.exists) throw AppException.serverError(details: 'Dice not found');

      final dice = diceSnap.data()!;
      if (!dice.canRoll) throw AppException.noRollsLeft();

      final rng = Random();
      final newValues = <int>[];
      for (var i = 0; i < GameConstants.diceCount; i++) {
        if (i < heldDice.length && heldDice[i]) {
          newValues.add(dice.values[i]);
        } else {
          newValues.add(rng.nextInt(6) + 1);
        }
      }

      final updatedDice = dice.copyWith(
        values: newValues,
        held: heldDice.length == GameConstants.diceCount
            ? heldDice
            : dice.held,
        rollsLeft: dice.rollsLeft - 1,
        lastRolledAt: DateTime.now().toUtc(),
      );

      await _diceDocRaw(gameId).update(updatedDice.toFirestore());
      return updatedDice;
    } on AppException {
      rethrow;
    } on FirebaseException catch (e) {
      throw AppException.serverError(details: e.message);
    } catch (e) {
      throw AppException.serverError(details: e.toString());
    }
  }

  Future<void> holdDie(String gameId, int dieIndex, bool held) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) throw AppException.unauthorized();

      final diceSnap = await _diceDoc(gameId).get();
      if (!diceSnap.exists) return;

      final dice = diceSnap.data()!;
      final newHeld = List<bool>.from(dice.held);
      if (dieIndex >= 0 && dieIndex < newHeld.length) {
        newHeld[dieIndex] = held;
      }

      await _diceDocRaw(gameId).update({'held': newHeld});
    } on AppException {
      rethrow;
    } on FirebaseException catch (e) {
      throw AppException.serverError(details: e.message);
    } catch (e) {
      throw AppException.serverError(details: e.toString());
    }
  }

  Future<void> submitScore(
    String gameId,
    String playerId,
    String category,
  ) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) throw AppException.unauthorized();
      // Allow player to submit own score, OR host to submit for bot
      if (currentUser.uid != playerId && !playerId.startsWith('bot_')) {
        throw AppException.notYourTurn();
      }

      if (!YatzyRules.isValidCategory(category)) {
        throw AppException.validationError(details: 'Invalid category: $category');
      }

      await _firestore.runTransaction((transaction) async {
        final diceSnap = await transaction.get(_diceDocRaw(gameId));
        final diceValues =
            (diceSnap.data()?['values'] as List?)?.cast<int>() ?? [];

        if (diceValues.isEmpty) {
          throw AppException.mustRollFirst();
        }

        final scoreSnap = await transaction.get(
          _scoreDocRaw(gameId, playerId),
        );
        final existingData = scoreSnap.data() ?? {};

        if (existingData[category] != null) {
          throw AppException.categoryAlreadyFilled();
        }

        final calculatedScore = YatzyRules.calculateCategory(
          category,
          diceValues,
        );

        final allScores = <String, int?>{};
        for (final cat in GameConstants.allCategories) {
          allScores[cat] = existingData[cat] as int?;
        }
        allScores[category] = calculatedScore;

        final upperSum = YatzyRules.calculateUpperSum(allScores);
        final upperBonus = YatzyRules.calculateUpperBonus(upperSum);
        final totalScore = YatzyRules.calculateTotalScore(allScores);

        transaction.set(_scoreDocRaw(gameId, playerId), {
          'playerId': playerId,
          ...allScores,
          'upperBonus': upperBonus,
          'totalScore': totalScore,
        }, SetOptions(merge: true));
      });
    } on AppException {
      rethrow;
    } on FirebaseException catch (e) {
      throw AppException.serverError(details: e.message);
    } catch (e) {
      throw AppException.serverError(details: e.toString());
    }
  }

  Future<void> endTurn(String gameId) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser == null) throw AppException.unauthorized();

      final gameSnap = await _gameDoc(gameId).get();
      if (!gameSnap.exists) throw AppException.roomNotFound();

      final game = gameSnap.data()!;
      if (!game.isPlaying) throw AppException.gameAlreadyStarted();
      if (game.currentTurnPlayerId != currentUser.uid &&
          !game.currentTurnPlayerId.startsWith('bot_')) {
        throw AppException.notYourTurn();
      }

      final nextIndex = (game.currentTurnIndex + 1) %
          game.playerOrder.length;

      final writeBatch = _firestore.batch();
      writeBatch.update(_gameDocRaw(gameId), {
        'currentTurnIndex': nextIndex,
        'updatedAt': FieldValue.serverTimestamp(),
      });
      writeBatch.set(
        _diceDocRaw(gameId),
        DiceModel().toFirestore(),
      );

      await writeBatch.commit();
    } on AppException {
      rethrow;
    } on FirebaseException catch (e) {
      throw AppException.serverError(details: e.message);
    } catch (e) {
      throw AppException.serverError(details: e.toString());
    }
  }

  Future<void> endGame(String gameId) async {
    try {
      await _gameDocRaw(gameId).update({
        'status': GameStatus.finished.name,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (e) {
      throw AppException.serverError(details: e.message);
    } catch (e) {
      throw AppException.serverError(details: e.toString());
    }
  }

  // ═════════════════════════════════════════════════════
  // REAL-TIME STREAMS
  // ═════════════════════════════════════════════════════

  Stream<DiceModel> watchDice(String gameId) {
    return _diceDoc(gameId).snapshots().map((snap) {
      if (!snap.exists) return DiceModel();
      return snap.data()!;
    });
  }

  Stream<Map<String, ScoreModel>> watchScores(String gameId) {
    return _scoresCol(gameId).snapshots().map((snap) {
      final map = <String, ScoreModel>{};
      for (final doc in snap.docs) {
        map[doc.id] = doc.data();
      }
      return map;
    });
  }

  Stream<String> watchCurrentTurn(String gameId) {
    return listenToRoom(gameId).map((game) => game.currentTurnPlayerId);
  }

  // ═════════════════════════════════════════════════════
  // PRIVATE HELPERS
  // ═════════════════════════════════════════════════════

  Future<String> _generateUniqueRoomCode() async {
    const maxAttempts = 10;
    for (var i = 0; i < maxAttempts; i++) {
      final code = _generateRoomCode();
      final existing = await _gamesCol()
          .where('roomCode', isEqualTo: code)
          .where('status', isEqualTo: 'waiting')
          .limit(1)
          .get();
      if (existing.docs.isEmpty) return code;
    }
    throw AppException.serverError(
      details: 'Could not generate unique room code',
    );
  }

  String _generateRoomCode() {
    final rng = Random();
    return List.generate(
      GameConstants.roomCodeLength,
      (_) => GameConstants.roomCodeCharset[rng.nextInt(
        GameConstants.roomCodeCharset.length,
      )],
    ).join();
  }
}
