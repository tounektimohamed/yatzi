import 'dart:async';

import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _player = AudioPlayer();

  Future<void> playDiceRoll() async {
    try {
      await _player.play(AssetSource('sounds/dice_roll.mp3'));
    } catch (_) {}
  }

  Future<void> playYatzy() async {
    try {
      await _player.play(AssetSource('sounds/yatzy_win.mp3'));
    } catch (_) {}
  }

  Future<void> playTurnChange() async {
    try {
      await _player.play(AssetSource('sounds/turn_change.mp3'));
    } catch (_) {}
  }

  Future<void> playCustomSound(String url) async {
    try {
      await _player.play(UrlSource(url));
    } catch (_) {}
  }

  Future<void> stopAll() async {
    try {
      await _player.stop();
    } catch (_) {}
  }

  void dispose() {
    _player.dispose();
  }
}
