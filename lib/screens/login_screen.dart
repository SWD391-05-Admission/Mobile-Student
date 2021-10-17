import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/authen_screen.dart';
import '../widgets/bottom_bar_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage();
  static const routeName = '/login-auth';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          log('connection state wating'.toUpperCase());
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          log('snapshot has data'.toUpperCase());
          // try {
          //   Authen.authen();
          //   log('vo try');
          // } catch (error) {
          //   if (error.toString() == '') {
          //     return AuthenScreen(
          //       error: error.toString(),
          //     );
          //   }
          // }
          return BottomBar();
        } else if (snapshot.hasError) {
          log('snapshot has error'.toUpperCase());
          return Center(child: Text('Something wrong !'));
        } else {
          log('snapshot else'.toUpperCase());
          return AuthenScreen();
        }
      },
    );
  }
}
