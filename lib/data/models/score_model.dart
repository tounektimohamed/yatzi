import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'score_model.freezed.dart';
part 'score_model.g.dart';

@freezed
class ScoreModel with _$ScoreModel {
  const ScoreModel._();

  const factory ScoreModel({
    required String playerId,
    int? ones,
    int? twos,
    int? threes,
    int? fours,
    int? fives,
    int? sixes,
    int? pair,
    int? twoPairs,
    int? threeOfAKind,
    int? fourOfAKind,
    int? fullHouse,
    int? smallStraight,
    int? largeStraight,
    int? chance,
    int? yatzy,
    @Default(0) int upperBonus,
    @Default(0) int totalScore,
  }) = _ScoreModel;

  factory ScoreModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
    SnapshotOptions? options,
  ) {
    final data = doc.data();
    if (data == null) {
      return ScoreModel(playerId: doc.id);
    }
    return ScoreModel(
      playerId: doc.id,
      ones: data['ones'] as int?,
      twos: data['twos'] as int?,
      threes: data['threes'] as int?,
      fours: data['fours'] as int?,
      fives: data['fives'] as int?,
      sixes: data['sixes'] as int?,
      pair: data['pair'] as int?,
      twoPairs: data['twoPairs'] as int?,
      threeOfAKind: data['threeOfAKind'] as int?,
      fourOfAKind: data['fourOfAKind'] as int?,
      fullHouse: data['fullHouse'] as int?,
      smallStraight: data['smallStraight'] as int?,
      largeStraight: data['largeStraight'] as int?,
      chance: data['chance'] as int?,
      yatzy: data['yatzy'] as int?,
      upperBonus: (data['upperBonus'] as num?)?.toInt() ?? 0,
      totalScore: (data['totalScore'] as num?)?.toInt() ?? 0,
    );
  }

  Map<String, Object?> toFirestore() {
    final calc = _computeBonusAndTotal();
    return {
      'playerId': playerId,
      'ones': ones,
      'twos': twos,
      'threes': threes,
      'fours': fours,
      'fives': fives,
      'sixes': sixes,
      'pair': pair,
      'twoPairs': twoPairs,
      'threeOfAKind': threeOfAKind,
      'fourOfAKind': fourOfAKind,
      'fullHouse': fullHouse,
      'smallStraight': smallStraight,
      'largeStraight': largeStraight,
      'chance': chance,
      'yatzy': yatzy,
      'upperBonus': calc.upperBonus,
      'totalScore': calc.totalScore,
    };
  }

  factory ScoreModel.fromJson(Map<String, dynamic> json) =>
      _$ScoreModelFromJson(json);

  ({int upperBonus, int totalScore}) _computeBonusAndTotal() {
    final upperSum = (ones ?? 0) +
        (twos ?? 0) +
        (threes ?? 0) +
        (fours ?? 0) +
        (fives ?? 0) +
        (sixes ?? 0);
    final bonus = upperSum >= 63 ? 50 : 0;
    final lowerSum = (pair ?? 0) +
        (twoPairs ?? 0) +
        (threeOfAKind ?? 0) +
        (fourOfAKind ?? 0) +
        (fullHouse ?? 0) +
        (smallStraight ?? 0) +
        (largeStraight ?? 0) +
        (chance ?? 0) +
        (yatzy ?? 0);
    return (upperBonus: bonus, totalScore: upperSum + bonus + lowerSum);
  }

  int get computedUpperSum => (ones ?? 0) +
      (twos ?? 0) +
      (threes ?? 0) +
      (fours ?? 0) +
      (fives ?? 0) +
      (sixes ?? 0);

  int get computedUpperBonus => computedUpperSum >= 63 ? 50 : 0;

  int get computedTotalScore => _computeBonusAndTotal().totalScore;

  int? getCategoryScore(String category) {
    switch (category) {
      case 'ones':
        return ones;
      case 'twos':
        return twos;
      case 'threes':
        return threes;
      case 'fours':
        return fours;
      case 'fives':
        return fives;
      case 'sixes':
        return sixes;
      case 'pair':
        return pair;
      case 'twoPairs':
        return twoPairs;
      case 'threeOfAKind':
        return threeOfAKind;
      case 'fourOfAKind':
        return fourOfAKind;
      case 'fullHouse':
        return fullHouse;
      case 'smallStraight':
        return smallStraight;
      case 'largeStraight':
        return largeStraight;
      case 'chance':
        return chance;
      case 'yatzy':
        return yatzy;
      default:
        return null;
    }
  }

  bool isCategoryFilled(String category) => getCategoryScore(category) != null;

  ScoreModel withCategoryScore(String category, int score) {
    final map = <String, int?>{};
    for (final cat in [
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
    ]) {
      map[cat] = cat == category ? score : getCategoryScore(cat);
    }
    final calc = _computeBonusAndTotalForMap(map);
    return copyWith(
      ones: map['ones'],
      twos: map['twos'],
      threes: map['threes'],
      fours: map['fours'],
      fives: map['fives'],
      sixes: map['sixes'],
      pair: map['pair'],
      twoPairs: map['twoPairs'],
      threeOfAKind: map['threeOfAKind'],
      fourOfAKind: map['fourOfAKind'],
      fullHouse: map['fullHouse'],
      smallStraight: map['smallStraight'],
      largeStraight: map['largeStraight'],
      chance: map['chance'],
      yatzy: map['yatzy'],
      upperBonus: calc.upperBonus,
      totalScore: calc.totalScore,
    );
  }

  ({int upperBonus, int totalScore}) _computeBonusAndTotalForMap(
    Map<String, int?> m,
  ) {
    final upperSum = (m['ones'] ?? 0) +
        (m['twos'] ?? 0) +
        (m['threes'] ?? 0) +
        (m['fours'] ?? 0) +
        (m['fives'] ?? 0) +
        (m['sixes'] ?? 0);
    final bonus = upperSum >= 63 ? 50 : 0;
    final lowerSum = (m['pair'] ?? 0) +
        (m['twoPairs'] ?? 0) +
        (m['threeOfAKind'] ?? 0) +
        (m['fourOfAKind'] ?? 0) +
        (m['fullHouse'] ?? 0) +
        (m['smallStraight'] ?? 0) +
        (m['largeStraight'] ?? 0) +
        (m['chance'] ?? 0) +
        (m['yatzy'] ?? 0);
    return (upperBonus: bonus, totalScore: upperSum + bonus + lowerSum);
  }

  bool get isComplete {
    for (final cat in [
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
    ]) {
      if (getCategoryScore(cat) == null) return false;
    }
    return true;
  }
}
