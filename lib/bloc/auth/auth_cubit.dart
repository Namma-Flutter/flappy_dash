import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flappy_dash/global.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState(isLoggedIn: false));

  Future<void> loggedIn(user) async {
    emit(state.copyWith(user: user, isLoggedIn: true));
    GlobalState.user = user;
  }

  Future<void> loggedOut() async {
    await FirebaseAuth.instance.signOut();
    emit(state.copyWith(user: null, isLoggedIn: false));
    GlobalState.user = null;
  }
}
