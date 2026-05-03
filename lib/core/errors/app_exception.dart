class AppException implements Exception {
  final String code;
  final String message;
  final String? details;

  const AppException({
    required this.code,
    required this.message,
    this.details,
  });

  @override
  String toString() => 'AppException($code): $message';

  factory AppException.roomNotFound({String? details}) => AppException(
        code: 'ROOM_NOT_FOUND',
        message: 'Room not found or has expired.',
        details: details,
      );

  factory AppException.roomFull({String? details}) => AppException(
        code: 'ROOM_FULL',
        message: 'This room is full.',
        details: details,
      );

  factory AppException.invalidRoomCode({String? details}) => AppException(
        code: 'INVALID_ROOM_CODE',
        message: 'Invalid room code format.',
        details: details,
      );

  factory AppException.notYourTurn({String? details}) => AppException(
        code: 'NOT_YOUR_TURN',
        message: 'It is not your turn.',
        details: details,
      );

  factory AppException.categoryAlreadyFilled({String? details}) => AppException(
        code: 'CATEGORY_ALREADY_FILLED',
        message: 'This category has already been scored.',
        details: details,
      );

  factory AppException.noRollsLeft({String? details}) => AppException(
        code: 'NO_ROLLS_LEFT',
        message: 'No rolls left. You must select a category.',
        details: details,
      );

  factory AppException.mustRollFirst({String? details}) => AppException(
        code: 'MUST_ROLL_FIRST',
        message: 'You must roll the dice at least once.',
        details: details,
      );

  factory AppException.notEnoughPlayers({String? details}) => AppException(
        code: 'NOT_ENOUGH_PLAYERS',
        message: 'Need at least 2 players to start.',
        details: details,
      );

  factory AppException.gameAlreadyStarted({String? details}) => AppException(
        code: 'GAME_ALREADY_STARTED',
        message: 'The game has already started.',
        details: details,
      );

  factory AppException.notHost({String? details}) => AppException(
        code: 'NOT_HOST',
        message: 'Only the host can perform this action.',
        details: details,
      );

  factory AppException.serverError({String? details}) => AppException(
        code: 'SERVER_ERROR',
        message: 'An unexpected server error occurred.',
        details: details,
      );

  factory AppException.unauthorized({String? details}) => AppException(
        code: 'UNAUTHORIZED',
        message: 'You must be signed in to perform this action.',
        details: details,
      );

  factory AppException.playerNotFound({String? details}) => AppException(
        code: 'PLAYER_NOT_FOUND',
        message: 'Player not found in this room.',
        details: details,
      );

  factory AppException.validationError({String? details}) => AppException(
        code: 'VALIDATION_ERROR',
        message: 'Validation failed.',
        details: details,
      );
}
