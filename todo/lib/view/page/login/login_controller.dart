import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
   String _username = '';
   String _password = '';


  set username (String username) {
    _username = username;
  }

  set password (String password) {
    _password = password;
  }

  bool login() {
    if (_username == 'ebrahim' && _password == '123') {
      return true;
    }
    return false;
  }
}
