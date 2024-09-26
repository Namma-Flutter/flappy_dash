part of 'game_cubit.dart';

class GameState with EquatableMixin {
  const GameState({
    this.currentScore = 0,
    this.personalHighScore = 0,
    this.currentPlayingState = PlayingState.idle,
  });

  final int currentScore, personalHighScore;
  final PlayingState currentPlayingState;

  GameState copyWith({
    int? currentScore,
    int? personalHighScore,
    PlayingState? currentPlayingState,
  }) =>
      GameState(
        currentScore: currentScore ?? this.currentScore,
        personalHighScore: personalHighScore ?? this.personalHighScore,
        currentPlayingState: currentPlayingState ?? this.currentPlayingState,
      );

  @override
  List<Object> get props => [
        currentScore,
        personalHighScore,
        currentPlayingState,
      ];
}

enum PlayingState {
  idle,
  playing,
  paused,
  gameOver;

  bool get isPlaying => this == PlayingState.playing;

  bool get isNotPlaying => !isPlaying;

  bool get isGameOver => this == PlayingState.gameOver;

  bool get isNotGameOver => !isGameOver;

  bool get isIdle => this == PlayingState.idle;

  bool get isPaused => this == PlayingState.paused;
}
