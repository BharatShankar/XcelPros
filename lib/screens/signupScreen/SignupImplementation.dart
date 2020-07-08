import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xcelpros/screens/signupScreen/signup.dart';
import 'package:xcelpros/screens/signupScreen/signup_validation.dart';

class SignupLess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupValidation(),
      child: Scaffold(
        body: SignUp(),
      ),
    );
  }
}
