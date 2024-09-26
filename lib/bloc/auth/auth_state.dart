part of 'auth_cubit.dart';

class AuthState with EquatableMixin {
  const AuthState({this.user, required this.isLoggedIn});

  final User? user;
  final bool isLoggedIn;

  AuthState copyWith({User? user, bool isLoggedIn = false}) =>
      AuthState(user: user ?? this.user, isLoggedIn: isLoggedIn);

  @override
  List<Object?> get props => [
        isLoggedIn,
        user,
      ];
}
