import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState(isLoggedIn: false));

  void loggedIn(User user) {
    emit(state.copyWith(user: user, isLoggedIn: true));
  }

  void loggedOut() {
    emit(state.copyWith(user: null, isLoggedIn: false));
  }
}
