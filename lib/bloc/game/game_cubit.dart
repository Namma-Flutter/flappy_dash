import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flappy_dash/global.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit(
      // this._audioHelper,
      )
      : super(const GameState());

  // final AudioHelper _audioHelper;

  void startPlaying() {
    // _audioHelper.playBackgroundAudio();
    emit(state.copyWith(
      currentPlayingState: PlayingState.playing,
      currentScore: 0,
    ));
  }

  void increaseScore() {
    // _audioHelper.playScoreCollectSound();
    emit(state.copyWith(
      currentScore: state.currentScore + 1,
    ));
  }

  Future<void> gameOver() async {
    // _audioHelper.stopBackgroundAudio();
    emit(state.copyWith(
      currentPlayingState: PlayingState.gameOver,
    ));
    final int lastScore = ((await FirebaseFirestore.instance
                .collection('scores')
                .doc("${GlobalState.user?.email}")
                .get())
            .data()?['score']) ??
        0;
    print("last score $lastScore");
    if (lastScore < state.currentScore) {
      await FirebaseFirestore.instance
          .collection('scores')
          .doc("${GlobalState.user?.email}")
          .set({
        "name": GlobalState.user?.displayName,
        "score": state.currentScore,
        "pic": GlobalState.user?.photoURL
      }).then((_) {
        print("score updated");
      });
      emit(state.copyWith(personalHighScore: state.currentScore));
    } else {
      emit(state.copyWith(personalHighScore: lastScore));
    }
    await FirebaseFirestore.instance
        .collection('scores')
        .doc("${GlobalState.user?.email}")
        .update({"score": state.personalHighScore}).then((_) {
      print("score updated");
    });
  }

  void restartGame() {
    emit(state.copyWith(
      currentPlayingState: PlayingState.idle,
      currentScore: 0,
    ));
  }
}
