part of 'game_cubit.dart';

class GameState with EquatableMixin {
  const GameState({
    this.currentScore = 0,
    this.personalHighSoce = 0,
    this.currentPlayingState = PlayingState.idle,
  });

  final int currentScore, personalHighSoce;
  final PlayingState currentPlayingState;

  GameState copyWith({
    int? currentScore,
    int? personalHighSoce,
    PlayingState? currentPlayingState,
  }) =>
      GameState(
        currentScore: currentScore ?? this.currentScore,
        personalHighSoce: personalHighSoce ?? this.personalHighSoce,
        currentPlayingState: currentPlayingState ?? this.currentPlayingState,
      );

  @override
  List<Object> get props => [
        currentScore,
        personalHighSoce,
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
