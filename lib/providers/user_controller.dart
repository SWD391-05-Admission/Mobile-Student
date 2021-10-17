import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mobile_customer/models/user.dart';
import 'package:mobile_customer/values/app_value.dart';
import 'package:http/http.dart' as http;

class UserController extends ChangeNotifier {
  User _user;

  User get user => _user;

  void setUser() {
    getUser().then((value) {
      _user = User(
        image: value.image,
        fullName: value.fullName,
        email: value.email,
      );
      notifyListeners();
    }).catchError((error) {
      log('error in set user');
      throw error;
    });
  }

  void setUpdateUser(User user) {
    updateUser(user).then((value) {
      _user = User(
        image: value.image,
        fullName: value.fullName,
        email: value.email,
      );
      notifyListeners();
      log('${_user.fullName}');
    });
  }

  Future<User> getUser() async {
    try {
      String token = await AppValue.getToken();
      Uri uri = Uri.parse('http://40.81.193.10/api/user/getProfile');
      Map<String, String> headers = {'Authorization': 'Bearer $token'};
      log('token get from local : $token'.toUpperCase());
      final response = await http.get(
        uri,
        // headers: {"Content-Type": "application/json"},
        headers: headers,
      );
      final data = jsonDecode(response.body);
      log(data.toString());
      final user = new User(
        // address: (data['address'] == null) ? '' : data['address'],
        // birthday: (data['birthday'] == null) ? '' : data['birthday'],
        // description: (data['description'] == null) ? '' : data['description'],
        email: (data['email'] == null) ? '' : data['email'],
        fullName: (data['fullName'] == null) ? '' : data['fullName'],
        // gender: (data['gender'] == null) ? '' : data['gender'],
        // highSchool: (data['highSchool'] == null) ? '' : data['highSchool'],
        image: (data['avt'] == null) ? '' : data['avt'],
        // phone: (data['phone'] == null) ? '' : data['phone'],
      );
      _user = user;
      notifyListeners();
      return user;
    } catch (error) {
      log('SOMETHING WRONG! ${error.toString()}');
      throw (error);
    }
  }

  // Update user
  Future<User> updateUser(User user) async {
    String token = await AppValue.getToken();
    Uri uri = Uri.parse('http://40.81.193.10/api/user/updateProfile');
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    // log('TOKEN DUOI LOCAL : $token');
    // try {
    final response = await http.put(
      uri,
      // headers: {"Content-Type": "application/json"},
      headers: headers,
      body: jsonEncode({
        "fullName": "${user.fullName}",
        "phone": "${user.phone}",
        "avt": "${user.image}"
      }),
    );
    log('STATUS CODE : ${response.statusCode}');
    _user = user;
    // log(user.address);
    // log(user.fullName);
    // log(user.email);
    notifyListeners();
    return user;
    // } catch (error) {
    //   log('SONE THING WRONG !');
    //   throw (error);
    // }
  }
}
