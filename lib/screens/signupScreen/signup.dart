import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xcelpros/screens/loadingPage.dart';
import 'package:xcelpros/screens/main.dart';
import 'package:xcelpros/utils/constants.dart';
import 'package:xcelpros/utils/page_transition.dart';
import 'package:provider/provider.dart';
import 'signup_validation.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool isChecked = false;
  TextEditingController usernameTextField = TextEditingController();
  TextEditingController passwordTextField = TextEditingController();
  TextEditingController emailTextField = TextEditingController();
  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    var greenViewHeight = MediaQuery.of(context).size.height * 0.23;
    var leftSideSpace = MediaQuery.of(context).size.width * 0.063;
    var topSideSpace = MediaQuery.of(context).size.height * 0.034;
    var bottomSpace = MediaQuery.of(context).size.height * 0.027;
    var titleFontSize = MediaQuery.of(context).size.height * 0.028;
    final validationService = Provider.of<SignupValidation>(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Container(
                height: greenViewHeight,
                color: ColoNames.appThemeGreen,
              ),
              Positioned(
                left: leftSideSpace,
                top: topSideSpace,
                child: Row(
                  children: <Widget>[
                    Image.asset(ImageNames.signUpGreenImage),
                    FlatButton(
                        onPressed: () {
                          // Navigator.of(context).pop();

                          Navigator.pop(context);
                          //Navigator.popUntil(context, ("LoginPage") => false);
                          // Navigator.of(context)
                          //     .popUntil(ModalRoute.withName("LoginPage"));
                        },
                        child: Text(
                          "Back",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        )),
                  ],
                ),
              ),
              Positioned(
                  right: 0, child: Image.asset(ImageNames.topBlocksImage)),
              Positioned(
                  left: leftSideSpace,
                  bottom: bottomSpace,
                  child: Text(
                    EngConstants.newAccount,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w300),
                  ))
            ],
          ),
          Expanded(
            child: Container(
              color: ColoNames.appThemeGreen,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(40.0),
                      topRight: const Radius.circular(40.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Form(
                    key: this._formKey,
                    child: ListView(
                      children: <Widget>[
                        userNameWidget(validationService),
                        passwordWidget(validationService),
                        emailWidget(validationService),
                        SizedBox(
                          height: greenViewHeight * 0.45,
                        ),
                        checkbox(
                            "  I have accepted the ", false, validationService),
                        SizedBox(
                          height: greenViewHeight * 0.25,
                        ),
                        signUpButton(validationService),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    usernameTextField.dispose();
    passwordTextField.dispose();
    emailTextField.dispose();
    super.dispose();
  }

  Widget userNameWidget(SignupValidation validationService) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new TextField(
        onChanged: (String value) {
          validationService.changeUserName(value);
        },
        controller: usernameTextField,
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            icon: Image.asset(ImageNames.forUserName),
            errorText: validationService.userName.error,
            hintText: EngConstants.enterUserName,
            labelText: 'Username',
            labelStyle: TextStyle(color: Colors.grey)),
      ),
    );
  }

  Widget passwordWidget(SignupValidation validationService) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new TextFormField(
        validator: Validations.validatePassword,
        controller: passwordTextField,
        obscureText: true,
        onChanged: (String value) {
          validationService.changePassword(value);
        },
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            icon: Image.asset(ImageNames.passwordLockImg),
            errorText: validationService.password.error,
            hintText: 'Enter Password',
            labelText: 'Password',
            labelStyle: TextStyle(color: Colors.grey)),
        keyboardType: TextInputType.datetime,
      ),
    );
  }

  Widget emailWidget(SignupValidation validationService) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new TextFormField(
        validator: Validations.validateEmail,
        controller: emailTextField,
        onChanged: (String value) {
          validationService.changeEmail(value);
        },
        decoration: InputDecoration(
            errorText: validationService.useremail.error,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            icon: Image.asset(ImageNames.emailImg),
            hintText: 'Enter Email',
            labelText: 'Email',
            labelStyle: TextStyle(color: Colors.grey)),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget checkbox(
      String title, bool boolValue, SignupValidation validationService) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width * 0.05,
          width: MediaQuery.of(context).size.width * 0.05,
          //color: Colors.grey[350],
          child: RaisedButton(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            onPressed: () {
              validationService.termsAndConditions(context);
              // validationService.isCheckBoxChecked
              //     ? validationService.isCheckBoxChecked = false
              //     : validationService.isCheckBoxChecked = true;
              // if (isChecked) {
              //   print("already true");
              //   isChecked = false;
              // } else {
              //   print("came as false");
              //   isChecked = true;
              // }

              // if (isChecked && _formKey.currentState.validate()) {
              //   isButtonEnabled = true;
              // } else {
              //   isButtonEnabled = false;
              // }
              // print(isChecked);
              // setState(() {});
              // print("clicked on checkbox");
            },
            color: validationService.isCheckBoxChecked == true
                ? ColoNames.buttonGreenColor
                : Colors.grey[350],
          ),
        ),
        RichText(
          text: new TextSpan(
              text: title,
              style: TextStyle(color: Colors.grey),
              recognizer: new TapGestureRecognizer()
                ..onTap = () {
                  if (isChecked) {
                    isChecked = false;
                  } else {
                    isChecked = true;
                  }
                  print(isChecked);
                  print("- - - - - ");
                  //validationService.isCheckBoxChecked = isChecked;
                  // setState(() {});
                },
              children: [
                new TextSpan(
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    color: ColoNames.buttonGreenColor,
                  ),
                  text: 'Terms & Conditions',
                  recognizer: new TapGestureRecognizer()
                    ..onTap = () {
                      print('Tap Here onTap');
                    },
                )
              ]),
        )
      ],
    );
  }

  Widget signUpButton(SignupValidation validationService) {
    return new Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: RaisedButton(
        onPressed: validationService.isValid
            ? () {
                // validationService.isValid != false &&
                //         validationService.isCheckBoxChecked != false
                //     ? null
                //     : validationService.submitData(context);
                validationService.submitData(context);
              }
            : null,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          // side: BorderSide(color: Colors.red)
        ),
        color: ColoNames.buttonGreenColor,
        child: Text(
          "SIGN UP",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

//   void _validateInputs() {
//     if (_formKey.currentState.validate()) {
// //    If all data are correct then save data to out variables
//       _formKey.currentState.save();
//     } else {
// //    If all data are not valid then start auto validation.
//       setState(() {
//         // _autoValidate = true;
//       });
//     }
//   }
}
