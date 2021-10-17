import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as UserFB;
import 'package:mobile_customer/models/user.dart' as UserDB;
import 'package:http/http.dart' as http;
import 'package:mobile_customer/providers/user_controller.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Authen {
  authen() {
    final user = UserFB.FirebaseAuth.instance.currentUser;
    log('USER: ${user.displayName}');
    if (user == null) return;
    user.getIdTokenResult().then((value) async {
      String firebaseToken = value.token;
      log('Firebase token : $firebaseToken');
      String app = 'Student';
      String url = 'http://40.81.193.10/api/login';
      Uri uri = Uri.parse(url);
      // try {
      http.Response response = await http.post(
        uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'firebaseToken': '$firebaseToken', 'app': '$app'}),
      );
      log('STATUS CODE : ${response.statusCode}');
      final data = jsonDecode(response.body);
      log('TOKEN NE : ${data['token']}');

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', '${data['token']}');
      // } catch (error) {
      //   log('Error in authe : ${error.toString()}');
      //   throw error;
      // }
    });
  }

  // authen() {
  //   final user = UserFB.FirebaseAuth.instance.currentUser;
  //   log('USER: ${user.displayName}');
  //   if (user == null) return;
  //   user.getIdTokenResult().then((value) async {
  //     String firebaseToken = value.token;
  //     log('Firebase token : $firebaseToken');
  //     String app = 'Student';
  //     String url = 'http://40.81.193.10/api/login/test/getToken?role=Student';
  //     Uri uri = Uri.parse(url);
  //     // try {
  //     http.Response response = await http.get(
  //       uri,
  //       headers: {"Content-Type": "application/json"},
  //     );
  //     log('STATUS CODE : ${response.statusCode}');
  //     final data = jsonDecode(response.body);
  //     log('TOKEN NE : ${data['token']}');

  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('token', '${data['token']}');
  //     // } catch (error) {
  //     //   log('Error in authe : ${error.toString()}');
  //     //   throw error;
  //     // }
  //   });
  // }
}
