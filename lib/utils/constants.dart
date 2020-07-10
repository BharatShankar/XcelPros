import 'package:flutter/material.dart';

class Constants {
  static const String ROUTE_HOME = "route_home";
  static const String ROUTE_SIGNUP = "route_signup";
  static const String ROUTE_LOGIN = "route_login";
  static const String ROUTE_LOADING = "route_loading";
  static const String ROUTE_BED_ROOM = "route_bed_room";
}

class ImageNames {
  static const String mainLight = "assets/images/surface2.png";
  static const String deskLight = "assets/images/furniture-and-household.png";
  static const String bedLight = "assets/images/bed (1).png";
  static const String bulbWhite = "assets/images/solution.png";
  static const String yellowBulb = "assets/images/solution-1.png";
  static const String welcomeScreenImg = 'assets/images/MaskGroup1.png';
  static const String forUserName = 'assets/images/Icon feather-user.png';
  static const String passwordLockImg = 'assets/images/Icon feather-lock.png';
  static const String emailImg = 'assets/images/Icon feather-mail.png';
  static const String gradientIconImg = "assets/images/surface1.png";
  static const String powerBtnImg = "assets/images/Icon awesome-power-off.png";

  //signup images
  static const String signUpGreenImage = 'assets/images/Group 62.png';
  static const String topBlocksImage = "assets/images/Mask Group -1.png";
}

class ColoNames {
  static const Color appThemeGreen = const Color(0xFF0D2F3C);
  static const buttonGreenColor = const Color(0xff48A79B);
  static const loaderColor = const Color(0xff8FF9CD);
  static const containerColor = const Color(0xffF6F8FB);

  //gradient colored Contaners in bed room
  static const orangeBtnColor1 = const Color(0xffF39B90);
  static const orangeBtnColor2 = const Color(0xffF6B592);

  static const purplBtnColor1 = const Color(0xffA793EB);
  static const purplBtnColor2 = const Color(0xffD193EB);

  static const blueBtnColor1 = const Color(0xff93CAEB);
  static const blueBtnColor2 = const Color(0xff93D9EB);

  static const greenBtnColor1 = const Color(0xff89DD94);
  static const greenBtnColor2 = const Color(0xffB4E992);
}

class EngConstants {
  static const String welcome = "Welcome";
  static const String toRoomControl = "to Room Control";
  static const String userName = "Username";
  static const String password = "Password";

  //signup Constatnts
  static const String newAccount = "Create New Account";
  static const String enterUserName = 'Enter Username';
}

class Validations {
  static String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 2 charater';
    else
      return null;
  }

  static String validatePassword(String value) {
    if (value.length < 3)
      return 'Password must be more than 2 charater';
    else
      return null;
  }

  static String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}
