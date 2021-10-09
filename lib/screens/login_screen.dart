import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_customer/screens/authen_screen.dart';
import 'package:mobile_customer/screens/profile_screen.dart';
import 'package:mobile_customer/widgets/bottom_bar_widget.dart';
import 'package:http/http.dart' as http;

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
