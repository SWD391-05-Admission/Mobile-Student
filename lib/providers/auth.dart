import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as UserFB;
import 'package:mobile_customer/models/user.dart' as UserDB;
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class Authen {
  static bool authen() {
    final user = UserFB.FirebaseAuth.instance.currentUser;
    log('USER: ${user.displayName}');
    if (user == null) return false;
    user.getIdTokenResult().then((value) {
      Future getToken() async {
        String firebaseToken = value.token;
        String app = 'Student';
        String url = 'http://20.89.111.129/api/login/login';
        Uri uri = Uri.parse(url);
        log('GET TOKEN : $firebaseToken');
        try {
          http.Response response = await http.post(
            uri,
            headers: {"Content-Type": "application/json"},
            body:
                jsonEncode({'firebaseToken': '$firebaseToken', 'app': '$app'}),
          );
          final data = jsonDecode(response.body);
          log('TOKEN NE : ${data['token']}');
          log('STATUS CODE : ${response.statusCode}');
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          // await prefs.setString('token', '${data['token']}');
        } catch (error) {
          throw error;
        }
      }

      getToken();
    });
    return true;
  }
}
