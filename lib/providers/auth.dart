import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class Authen {
  bool authen() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return false;
    user.getIdTokenResult().then((value) {
      Future<void> getToken() async {
        String url = 'http://20.89.111.129/api/Login';
        Uri uri = Uri.parse(url);
        Map<String, String> headers = {'token': '${value.token}'};
        http.Response res = await http.get(uri, headers: headers);
        log('response nè: ${res.body}');
        final tmp = jsonDecode(res.body);
        log('Token nè : ${tmp['token']['result']}');
        return true;
      }

      getToken();
    });
  }
}
