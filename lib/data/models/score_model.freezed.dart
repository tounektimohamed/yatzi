// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ScoreModel _$ScoreModelFromJson(Map<String, dynamic> json) {
  return _ScoreModel.fromJson(json);
}

/// @nodoc
mixin _$ScoreModel {
  String get playerId => throw _privateConstructorUsedError;
  int? get ones => throw _privateConstructorUsedError;
  int? get twos => throw _privateConstructorUsedError;
  int? get threes => throw _privateConstructorUsedError;
  int? get fours => throw _privateConstructorUsedError;
  int? get fives => throw _privateConstructorUsedError;
  int? get sixes => throw _privateConstructorUsedError;
  int? get pair => throw _privateConstructorUsedError;
  int? get twoPairs => throw _privateConstructorUsedError;
  int? get threeOfAKind => throw _privateConstructorUsedError;
  int? get fourOfAKind => throw _privateConstructorUsedError;
  int? get fullHouse => throw _privateConstructorUsedError;
  int? get smallStraight => throw _privateConstructorUsedError;
  int? get largeStraight => throw _privateConstructorUsedError;
  int? get chance => throw _privateConstructorUsedError;
  int? get yatzy => throw _privateConstructorUsedError;
  int get upperBonus => throw _privateConstructorUsedError;
  int get totalScore => throw _privateConstructorUsedError;

  /// Serializes this ScoreModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScoreModelCopyWith<ScoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoreModelCopyWith<$Res> {
  factory $ScoreModelCopyWith(
    ScoreModel value,
    $Res Function(ScoreModel) then,
  ) = _$ScoreModelCopyWithImpl<$Res, ScoreModel>;
  @useResult
  $Res call({
    String playerId,
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
    int upperBonus,
    int totalScore,
  });
}

