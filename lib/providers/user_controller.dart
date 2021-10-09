import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobile_customer/models/user.dart';
import 'package:mobile_customer/values/app_value.dart';
import 'package:http/http.dart' as http;

class UserController extends ChangeNotifier {
  User _user;

  User get user => _user;

  User getCurrentUser() {
    return _user;
  }

  void inUser() {
    log('TEN USER : ${user.fullName}');
  }

  Future<void> getUser() async {
    String token = await AppValue.getToken();
    Uri uri = Uri.parse('http://20.89.111.129/api/user/getProfile');
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    log('token get from local : $token'.toUpperCase());
    try {
      final response = await http.get(
        uri,
        // headers: {"Content-Type": "application/json"},
        headers: headers,
      );
      final data = jsonDecode(response.body);
      User newUser = new User(
        address: (data['address'] == null) ? '' : data['address'],
        birthday: (data['birthday'] == null) ? '' : data['birthday'],
        description: (data['description'] == null) ? '' : data['description'],
        email: (data['email'] == null) ? '' : data['email'],
        fullName: (data['fullName'] == null) ? '' : data['fullName'],
        gender: (data['gender'] == null) ? '' : data['gender'],
        highSchool: (data['highSchool'] == null) ? '' : data['highSchool'],
        image: (data['image'] == null) ? '' : data['image'],
        phone: (data['phone'] == null) ? '' : data['phone'],
      );
      _user = newUser;
      log('USER CONTROLLER NE : ${_user.fullName}');
      log('USER CONTROLLER NE 1 : ${newUser.fullName}');
      log('STATUS CODE : ${response.statusCode}');
      notifyListeners();
    } catch (error) {
      log('ST WRONG!');
      throw (error);
    }
  }

  // Update user
  Future<void> updateUser(User user) async {
    String token = await AppValue.getToken();
    Uri uri = Uri.parse('http://20.89.111.129/api/user/getProfileUser');
    Map<String, String> headers = {'Authorization': 'Bearer $token'};
    try {
      await http.patch(
        uri,
        // headers: {"Content-Type": "application/json"},
        headers: headers,
        body: jsonEncode(user),
      );
      _user = user;
    } catch (error) {
      throw (error);
    }
  }
}
