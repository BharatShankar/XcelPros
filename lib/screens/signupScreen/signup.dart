import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xcelpros/screens/loadingPage.dart';
import 'package:xcelpros/screens/main.dart';
import 'package:xcelpros/utils/constants.dart';
import 'package:xcelpros/utils/page_transition.dart';

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

  @override
  Widget build(BuildContext context) {
    var greenViewHeight = MediaQuery.of(context).size.height * 0.23;
    var leftSideSpace = MediaQuery.of(context).size.width * 0.063;
    var topSideSpace = MediaQuery.of(context).size.height * 0.034;
    var bottomSpace = MediaQuery.of(context).size.height * 0.027;
    var titleFontSize = MediaQuery.of(context).size.height * 0.028;
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
                          Navigator.pop(context);
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new TextFormField(
                            validator: Validations.validateName,
                            controller: usernameTextField,
                            decoration: InputDecoration(
                              icon: Image.asset(ImageNames.forUserName),
                              hintText: EngConstants.enterUserName,
                              labelText: 'Username',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new TextFormField(
                            validator: Validations.validatePassword,
                            controller: passwordTextField,
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Image.asset(ImageNames.passwordLockImg),
                              hintText: 'Enter Password',
                              labelText: 'Password',
                            ),
                            keyboardType: TextInputType.datetime,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new TextFormField(
                            validator: Validations.validateEmail,
                            controller: emailTextField,
                            decoration: InputDecoration(
                              icon: Image.asset(ImageNames.emailImg),
                              hintText: 'Enter Email',
                              labelText: 'Email',
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(
                          height: greenViewHeight * 0.45,
                        ),
                        checkbox("  I have accepted the ", false),
                        SizedBox(
                          height: greenViewHeight * 0.25,
                        ),
                        signUpButton(),
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

  // String validateName(String value) {
  //   if (value.length < 3)
  //     return 'Name must be more than 2 charater';
  //   else
  //     return null;
  // }

  // String validatePassword(String value) {
  //   if (value.length < 3)
  //     return 'Password must be more than 2 charater';
  //   else
  //     return null;
  // }

  // String validateEmail(String value) {
  //   Pattern pattern =
  //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  //   RegExp regex = new RegExp(pattern);
  //   if (!regex.hasMatch(value))
  //     return 'Enter Valid Email';
  //   else
  //     return null;
  // }

  Widget checkbox(String title, bool boolValue) {
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
              if (isChecked) {
                isChecked = false;
              } else {
                isChecked = true;
              }
              print(isChecked);
              setState(() {});
              print("clicked on checkbox");
            },
            color: isChecked ? ColoNames.buttonGreenColor : Colors.grey[350],
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
                  setState(() {});
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
        // Text.rich(
        //   TextSpan(
        //     text: title,
        //     style: TextStyle(fontSize: 15, color: Colors.grey),
        //     children: <TextSpan>[
        //       TextSpan(
        //           text: 'Terms & Conditions',
        //           style: TextStyle(
        //             color: buttonGreenColor,
        //             fontWeight: FontWeight.bold,
        //             decoration: TextDecoration.underline,
        //           )),
        //       // can add more TextSpans here...
        //     ],
        //   ),
        // )
      ],
    );
  }

  Widget signUpButton() {
    return new Container(
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: RaisedButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            print("validated");
            // Navigator.pushNamed(context, Constants.ROUTE_LOADING);
            Navigator.push(
              context,
              PageTransition(
                duration: Duration(milliseconds: 350),
                type: PageTransitionType.upToDown,
                child: LoadingPage(),
              ),
            );
          }
        },
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

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
//    If all data are correct then save data to out variables
      _formKey.currentState.save();
    } else {
//    If all data are not valid then start auto validation.
      setState(() {
        // _autoValidate = true;
      });
    }
  }
}
