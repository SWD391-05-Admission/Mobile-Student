// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/cupertino.dart';
// import 'package:mobile_customer/models/user.dart';
// import 'package:mobile_customer/values/app_value.dart';
// import 'package:http/http.dart' as http;

// class ConsultantController extends ChangeNotifier {
//   static List<User> _list;

//   List<User> get list => _list;

//   void setListConsultant() {
//     getUser().then((value) {
//       _user = User(
//         image: value.image,
//         fullName: value.fullName,
//         email: value.email,
//       );
//       notifyListeners();
//     });
//   }

//   void setUpdateUser(User user) {
//     updateUser(user).then((value) {
//       _user = User(
//         image: value.image,
//         fullName: value.fullName,
//         email: value.email,
//       );
//       notifyListeners();
//       log('${_user.fullName}');
//     });
//   }

//   Future<List<User>> getListConsultant() async {
//     try {
//       String token = await AppValue.getToken();
//       Uri uri = Uri.parse('http://20.89.111.129/api/user/getProfile');
//       Map<String, String> headers = {'Authorization': 'Bearer $token'};
//       // log('token get from local : $token'.toUpperCase());
//       final response = await http.get(
//         uri,
//         // headers: {"Content-Type": "application/json"},
//         headers: headers,
//       );
//       final data = jsonDecode(response.body);
//       // log(data.toString());
//       final List<User> listConsultant = []; 
//       // listConsultant = (data as List<User>).map((i) =>
//       //         MyModel.fromJson(i)).toList();
      
//       _list = listConsultant;
//       notifyListeners();
//       return listConsultant;
//     } catch (error) {
//       log('SOMETHING WRONG!');
//       throw (error);
//     }
//   }

//   // Update user
//   Future<User> updateUser(User user) async {
//     String token = await AppValue.getToken();
//     Uri uri = Uri.parse('http://20.89.111.129/api/user/updateProfile');
//     Map<String, String> headers = {
//       'Authorization': 'Bearer $token',
//       'Content-Type': 'application/json'
//     };
//     // log('TOKEN DUOI LOCAL : $token');
//     // try {
//     final response = await http.put(
//       uri,
//       // headers: {"Content-Type": "application/json"},
//       headers: headers,
//       body: jsonEncode({
//         "fullName": "${user.fullName}",
//         "phone": "${user.phone}",
//         "avt": "${user.image}"
//       }),
//     );
//     log('STATUS CODE : ${response.statusCode}');
//     // _user = user;
//     // log(user.address);
//     // log(user.fullName);
//     // log(user.email);
//     notifyListeners();
//     return user;
//     // } catch (error) {
//     //   log('SONE THING WRONG !');
//     //   throw (error);
//     // }
//   }
// }