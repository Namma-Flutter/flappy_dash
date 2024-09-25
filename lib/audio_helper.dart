import 'package:flame_audio/flame_audio.dart';
class AudioHelper {
  late String _backgroundSource,_scoreSource;
  Future<void> initialize() async {
      print("init audoi");
    FlameAudio.bgm.initialize();
    _backgroundSource =  'assets/audio/background.mp3';
    _scoreSource = 'assets/audio/score.mp3';
  }

  void playBackgroundAudio() async {
   print("bgm");
    FlameAudio.bgm.play(_backgroundSource );
  }

  void stopBackgroundAudio() {
    print("bgm stop");
    FlameAudio.bgm.stop();
  }

  void playScoreCollectSound() async {
    print("score");
    FlameAudio.play(_scoreSource);
  }
}
