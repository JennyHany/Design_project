import 'dart:io';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _email = "";
  String _username = "";
  String _password = "";
  String _phone = ""; // Add phone property
  File? _image;

  // Getters
  String get email => _email;
  String get username => _username;
  String get password => _password;
  String get phone => _phone; // Add phone getter
  File? get image => _image;

  // Setters
  void setUserData({
    required String email,
    required String username,
    required String password,
    required String phone, // Add phone parameter
    required File image,
  }) {
    _email = email;
    _username = username;
    _password = password;
    _phone = phone; // Set phone
    _image = image;
    notifyListeners();
  }

  void setImage(File image) {
    _image = image;
    notifyListeners();
  }

  // Sign out method
  void signOut() {
    _email = ""; // Clear email
    _username = ""; // Clear username
    _password = ""; // Clear password
    _phone = ""; // Clear phone
    _image = null; // Clear profile image
    notifyListeners(); // Notify listeners to update the UI
  }
}