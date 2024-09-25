import 'package:firebase_auth/firebase_auth.dart';
import 'package:flappy_dash/main_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? isLoggedIn;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    setState(() {
      if (user == null) {
      print('User is currently signed out!');
      isLoggedIn=false;
    } else {
      print('User is signed in!');
      isLoggedIn=true;
    }
    });
  });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:switch (isLoggedIn) {
        true => const MainPage(),
        false => Container(),
        _=> const CircularProgressIndicator()
      },
    );
  }
}