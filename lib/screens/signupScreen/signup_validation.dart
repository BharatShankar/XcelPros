import 'package:flutter/material.dart';
import 'package:xcelpros/screens/main.dart';
import 'package:xcelpros/utils/constants.dart';

import '../homePage.dart';

class SignupValidation with ChangeNotifier {
  ValidationItem _userName = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);
  ValidationItem _email = ValidationItem(null, null);
  bool isCheckBoxChecked = false;

  //Getters
  ValidationItem get userName => _userName;
  ValidationItem get password => _password;
  ValidationItem get useremail => _email;

  bool get isValid {
    if (_password.value != null &&
        Validations.validatePassword(_password.value) == null &&
        _userName.value != null &&
        Validations.validatePassword(_userName.value) == null &&
        _email.value != null &&
        Validations.validatePassword(_email.value) == null &&
        isCheckBoxChecked == true) {
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
    // Pattern pattern =
    //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    // RegExp regex = new RegExp(pattern);

    if (Validations.validateEmail(value) != null) {
      _email = ValidationItem(null, 'Enter Valid Email');
    } else {
      _email = ValidationItem(value, null);
    }
    notifyListeners();
  }

  void submitData(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));

    notifyListeners();
  }

  void termsAndConditions(BuildContext context) {
    //isCheckBoxChecked = !isChecked;
    if (isCheckBoxChecked == true) {
      isCheckBoxChecked = false;
    } else {
      isCheckBoxChecked = true;
    }
    notifyListeners();
    print("this is checkboxvalue in provider $isCheckBoxChecked");
  }
}

class ValidationItem {
  final String value;
  final String error;

  ValidationItem(this.value, this.error);
}
