import 'package:flutter/cupertino.dart';
import 'package:mobile_customer/models/user.dart';

class UserController extends ChangeNotifier {
  User _user;

  User get user => _user;
}
