import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flappy_dash/bloc/auth/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flappy_dash/main_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        print('User is currently signed in! ${user.displayName}');
        context.read<AuthCubit>().loggedIn(user);
      } else {
        print('User is signed out!');
        context.read<AuthCubit>().loggedOut();
      }
    });
  }

  Future<User?> signInWithGoogle() async {
    await Firebase.initializeApp();
    User? user;
    FirebaseAuth auth = FirebaseAuth.instance;
    GoogleAuthProvider authProvider = GoogleAuthProvider();
    try {
      final UserCredential userCredential =
          await auth.signInWithPopup(authProvider);
      user = userCredential.user;
    } catch (e) {
      print(e);
    }

    if (user != null) {}
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) => switch (state.isLoggedIn) {
                true => const MainPage(),
                false => Center(
                    child: TextButton(
                      onPressed: () {
                        signInWithGoogle();
                      },
                      child: const Text("Sign-in"),
                    ),
                  ),
                _ => const CircularProgressIndicator()
              }),
    );
  }
}
