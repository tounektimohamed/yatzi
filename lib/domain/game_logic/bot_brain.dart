import 'dart:math';

import 'package:yatzy_multiplayer/core/constants/game_constants.dart';
import 'package:yatzy_multiplayer/domain/game_logic/yatzy_rules.dart';

class BotBrain {
  final Random _rng = Random();

  List<bool> decideHolds(List<int> dice, List<String> filledCategories) {
    final available = GameConstants.allCategories
        .where((c) => !filledCategories.contains(c))
        .toList();

    if (available.isEmpty) return List.filled(5, false);

    double bestRatio = -1;
    List<bool>? bestHolds;

    for (final cat in available) {
      final holds = _idealHoldsFor(dice, cat);
      final scoreWithHolds = YatzyRules.calculateCategory(cat, _resultAfterHolds(dice, holds));
      final maxScore = _maxPossibleScore(cat);
      final ratio = maxScore > 0 ? scoreWithHolds / maxScore : 0.0;

      if (ratio > bestRatio) {
        bestRatio = ratio;
        bestHolds = holds;
      }
    }

    return bestHolds ?? List.filled(5, false);
  }

  String pickCategory(List<int> dice, List<String> filledCategories) {
    final available = GameConstants.allCategories
        .where((c) => !filledCategories.contains(c))
        .toList();

    if (available.isEmpty) return available.first;

    String bestCat = available.first;
    int bestScore = -1;

    for (final cat in available) {
      final score = YatzyRules.calculateCategory(cat, dice);
      if (score > bestScore) {
        bestScore = score;
        bestCat = cat;
      }
    }

    return bestCat;
  }

  List<bool> _idealHoldsFor(List<int> dice, String category) {
    switch (category) {
      case 'ones':
        return _holdValue(dice, 1);
      case 'twos':
        return _holdValue(dice, 2);
      case 'threes':
        return _holdValue(dice, 3);
      case 'fours':
        return _holdValue(dice, 4);
      case 'fives':
        return _holdValue(dice, 5);
      case 'sixes':
        return _holdValue(dice, 6);
      case 'pair':
        return _holdBestPair(dice);
      case 'twoPairs':
        return _holdTwoPairs(dice);
      case 'threeOfAKind':
        return _holdNOfAKind(dice, 3);
      case 'fourOfAKind':
        return _holdNOfAKind(dice, 4);
      case 'fullHouse':
        return _holdFullHouse(dice);
      case 'smallStraight':
        return _holdStraight(dice, [1, 2, 3, 4, 5]);
      case 'largeStraight':
        return _holdStraight(dice, [2, 3, 4, 5, 6]);
      case 'chance':
        return _holdAbove(dice, 4);
      case 'yatzy':
        return _holdMostFrequent(dice);
      default:
        return List.filled(5, false);
    }
  }

  List<bool> _holdValue(List<int> dice, int value) {
    return dice.map((d) => d == value).toList();
  }

  List<bool> _holdBestPair(List<int> dice) {
    final freq = _frequencies(dice);
    int? bestValue;
    for (final v in [6, 5, 4, 3, 2, 1]) {
      if (freq[v]! >= 2) {
        bestValue = v;
        break;
      }
    }
    if (bestValue == null) return _holdMostFrequent(dice);
    return dice.map((d) => d == bestValue).toList();
  }

  List<bool> _holdTwoPairs(List<int> dice) {
    final freq = _frequencies(dice);
    final pairs = <int>[];
    for (final v in [6, 5, 4, 3, 2, 1]) {
      if (freq[v]! >= 2) pairs.add(v);
    }
    if (pairs.length >= 2) {
      return dice.map((d) => pairs.contains(d)).toList();
    }
    if (pairs.length == 1) {
      final second = _mostFrequentExcluding(dice, {pairs.first});
      return dice.map((d) => d == pairs.first || d == second).toList();
    }
    return _holdBestPair(dice);
  }

  List<bool> _holdNOfAKind(List<int> dice, int n) {
    final freq = _frequencies(dice);
    for (final v in [6, 5, 4, 3, 2, 1]) {
      if (freq[v]! >= n) return dice.map((d) => d == v).toList();
    }
    return _holdMostFrequent(dice);
  }

  List<bool> _holdFullHouse(List<int> dice) {
    final freq = _frequencies(dice);
    int? threeVal;
    int? twoVal;
    for (final v in [6, 5, 4, 3, 2, 1]) {
      if (freq[v]! >= 3 && threeVal == null) {
        threeVal = v;
      } else if (freq[v]! >= 2 && twoVal == null && v != threeVal) {
        twoVal = v;
      }
    }
    if (threeVal != null && twoVal != null) {
      return dice.map((d) => d == threeVal || d == twoVal).toList();
    }
    if (threeVal != null) {
      final sec = _mostFrequentExcluding(dice, {threeVal});
      return dice.map((d) => d == threeVal || d == sec).toList();
    }
    return _holdBestPair(dice);
  }

  List<bool> _holdStraight(List<int> dice, List<int> target) {
    final held = <bool>[];
    final used = <int>{};
    for (final d in dice) {
      if (target.contains(d) && !used.contains(d)) {
        held.add(true);
        used.add(d);
      } else {
        held.add(false);
      }
    }
    return held;
  }

  List<bool> _holdAbove(List<int> dice, int threshold) {
    return dice.map((d) => d >= threshold).toList();
  }

  List<bool> _holdMostFrequent(List<int> dice) {
    final freq = _frequencies(dice);
    int bestVal = 1;
    int bestCount = 0;
    for (final v in [1, 2, 3, 4, 5, 6]) {
      if (freq[v]! > bestCount) {
        bestCount = freq[v]!;
        bestVal = v;
      }
    }
    return dice.map((d) => d == bestVal).toList();
  }

  int? _mostFrequentExcluding(List<int> dice, Set<int> exclude) {
    final freq = _frequencies(dice);
    int bestVal = 1;
    int bestCount = 0;
    for (final v in [1, 2, 3, 4, 5, 6]) {
      if (!exclude.contains(v) && freq[v]! > bestCount) {
        bestCount = freq[v]!;
        bestVal = v;
      }
    }
    return bestCount > 0 ? bestVal : null;
  }

  Map<int, int> _frequencies(List<int> dice) {
    final map = <int, int>{};
    for (var v = 1; v <= 6; v++) {
      map[v] = dice.where((d) => d == v).length;
    }
    return map;
  }

  List<int> _resultAfterHolds(List<int> dice, List<bool> held) {
    return List.generate(5, (i) => held[i] ? dice[i] : _rng.nextInt(6) + 1);
  }

  int _maxPossibleScore(String category) {
    switch (category) {
      case 'ones':
        return 5;
      case 'twos':
        return 10;
      case 'threes':
        return 15;
      case 'fours':
        return 20;
      case 'fives':
        return 25;
      case 'sixes':
        return 30;
      case 'pair':
        return 12;
      case 'twoPairs':
        return 22;
      case 'threeOfAKind':
        return 18;
      case 'fourOfAKind':
        return 24;
      case 'fullHouse':
        return 28;
      case 'smallStraight':
        return 15;
      case 'largeStraight':
        return 20;
      case 'chance':
        return 30;
      case 'yatzy':
        return 50;
      default:
        return 30;
    }
  }
}
