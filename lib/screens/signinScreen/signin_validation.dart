import 'package:flutter/material.dart';
import 'package:xcelpros/screens/main.dart';
import 'package:xcelpros/utils/constants.dart';

import '../homePage.dart';

class SignInValidation with ChangeNotifier {
  ValidationItem _userName = ValidationItem(null, null);
  ValidationItem _password = ValidationItem(null, null);

  //Getters
  ValidationItem get userName => _userName;
  ValidationItem get password => _password;

  bool get isValid {
    if (_password.value != null &&
        Validations.validatePassword(_password.value) == null &&
        _userName.value != null &&
        Validations.validatePassword(_userName.value) == null) {
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

  void submitData(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));

    notifyListeners();
  }
}

class ValidationItem {
  final String value;
  final String error;

  ValidationItem(this.value, this.error);
}
