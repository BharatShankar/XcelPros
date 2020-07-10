import 'package:flutter/material.dart';
import 'package:xcelpros/screens/animatedRoute.dart';
import 'package:xcelpros/screens/bedRoom.dart';
import 'package:xcelpros/screens/bedRoom/bedRoomStateles.dart';
import 'package:xcelpros/screens/homePage.dart';
import 'package:xcelpros/screens/loadingPage.dart';
import 'package:xcelpros/screens/signinScreen/signin_validation.dart';
import 'package:xcelpros/screens/signupScreen/SignupImplementation.dart';
import 'package:xcelpros/screens/signupScreen/signup.dart';
import 'package:xcelpros/utils/constants.dart';
import 'package:xcelpros/utils/page_transition.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SignInValidation(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
        routes: {
          Constants.ROUTE_LOADING: (context) => LoadingPage(),
          Constants.ROUTE_HOME: (context) => HomePage(),
          Constants.ROUTE_BED_ROOM: (context) => BedRoomStateLess(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController usernameTextField = TextEditingController();
  TextEditingController passwordTextField = TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    usernameTextField.dispose();
    passwordTextField.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final validationService = Provider.of<SignInValidation>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[topGreenPart(), bottomPart(validationService)],
        ),
      ),
    );
  }

  Widget topGreenPart() {
    var spaceOfLeft = MediaQuery.of(context).size.width * 0.08;
    return Container(
      color: ColoNames.appThemeGreen,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Positioned(
            right: 0,
            child: Hero(
              tag: "welcomeImg",
              child: Image.asset(
                ImageNames.welcomeScreenImg,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            left: spaceOfLeft,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.145,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.white),
              height: 5,
            ),
          ),
          Positioned(
              bottom: 60,
              left: spaceOfLeft,
              child: Text(EngConstants.welcome,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.07,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ))),
          Positioned(
              bottom: 25,
              left: spaceOfLeft,
              child: Text(EngConstants.toRoomControl,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ))),
        ],
      ),
    );
  }

  Widget bottomPart(SignInValidation validationService) {
    return Container(
      color: ColoNames.appThemeGreen,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(40.0),
              topRight: const Radius.circular(40.0),
            )),
        child: Padding(
          padding: const EdgeInsets.only(top: 0, left: 10, right: 10),
          child: ListView(
            children: <Widget>[
              formContainer(validationService),
              signinButton(validationService),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: signUpRow(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget formContainer(SignInValidation validationService) {
    return Container(
      //color: Color(0xff393939),
      margin: new EdgeInsets.symmetric(horizontal: 20.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Form(
              key: this._formKey,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new TextFormField(
                      onChanged: (String value) {
                        validationService.changeUserName(value);
                      },
                      validator: Validations.validateName,
                      controller: usernameTextField,
                      decoration: InputDecoration(
                        errorText: validationService.userName.error,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        icon: Image.asset(ImageNames.forUserName),
                        hintText: EngConstants.enterUserName,
                        labelText: 'Username',
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new TextFormField(
                      onChanged: (String value) {
                        validationService.changePassword(value);
                      },
                      validator: Validations.validatePassword,
                      controller: passwordTextField,
                      obscureText: true,
                      decoration: InputDecoration(
                        errorText: validationService.password.error,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        icon: Image.asset(ImageNames.passwordLockImg),
                        hintText: 'Enter Password',
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.grey),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget signinButton(SignInValidation validationService) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
      child: new Container(
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: RaisedButton(
          onPressed: validationService.isValid //isButtonEnabled
              ? () {
                  if (_formKey.currentState.validate()) {
                    print("validated");
                    Navigator.pushNamed(context, Constants.ROUTE_LOADING);
                    // Navigator.push(
                    //   context,
                    //   PageTransition(
                    //     duration: Duration(milliseconds: 350),
                    //     type: PageTransitionType.upToDown,
                    //     child: LoadingPage(),
                    //   ),
                    // );
                  }
                }
              : null,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
            // side: BorderSide(color: Colors.red)
          ),
          color: ColoNames.buttonGreenColor,
          child: Text(
            "SIGN IN",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }

  Widget signUpRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.grey),
        ),
        FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      alignment: Alignment.bottomCenter,
                      curve: Curves.ease,
                      duration: Duration(milliseconds: 400),
                      type: PageTransitionType.size,
                      child: SignupStateLess()));
              // Navigator.push(context, ScaleRoute(widget: SignUp()));
            },
            child: Text(
              "SIGN UP",
              style: TextStyle(
                  color: ColoNames.buttonGreenColor,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
