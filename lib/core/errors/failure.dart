import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.serverError({required String message}) = ServerError;
  const factory Failure.networkError({required String message}) = NetworkError;
  const factory Failure.validationError({required String message}) =
      ValidationError;
  const factory Failure.unauthorized({required String message}) = Unauthorized;
  const factory Failure.notFound({required String message}) = NotFound;
  const factory Failure.gameFull({required String message}) = GameFull;
  const factory Failure.invalidRoomCode({required String message}) =
      InvalidRoomCode;
  const factory Failure.notYourTurn({required String message}) = NotYourTurn;
  const factory Failure.categoryAlreadyFilled({required String message}) =
      CategoryAlreadyFilled;
  const factory Failure.notEnoughPlayers({required String message}) =
      NotEnoughPlayers;
  const factory Failure.notHost({required String message}) = NotHost;
  const factory Failure.gameAlreadyStarted({required String message}) =
      GameAlreadyStarted;
}
