import 'package:flutter/material.dart';
import 'package:new_project/auth_methods.dart';
import 'package:new_project/user_models.dart';


class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User? get getUser => _user;

  Future<void> refreshUser() async {
    try {
      User user = await _authMethods.getUserDetails();
      _user = user;
      notifyListeners();
    } catch (e) {
      print('Error in referenceUser: $e');
    }
  }
}