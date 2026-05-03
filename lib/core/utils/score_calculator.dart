import '../constants/game_constants.dart';

class ScoreCalculator {
  ScoreCalculator._();

  static int? previewScore(String category, List<int> dice) {
    if (dice.length != 5) return null;
    switch (category) {
      case 'ones':
        return _sumOfValue(dice, 1);
      case 'twos':
        return _sumOfValue(dice, 2);
      case 'threes':
        return _sumOfValue(dice, 3);
      case 'fours':
        return _sumOfValue(dice, 4);
      case 'fives':
        return _sumOfValue(dice, 5);
      case 'sixes':
        return _sumOfValue(dice, 6);
      case 'pair':
        return _calculatePair(dice);
      case 'twoPairs':
        return _calculateTwoPairs(dice);
      case 'threeOfAKind':
        return _calculateThreeOfAKind(dice);
      case 'fourOfAKind':
        return _calculateFourOfAKind(dice);
      case 'fullHouse':
        return _calculateFullHouse(dice);
      case 'smallStraight':
        return _calculateSmallStraight(dice);
      case 'largeStraight':
        return _calculateLargeStraight(dice);
      case 'chance':
        return _calculateChance(dice);
      case 'yatzy':
        return _calculateYatzy(dice);
      default:
        return null;
    }
  }

  static int _sumOfValue(List<int> dice, int value) {
    return dice.where((d) => d == value).fold(0, (a, b) => a + b);
  }

  static int _calculatePair(List<int> dice) {
    final sorted = List<int>.from(dice)..sort((a, b) => b.compareTo(a));
    for (var i = 0; i < sorted.length - 1; i++) {
      if (sorted[i] == sorted[i + 1]) return sorted[i] * 2;
    }
    return 0;
  }

  static int _calculateTwoPairs(List<int> dice) {
    final sorted = List<int>.from(dice)..sort((a, b) => b.compareTo(a));
    int firstPair = 0;
    int secondPair = 0;
    for (var i = 0; i < sorted.length - 1; i++) {
      if (sorted[i] == sorted[i + 1]) {
        if (firstPair == 0) {
          firstPair = sorted[i];
          i++;
        } else if (sorted[i] != firstPair && secondPair == 0) {
          secondPair = sorted[i];
          i++;
        }
      }
    }
    if (firstPair > 0 && secondPair > 0) {
      return (firstPair * 2) + (secondPair * 2);
    }
    return 0;
  }

  static int _calculateThreeOfAKind(List<int> dice) {
    for (var value = 1; value <= 6; value++) {
      final count = dice.where((d) => d == value).length;
      if (count >= 3) return value * 3;
    }
    return 0;
  }

  static int _calculateFourOfAKind(List<int> dice) {
    for (var value = 1; value <= 6; value++) {
      final count = dice.where((d) => d == value).length;
      if (count >= 4) return value * 4;
    }
    return 0;
  }

  static int _calculateFullHouse(List<int> dice) {
    bool hasThree = false;
    bool hasTwo = false;
    int sum = 0;
    for (var value = 1; value <= 6; value++) {
      final count = dice.where((d) => d == value).length;
      if (count == 3) {
        hasThree = true;
        sum += value * 3;
      } else if (count == 2) {
        hasTwo = true;
        sum += value * 2;
      }
    }
    return (hasThree && hasTwo) ? sum : 0;
  }

  static int _calculateSmallStraight(List<int> dice) {
    final set = dice.toSet();
    if (set.containsAll([1, 2, 3, 4, 5])) return GameConstants.smallStraightPoints;
    return 0;
  }

  static int _calculateLargeStraight(List<int> dice) {
    final set = dice.toSet();
    if (set.containsAll([2, 3, 4, 5, 6])) return GameConstants.largeStraightPoints;
    return 0;
  }

  static int _calculateChance(List<int> dice) {
    return dice.fold(0, (a, b) => a + b);
  }

  static int _calculateYatzy(List<int> dice) {
    if (dice.toSet().length == 1) return GameConstants.yatzyPoints;
    return 0;
  }

  static int calculateUpperSum(Map<String, int?> scores) {
    int sum = 0;
    for (final cat in GameConstants.upperCategories) {
      sum += scores[cat] ?? 0;
    }
    return sum;
  }

  static int calculateUpperBonus(int upperSum) {
    return upperSum >= GameConstants.upperBonusThreshold
        ? GameConstants.upperBonusPoints
        : 0;
  }

  static int calculateTotalScore(Map<String, int?> scores) {
    final upperSum = calculateUpperSum(scores);
    final bonus = calculateUpperBonus(upperSum);
    int lowerSum = 0;
    for (final cat in GameConstants.lowerCategories) {
      lowerSum += scores[cat] ?? 0;
    }
    return upperSum + bonus + lowerSum;
  }
}
