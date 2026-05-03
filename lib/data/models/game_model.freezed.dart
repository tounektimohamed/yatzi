// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GameModel _$GameModelFromJson(Map<String, dynamic> json) {
  return _GameModel.fromJson(json);
}

/// @nodoc
mixin _$GameModel {
  String get gameId => throw _privateConstructorUsedError;
  GameStatus get status => throw _privateConstructorUsedError;
  String get hostId => throw _privateConstructorUsedError;
  String get roomCode => throw _privateConstructorUsedError;
  int get maxPlayers => throw _privateConstructorUsedError;
  int get currentTurnIndex => throw _privateConstructorUsedError;
  List<String> get playerOrder => throw _privateConstructorUsedError;
  int get roundNumber => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this GameModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameModelCopyWith<GameModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameModelCopyWith<$Res> {
  factory $GameModelCopyWith(GameModel value, $Res Function(GameModel) then) =
      _$GameModelCopyWithImpl<$Res, GameModel>;
  @useResult
  $Res call({
    String gameId,
    GameStatus status,
    String hostId,
    String roomCode,
    int maxPlayers,
    int currentTurnIndex,
    List<String> playerOrder,
    int roundNumber,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$GameModelCopyWithImpl<$Res, $Val extends GameModel>
    implements $GameModelCopyWith<$Res> {
  _$GameModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? status = null,
    Object? hostId = null,
    Object? roomCode = null,
    Object? maxPlayers = null,
    Object? currentTurnIndex = null,
    Object? playerOrder = null,
    Object? roundNumber = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            gameId: null == gameId
                ? _value.gameId
                : gameId // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as GameStatus,
            hostId: null == hostId
                ? _value.hostId
                : hostId // ignore: cast_nullable_to_non_nullable
                      as String,
            roomCode: null == roomCode
                ? _value.roomCode
                : roomCode // ignore: cast_nullable_to_non_nullable
                      as String,
            maxPlayers: null == maxPlayers
                ? _value.maxPlayers
                : maxPlayers // ignore: cast_nullable_to_non_nullable
                      as int,
            currentTurnIndex: null == currentTurnIndex
                ? _value.currentTurnIndex
                : currentTurnIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            playerOrder: null == playerOrder
                ? _value.playerOrder
                : playerOrder // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            roundNumber: null == roundNumber
                ? _value.roundNumber
                : roundNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GameModelImplCopyWith<$Res>
    implements $GameModelCopyWith<$Res> {
  factory _$$GameModelImplCopyWith(
    _$GameModelImpl value,
    $Res Function(_$GameModelImpl) then,
  ) = __$$GameModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String gameId,
    GameStatus status,
    String hostId,
    String roomCode,
    int maxPlayers,
    int currentTurnIndex,
    List<String> playerOrder,
    int roundNumber,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$GameModelImplCopyWithImpl<$Res>
    extends _$GameModelCopyWithImpl<$Res, _$GameModelImpl>
    implements _$$GameModelImplCopyWith<$Res> {
  __$$GameModelImplCopyWithImpl(
    _$GameModelImpl _value,
    $Res Function(_$GameModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameId = null,
    Object? status = null,
    Object? hostId = null,
    Object? roomCode = null,
    Object? maxPlayers = null,
    Object? currentTurnIndex = null,
    Object? playerOrder = null,
    Object? roundNumber = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$GameModelImpl(
        gameId: null == gameId
            ? _value.gameId
            : gameId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as GameStatus,
        hostId: null == hostId
            ? _value.hostId
            : hostId // ignore: cast_nullable_to_non_nullable
                  as String,
        roomCode: null == roomCode
            ? _value.roomCode
            : roomCode // ignore: cast_nullable_to_non_nullable
                  as String,
        maxPlayers: null == maxPlayers
            ? _value.maxPlayers
            : maxPlayers // ignore: cast_nullable_to_non_nullable
                  as int,
        currentTurnIndex: null == currentTurnIndex
            ? _value.currentTurnIndex
            : currentTurnIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        playerOrder: null == playerOrder
            ? _value._playerOrder
            : playerOrder // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        roundNumber: null == roundNumber
            ? _value.roundNumber
            : roundNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GameModelImpl extends _GameModel {
  const _$GameModelImpl({
    required this.gameId,
    required this.status,
    required this.hostId,
    required this.roomCode,
    this.maxPlayers = 4,
    this.currentTurnIndex = 0,
    final List<String> playerOrder = const [],
    this.roundNumber = 0,
    required this.createdAt,
    required this.updatedAt,
  }) : _playerOrder = playerOrder,
       super._();

  factory _$GameModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameModelImplFromJson(json);

  @override
  final String gameId;
  @override
  final GameStatus status;
  @override
  final String hostId;
  @override
  final String roomCode;
  @override
  @JsonKey()
  final int maxPlayers;
  @override
  @JsonKey()
  final int currentTurnIndex;
  final List<String> _playerOrder;
  @override
  @JsonKey()
  List<String> get playerOrder {
    if (_playerOrder is EqualUnmodifiableListView) return _playerOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playerOrder);
  }

  @override
  @JsonKey()
  final int roundNumber;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'GameModel(gameId: $gameId, status: $status, hostId: $hostId, roomCode: $roomCode, maxPlayers: $maxPlayers, currentTurnIndex: $currentTurnIndex, playerOrder: $playerOrder, roundNumber: $roundNumber, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameModelImpl &&
            (identical(other.gameId, gameId) || other.gameId == gameId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.hostId, hostId) || other.hostId == hostId) &&
            (identical(other.roomCode, roomCode) ||
                other.roomCode == roomCode) &&
            (identical(other.maxPlayers, maxPlayers) ||
                other.maxPlayers == maxPlayers) &&
            (identical(other.currentTurnIndex, currentTurnIndex) ||
                other.currentTurnIndex == currentTurnIndex) &&
            const DeepCollectionEquality().equals(
              other._playerOrder,
              _playerOrder,
            ) &&
            (identical(other.roundNumber, roundNumber) ||
                other.roundNumber == roundNumber) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    gameId,
    status,
    hostId,
    roomCode,
    maxPlayers,
    currentTurnIndex,
    const DeepCollectionEquality().hash(_playerOrder),
    roundNumber,
    createdAt,
    updatedAt,
  );

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameModelImplCopyWith<_$GameModelImpl> get copyWith =>
      __$$GameModelImplCopyWithImpl<_$GameModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GameModelImplToJson(this);
  }
}

abstract class _GameModel extends GameModel {
  const factory _GameModel({
    required final String gameId,
    required final GameStatus status,
    required final String hostId,
    required final String roomCode,
    final int maxPlayers,
    final int currentTurnIndex,
    final List<String> playerOrder,
    final int roundNumber,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$GameModelImpl;
  const _GameModel._() : super._();

  factory _GameModel.fromJson(Map<String, dynamic> json) =
      _$GameModelImpl.fromJson;

  @override
  String get gameId;
  @override
  GameStatus get status;
  @override
  String get hostId;
  @override
  String get roomCode;
  @override
  int get maxPlayers;
  @override
  int get currentTurnIndex;
  @override
  List<String> get playerOrder;
  @override
  int get roundNumber;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of GameModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameModelImplCopyWith<_$GameModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
