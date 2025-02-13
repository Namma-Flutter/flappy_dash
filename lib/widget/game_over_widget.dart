import 'dart:ui';

import 'package:flappy_dash/bloc/auth/auth_cubit.dart';
import 'package:flappy_dash/bloc/game/game_cubit.dart';
import 'package:flappy_dash/widget/score_board_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameOverWidget extends StatelessWidget {
  const GameOverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      builder: (context, state) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.black54,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'GAME OVER!',
                    style: TextStyle(
                      shadows: [
                        Shadow(
                            color: Colors.blue,
                            offset: Offset.zero,
                            blurRadius: 5)
                      ],
                      color: Color.fromARGB(255, 255, 221, 0),
                      fontWeight: FontWeight.bold,
                      fontSize: 70,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Score: ${state.currentScore}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Personal Best: ${state.personalHighScore}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: () => context.read<GameCubit>().restartGame(),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'PLAY AGAIN!',
                        style: TextStyle(
                          fontSize: 22,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (_) => const ScoreBoard());
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.orangeAccent)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Score board',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 70,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<AuthCubit>().loggedOut();
                          context.read<GameCubit>().restartGame();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.red)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Log out',
                            style: TextStyle(
                              fontSize: 22,
                              letterSpacing: 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
