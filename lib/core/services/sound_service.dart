import 'package:flutter/foundation.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SoundService extends ChangeNotifier {
  final AudioPlayer _sfxPlayer = AudioPlayer();
  final AudioPlayer _musicPlayer = AudioPlayer();
  final SharedPreferences _prefs;
  static const String _muteKey = 'is_muted';
  bool _isMuted = false;

  SoundService(this._prefs) {
    _isMuted = _prefs.getBool(_muteKey) ?? false;
  }

  bool get isMuted => _isMuted;

  Future<void> toggleMute() async {
    _isMuted = !_isMuted;
    await _prefs.setBool(_muteKey, _isMuted);

    if (_isMuted) {
      await _musicPlayer.pause();
    } else {
      // If unmuted, resume background music (or start if not playing)
      if (_musicPlayer.state == PlayerState.playing) {
        // already playing
      } else if (_musicPlayer.state == PlayerState.paused) {
        await _musicPlayer.resume();
      } else {
        // Start from scratch if stopped
        startBackgroundMusic();
      }
    }
    notifyListeners();
  }

  Future<void> playSound(String soundName) async {
    if (_isMuted) return;

    // Reset mode to release after play (no loop)
    await _sfxPlayer.setReleaseMode(ReleaseMode.release);

    // Stop previous sfx only if needed (optional, but good for overlaps)
    await _sfxPlayer.stop();

    try {
      await _sfxPlayer.play(AssetSource('sounds/$soundName.mp3'));
    } catch (e) {
      // Ignore errors
    }
  }

  // Predefined sounds
  Future<void> playCorrect() => playSound('correct');
  Future<void> playWrong() => playSound('wrong');
  Future<void> playClick() => playSound('click');
  Future<void> playSuccess() => playSound('success');
  Future<void> playTick() => playSound('tick');
  Future<void> playError() => playSound('wrong');
  // Fallback to success sound since level_up.mp3 is missing
  Future<void> playLevelUp() => playSound('success');

  Future<void> startBackgroundMusic() async {
    // If muted, we don't start playing, but we might want to prepare it?
    // Actually if muted, we just return. The toggleMute will handle resume.
    if (_isMuted) return;

    try {
      await _musicPlayer.setReleaseMode(ReleaseMode.loop);
      await _musicPlayer.play(
        AssetSource('sounds/background.mp3'),
        volume: 0.3,
      );
    } catch (e) {
      // ignore
    }
  }

  Future<void> stopBackgroundMusic() async {
    await _musicPlayer.stop();
  }

  Future<void> stopAll() async {
    await _musicPlayer.stop();
    await _sfxPlayer.stop();
  }
}
