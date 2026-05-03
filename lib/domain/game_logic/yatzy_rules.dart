import 'package:yatzy_multiplayer/core/constants/game_constants.dart';

class YatzyRules {
  YatzyRules._();

  // ═══════════════════════════════════════════════
  // UPPER SECTION
  // ═══════════════════════════════════════════════

  // TESTS: calculateOnes([1,1,3,5,6]) = 2
  // TESTS: calculateOnes([2,3,4,5,6]) = 0
  static int calculateOnes(List<int> dice) => _sumOfValue(dice, 1);

  // TESTS: calculateTwos([2,2,2,1,3]) = 6
  // TESTS: calculateTwos([1,3,4,5,6]) = 0
  static int calculateTwos(List<int> dice) => _sumOfValue(dice, 2);

  // TESTS: calculateThrees([3,3,3,3,1]) = 12
  // TESTS: calculateThrees([1,2,4,5,6]) = 0
  static int calculateThrees(List<int> dice) => _sumOfValue(dice, 3);

  // TESTS: calculateFours([4,4,4,1,2]) = 12
  static int calculateFours(List<int> dice) => _sumOfValue(dice, 4);

  // TESTS: calculateFives([5,5,5,5,1]) = 20
  static int calculateFives(List<int> dice) => _sumOfValue(dice, 5);

  // TESTS: calculateSixes([6,6,6,1,2]) = 18
  static int calculateSixes(List<int> dice) => _sumOfValue(dice, 6);

  static int _sumOfValue(List<int> dice, int target) {
    if (dice.length != 5) return 0;
    return dice.where((d) => d == target).fold(0, (a, b) => a + b);
  }

  // ═══════════════════════════════════════════════
  // LOWER SECTION
  // ═══════════════════════════════════════════════

  // TESTS: calculatePair([3,3,5,1,2]) = 6
  // TESTS: calculatePair([6,6,6,6,1]) = 12
  // TESTS: calculatePair([1,2,3,4,5]) = 0
  static int calculatePair(List<int> dice) {
    if (dice.length != 5) return 0;
    final sorted = List<int>.from(dice)..sort((a, b) => b.compareTo(a));
    for (var i = 0; i < sorted.length - 1; i++) {
      if (sorted[i] == sorted[i + 1]) return sorted[i] * 2;
    }
    return 0;
  }

  // TESTS: calculateTwoPairs([1,1,2,2,5]) = 6
  // TESTS: calculateTwoPairs([1,1,1,1,5]) = 0
  // TESTS: calculateTwoPairs([4,4,5,5,6]) = 18
  static int calculateTwoPairs(List<int> dice) {
    if (dice.length != 5) return 0;
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

  // TESTS: calculateThreeOfAKind([3,3,3,1,2]) = 9
  // TESTS: calculateThreeOfAKind([4,4,4,4,1]) = 12
  // TESTS: calculateThreeOfAKind([1,2,3,4,5]) = 0
  static int calculateThreeOfAKind(List<int> dice) {
    if (dice.length != 5) return 0;
    for (var value = 1; value <= 6; value++) {
      if (dice.where((d) => d == value).length >= 3) return value * 3;
    }
    return 0;
  }

  // TESTS: calculateFourOfAKind([4,4,4,4,1]) = 16
  // TESTS: calculateFourOfAKind([6,6,6,6,6]) = 24
  // TESTS: calculateFourOfAKind([3,3,3,1,2]) = 0
  static int calculateFourOfAKind(List<int> dice) {
    if (dice.length != 5) return 0;
    for (var value = 1; value <= 6; value++) {
      if (dice.where((d) => d == value).length >= 4) return value * 4;
    }
    return 0;
  }

  // TESTS: calculateFullHouse([1,1,1,2,2]) = 7
  // TESTS: calculateFullHouse([3,3,3,3,3]) = 0
  // TESTS: calculateFullHouse([5,5,5,6,6]) = 27
  static int calculateFullHouse(List<int> dice) {
    if (dice.length != 5) return 0;
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

  // TESTS: calculateSmallStraight([1,2,3,4,5]) = 15
  // TESTS: calculateSmallStraight([2,3,4,5,6]) = 0
  // TESTS: calculateSmallStraight([1,2,3,4,4]) = 0
  static int calculateSmallStraight(List<int> dice) {
    if (dice.length != 5) return 0;
    final set = dice.toSet();
    if (set.containsAll([1, 2, 3, 4, 5])) return GameConstants.smallStraightPoints;
    return 0;
  }

  // TESTS: calculateLargeStraight([2,3,4,5,6]) = 20
  // TESTS: calculateLargeStraight([1,2,3,4,5]) = 0
  // TESTS: calculateLargeStraight([1,2,3,4,6]) = 0
  static int calculateLargeStraight(List<int> dice) {
    if (dice.length != 5) return 0;
    final set = dice.toSet();
    if (set.containsAll([2, 3, 4, 5, 6])) return GameConstants.largeStraightPoints;
    return 0;
  }

  // TESTS: calculateChance([1,2,3,4,5]) = 15
  // TESTS: calculateChance([6,6,6,6,6]) = 30
  static int calculateChance(List<int> dice) {
    if (dice.length != 5) return 0;
    return dice.fold(0, (a, b) => a + b);
  }

  // TESTS: calculateYatzy([4,4,4,4,4]) = 50
  // TESTS: calculateYatzy([6,6,6,6,6]) = 50
  // TESTS: calculateYatzy([1,2,3,4,5]) = 0
  static int calculateYatzy(List<int> dice) {
    if (dice.length != 5) return 0;
    if (dice.toSet().length == 1) return GameConstants.yatzyPoints;
    return 0;
  }

  // ═══════════════════════════════════════════════
  // SCORE LOOKUP
  // ═══════════════════════════════════════════════

  static int calculateCategory(String category, List<int> dice) {
    switch (category) {
      case 'ones':
        return calculateOnes(dice);
      case 'twos':
        return calculateTwos(dice);
      case 'threes':
        return calculateThrees(dice);
      case 'fours':
        return calculateFours(dice);
      case 'fives':
        return calculateFives(dice);
      case 'sixes':
        return calculateSixes(dice);
      case 'pair':
        return calculatePair(dice);
      case 'twoPairs':
        return calculateTwoPairs(dice);
      case 'threeOfAKind':
        return calculateThreeOfAKind(dice);
      case 'fourOfAKind':
        return calculateFourOfAKind(dice);
      case 'fullHouse':
        return calculateFullHouse(dice);
      case 'smallStraight':
        return calculateSmallStraight(dice);
      case 'largeStraight':
        return calculateLargeStraight(dice);
      case 'chance':
        return calculateChance(dice);
      case 'yatzy':
        return calculateYatzy(dice);
      default:
        return 0;
    }
  }

  static int? getGhostScore(String category, List<int> dice) {
    if (dice.length != 5) return null;
    final score = calculateCategory(category, dice);
    return score;
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

  static bool isValidCategory(String category) {
    return GameConstants.allCategories.contains(category);
  }

  static bool isUpperCategory(String category) {
    return GameConstants.upperCategories.contains(category);
  }

  static bool isLowerCategory(String category) {
    return GameConstants.lowerCategories.contains(category);
  }
}
