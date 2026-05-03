class FirestorePaths {
  FirestorePaths._();

  static const String games = 'games';

  static String gameDoc(String gameId) => '$games/$gameId';
  static String playersCollection(String gameId) => '${gameDoc(gameId)}/players';
  static String playerDoc(String gameId, String playerId) =>
      '${playersCollection(gameId)}/$playerId';
  static String diceCollection(String gameId) => '${gameDoc(gameId)}/dice';
  static String diceDoc(String gameId) => '${diceCollection(gameId)}/$gameId';
  static String scoresCollection(String gameId) => '${gameDoc(gameId)}/scores';
  static String scoreDoc(String gameId, String playerId) =>
      '${scoresCollection(gameId)}/$playerId';
}
