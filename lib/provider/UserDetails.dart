import 'package:flutter/material.dart';

class UserDetails with ChangeNotifier {
  String _password = "";

  String get password => _password;

  void setPassword(String password){
    _password = password;
    notifyListeners();
  }
}