/// @nodoc
class _$ScoreModelCopyWithImpl<$Res, $Val extends ScoreModel>
    implements $ScoreModelCopyWith<$Res> {
  _$ScoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? ones = freezed,
    Object? twos = freezed,
    Object? threes = freezed,
    Object? fours = freezed,
    Object? fives = freezed,
    Object? sixes = freezed,
    Object? pair = freezed,
    Object? twoPairs = freezed,
    Object? threeOfAKind = freezed,
    Object? fourOfAKind = freezed,
    Object? fullHouse = freezed,
    Object? smallStraight = freezed,
    Object? largeStraight = freezed,
    Object? chance = freezed,
    Object? yatzy = freezed,
    Object? upperBonus = null,
    Object? totalScore = null,
  }) {
    return _then(
      _value.copyWith(
            playerId: null == playerId
                ? _value.playerId
                : playerId // ignore: cast_nullable_to_non_nullable
                      as String,
            ones: freezed == ones
                ? _value.ones
                : ones // ignore: cast_nullable_to_non_nullable
                      as int?,
            twos: freezed == twos
                ? _value.twos
                : twos // ignore: cast_nullable_to_non_nullable
                      as int?,
            threes: freezed == threes
                ? _value.threes
                : threes // ignore: cast_nullable_to_non_nullable
                      as int?,
            fours: freezed == fours
                ? _value.fours
                : fours // ignore: cast_nullable_to_non_nullable
                      as int?,
            fives: freezed == fives
                ? _value.fives
                : fives // ignore: cast_nullable_to_non_nullable
                      as int?,
            sixes: freezed == sixes
                ? _value.sixes
                : sixes // ignore: cast_nullable_to_non_nullable
                      as int?,
            pair: freezed == pair
                ? _value.pair
                : pair // ignore: cast_nullable_to_non_nullable
                      as int?,
            twoPairs: freezed == twoPairs
                ? _value.twoPairs
                : twoPairs // ignore: cast_nullable_to_non_nullable
                      as int?,
            threeOfAKind: freezed == threeOfAKind
                ? _value.threeOfAKind
                : threeOfAKind // ignore: cast_nullable_to_non_nullable
                      as int?,
            fourOfAKind: freezed == fourOfAKind
                ? _value.fourOfAKind
                : fourOfAKind // ignore: cast_nullable_to_non_nullable
                      as int?,
            fullHouse: freezed == fullHouse
                ? _value.fullHouse
                : fullHouse // ignore: cast_nullable_to_non_nullable
                      as int?,
            smallStraight: freezed == smallStraight
                ? _value.smallStraight
                : smallStraight // ignore: cast_nullable_to_non_nullable
                      as int?,
            largeStraight: freezed == largeStraight
                ? _value.largeStraight
                : largeStraight // ignore: cast_nullable_to_non_nullable
                      as int?,
            chance: freezed == chance
                ? _value.chance
                : chance // ignore: cast_nullable_to_non_nullable
                      as int?,
            yatzy: freezed == yatzy
                ? _value.yatzy
                : yatzy // ignore: cast_nullable_to_non_nullable
                      as int?,
            upperBonus: null == upperBonus
                ? _value.upperBonus
                : upperBonus // ignore: cast_nullable_to_non_nullable
                      as int,
            totalScore: null == totalScore
                ? _value.totalScore
                : totalScore // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ScoreModelImplCopyWith<$Res>
    implements $ScoreModelCopyWith<$Res> {
  factory _$$ScoreModelImplCopyWith(
    _$ScoreModelImpl value,
    $Res Function(_$ScoreModelImpl) then,
  ) = __$$ScoreModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String playerId,
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
    int upperBonus,
    int totalScore,
  });
}

/// @nodoc
class __$$ScoreModelImplCopyWithImpl<$Res>
    extends _$ScoreModelCopyWithImpl<$Res, _$ScoreModelImpl>
    implements _$$ScoreModelImplCopyWith<$Res> {
  __$$ScoreModelImplCopyWithImpl(
    _$ScoreModelImpl _value,
    $Res Function(_$ScoreModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ScoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? playerId = null,
    Object? ones = freezed,
    Object? twos = freezed,
    Object? threes = freezed,
    Object? fours = freezed,
    Object? fives = freezed,
    Object? sixes = freezed,
    Object? pair = freezed,
    Object? twoPairs = freezed,
    Object? threeOfAKind = freezed,
    Object? fourOfAKind = freezed,
    Object? fullHouse = freezed,
    Object? smallStraight = freezed,
    Object? largeStraight = freezed,
    Object? chance = freezed,
    Object? yatzy = freezed,
    Object? upperBonus = null,
    Object? totalScore = null,
  }) {
    return _then(
      _$ScoreModelImpl(
        playerId: null == playerId
            ? _value.playerId
            : playerId // ignore: cast_nullable_to_non_nullable
                  as String,
        ones: freezed == ones
            ? _value.ones
            : ones // ignore: cast_nullable_to_non_nullable
                  as int?,
        twos: freezed == twos
            ? _value.twos
            : twos // ignore: cast_nullable_to_non_nullable
                  as int?,
        threes: freezed == threes
            ? _value.threes
            : threes // ignore: cast_nullable_to_non_nullable
                  as int?,
        fours: freezed == fours
            ? _value.fours
            : fours // ignore: cast_nullable_to_non_nullable
                  as int?,
        fives: freezed == fives
            ? _value.fives
            : fives // ignore: cast_nullable_to_non_nullable
                  as int?,
        sixes: freezed == sixes
            ? _value.sixes
            : sixes // ignore: cast_nullable_to_non_nullable
                  as int?,
        pair: freezed == pair
            ? _value.pair
            : pair // ignore: cast_nullable_to_non_nullable
                  as int?,
        twoPairs: freezed == twoPairs
            ? _value.twoPairs
            : twoPairs // ignore: cast_nullable_to_non_nullable
                  as int?,
        threeOfAKind: freezed == threeOfAKind
            ? _value.threeOfAKind
            : threeOfAKind // ignore: cast_nullable_to_non_nullable
                  as int?,
        fourOfAKind: freezed == fourOfAKind
            ? _value.fourOfAKind
            : fourOfAKind // ignore: cast_nullable_to_non_nullable
                  as int?,
        fullHouse: freezed == fullHouse
            ? _value.fullHouse
            : fullHouse // ignore: cast_nullable_to_non_nullable
                  as int?,
        smallStraight: freezed == smallStraight
            ? _value.smallStraight
            : smallStraight // ignore: cast_nullable_to_non_nullable
                  as int?,
        largeStraight: freezed == largeStraight
            ? _value.largeStraight
            : largeStraight // ignore: cast_nullable_to_non_nullable
                  as int?,
        chance: freezed == chance
            ? _value.chance
            : chance // ignore: cast_nullable_to_non_nullable
                  as int?,
        yatzy: freezed == yatzy
            ? _value.yatzy
            : yatzy // ignore: cast_nullable_to_non_nullable
                  as int?,
        upperBonus: null == upperBonus
            ? _value.upperBonus
            : upperBonus // ignore: cast_nullable_to_non_nullable
                  as int,
        totalScore: null == totalScore
            ? _value.totalScore
            : totalScore // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ScoreModelImpl extends _ScoreModel {
  const _$ScoreModelImpl({
    required this.playerId,
    this.ones,
    this.twos,
    this.threes,
    this.fours,
    this.fives,
    this.sixes,
    this.pair,
    this.twoPairs,
    this.threeOfAKind,
    this.fourOfAKind,
    this.fullHouse,
    this.smallStraight,
    this.largeStraight,
    this.chance,
    this.yatzy,
    this.upperBonus = 0,
    this.totalScore = 0,
  }) : super._();

  factory _$ScoreModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScoreModelImplFromJson(json);

  @override
  final String playerId;
  @override
  final int? ones;
  @override
  final int? twos;
  @override
  final int? threes;
  @override
  final int? fours;
  @override
  final int? fives;
  @override
  final int? sixes;
  @override
  final int? pair;
  @override
  final int? twoPairs;
  @override
  final int? threeOfAKind;
  @override
  final int? fourOfAKind;
  @override
  final int? fullHouse;
  @override
  final int? smallStraight;
  @override
  final int? largeStraight;
  @override
  final int? chance;
  @override
  final int? yatzy;
  @override
  @JsonKey()
  final int upperBonus;
  @override
  @JsonKey()
  final int totalScore;

  @override
  String toString() {
    return 'ScoreModel(playerId: $playerId, ones: $ones, twos: $twos, threes: $threes, fours: $fours, fives: $fives, sixes: $sixes, pair: $pair, twoPairs: $twoPairs, threeOfAKind: $threeOfAKind, fourOfAKind: $fourOfAKind, fullHouse: $fullHouse, smallStraight: $smallStraight, largeStraight: $largeStraight, chance: $chance, yatzy: $yatzy, upperBonus: $upperBonus, totalScore: $totalScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScoreModelImpl &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.ones, ones) || other.ones == ones) &&
            (identical(other.twos, twos) || other.twos == twos) &&
            (identical(other.threes, threes) || other.threes == threes) &&
            (identical(other.fours, fours) || other.fours == fours) &&
            (identical(other.fives, fives) || other.fives == fives) &&
            (identical(other.sixes, sixes) || other.sixes == sixes) &&
            (identical(other.pair, pair) || other.pair == pair) &&
            (identical(other.twoPairs, twoPairs) ||
                other.twoPairs == twoPairs) &&
            (identical(other.threeOfAKind, threeOfAKind) ||
                other.threeOfAKind == threeOfAKind) &&
            (identical(other.fourOfAKind, fourOfAKind) ||
                other.fourOfAKind == fourOfAKind) &&
            (identical(other.fullHouse, fullHouse) ||
                other.fullHouse == fullHouse) &&
            (identical(other.smallStraight, smallStraight) ||
                other.smallStraight == smallStraight) &&
            (identical(other.largeStraight, largeStraight) ||
                other.largeStraight == largeStraight) &&
            (identical(other.chance, chance) || other.chance == chance) &&
            (identical(other.yatzy, yatzy) || other.yatzy == yatzy) &&
            (identical(other.upperBonus, upperBonus) ||
                other.upperBonus == upperBonus) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    playerId,
    ones,
    twos,
    threes,
    fours,
    fives,
    sixes,
    pair,
    twoPairs,
    threeOfAKind,
    fourOfAKind,
    fullHouse,
    smallStraight,
    largeStraight,
    chance,
    yatzy,
    upperBonus,
    totalScore,
  );

  /// Create a copy of ScoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScoreModelImplCopyWith<_$ScoreModelImpl> get copyWith =>
      __$$ScoreModelImplCopyWithImpl<_$ScoreModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScoreModelImplToJson(this);
  }
}

abstract class _ScoreModel extends ScoreModel {
  const factory _ScoreModel({
    required final String playerId,
    final int? ones,
    final int? twos,
    final int? threes,
    final int? fours,
    final int? fives,
    final int? sixes,
    final int? pair,
    final int? twoPairs,
    final int? threeOfAKind,
    final int? fourOfAKind,
    final int? fullHouse,
    final int? smallStraight,
    final int? largeStraight,
    final int? chance,
    final int? yatzy,
    final int upperBonus,
    final int totalScore,
  }) = _$ScoreModelImpl;
  const _ScoreModel._() : super._();

  factory _ScoreModel.fromJson(Map<String, dynamic> json) =
      _$ScoreModelImpl.fromJson;

  @override
  String get playerId;
  @override
  int? get ones;
  @override
  int? get twos;
  @override
  int? get threes;
  @override
  int? get fours;
  @override
  int? get fives;
  @override
  int? get sixes;
  @override
  int? get pair;
  @override
  int? get twoPairs;
  @override
  int? get threeOfAKind;
  @override
  int? get fourOfAKind;
  @override
  int? get fullHouse;
  @override
  int? get smallStraight;
  @override
  int? get largeStraight;
  @override
  int? get chance;
  @override
  int? get yatzy;
  @override
  int get upperBonus;
  @override
  int get totalScore;

  /// Create a copy of ScoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScoreModelImplCopyWith<_$ScoreModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
