class GameConstants {
  GameConstants._();

  static const int maxPlayers = 4;
  static const int maxRolls = 3;
  static const int diceCount = 5;
  static const int roomCodeLength = 6;
  static const int upperBonusThreshold = 63;
  static const int upperBonusPoints = 50;
  static const int minPlayersToStart = 2;

  static const int yatzyPoints = 50;
  static const int smallStraightPoints = 15;
  static const int largeStraightPoints = 20;

  static const String roomCodeCharset = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';

  static const List<String> allCategories = [
    'ones',
    'twos',
    'threes',
    'fours',
    'fives',
    'sixes',
    'pair',
    'twoPairs',
    'threeOfAKind',
    'fourOfAKind',
    'fullHouse',
    'smallStraight',
    'largeStraight',
    'chance',
    'yatzy',
  ];

  static const List<String> upperCategories = [
    'ones',
    'twos',
    'threes',
    'fours',
    'fives',
    'sixes',
  ];

  static const List<String> lowerCategories = [
    'pair',
    'twoPairs',
    'threeOfAKind',
    'fourOfAKind',
    'fullHouse',
    'smallStraight',
    'largeStraight',
    'chance',
    'yatzy',
  ];

  static const Map<String, String> categoryLabels = {
    'ones': 'Ones',
    'twos': 'Twos',
    'threes': 'Threes',
    'fours': 'Fours',
    'fives': 'Fives',
    'sixes': 'Sixes',
    'pair': 'One Pair',
    'twoPairs': 'Two Pairs',
    'threeOfAKind': 'Three of a Kind',
    'fourOfAKind': 'Four of a Kind',
    'fullHouse': 'Full House',
    'smallStraight': 'Small Straight',
    'largeStraight': 'Large Straight',
    'chance': 'Chance',
    'yatzy': 'Yatzy',
  };

  static const Map<String, String> categoryDescriptions = {
    'ones': 'Sum of all dice showing 1',
    'twos': 'Sum of all dice showing 2',
    'threes': 'Sum of all dice showing 3',
    'fours': 'Sum of all dice showing 4',
    'fives': 'Sum of all dice showing 5',
    'sixes': 'Sum of all dice showing 6',
    'pair': 'Two dice showing the same number',
    'twoPairs': 'Two different pairs',
    'threeOfAKind': 'Three dice showing the same number',
    'fourOfAKind': 'Four dice showing the same number',
    'fullHouse': 'Three of one kind and two of another',
    'smallStraight': '1-2-3-4-5 (15 points)',
    'largeStraight': '2-3-4-5-6 (20 points)',
    'chance': 'Sum of all dice',
    'yatzy': 'All five dice the same (50 points)',
  };

  static String roomCodeLabel(String code) => code;
}
