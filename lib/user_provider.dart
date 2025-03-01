import 'dart:io';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _email = "";
  String _username = "";
  String _password = "";
  File? _image;

  String get email => _email;
  String get username => _username;
  String get password => _password;
  File? get image => _image;

  void setUserData({
    required String email,
    required String username,
    required String password,
    required File image,
  }) {
    _email = email;
    _username = username;
    _password = password;
    _image = image;
    notifyListeners();
  }
}
