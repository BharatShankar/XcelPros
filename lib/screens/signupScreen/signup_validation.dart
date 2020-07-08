import 'package:flutter/material.dart';

import '../homePage.dart';

class SignupValidation with ChangeNotifier {
  ValidationItem _userName = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);
  ValidationItem _email = ValidationItem(null, null);

  //Getters
  ValidationItem get userName => _userName;
  ValidationItem get password => _password;
  ValidationItem get email => _email;

  bool get isValid {
    if (_password.value != null &&
        _userName.value != null &&
        _email.value != null) {
      return true;
    } else {
      return false;
    }
  }

  //Setters
  void changeUserName(String value) {
    if (value.length >= 3) {
      _userName = ValidationItem(value, null);
    } else {
      _userName = ValidationItem(null, "Must be at least 3 characters");
    }
    notifyListeners();
  }

  void changePassword(String value) {
    if (value.length >= 3) {
      _password = ValidationItem(value, null);
    } else {
      _password = ValidationItem(null, "Must be at least 3 characters");
    }
    notifyListeners();
  }

  void changeEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      _email = ValidationItem(null, 'Enter Valid Email');
    else
      _email = ValidationItem(value, null);
  }

  void submitData(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
    print(
        "UserName: ${userName.value}, Pass: ${password.value}, Email: ${DateTime.parse(email.value)}");
  }
}

class ValidationItem {
  final String value;
  final String error;

  ValidationItem(this.value, this.error);
}
