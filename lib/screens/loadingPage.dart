import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xcelpros/screens/homePage.dart';
import 'package:xcelpros/screens/main.dart';
import 'package:awesome_loader/awesome_loader.dart';
import 'package:xcelpros/utils/constants.dart';
import 'package:xcelpros/utils/page_transition.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 2),
        () => Navigator.pushNamed(context, Constants.ROUTE_HOME)
        // Navigator.push(
        //       context,
        //       PageTransition(
        //         duration: Duration(milliseconds: 400),
        //         type: PageTransitionType.downToUp,
        //         child: HomePage(),
        //       ),
        //     )

        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (BuildContext context) => HomePage()))
        );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: ColoNames.appThemeGreen,
          ),
          Positioned(
              right: 0, child: Image.asset('assets/images/MaskGroup1.png')),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.30,
            right: MediaQuery.of(context).size.width * 0.15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AwesomeLoader(
                  loaderType: AwesomeLoader.AwesomeLoader3,
                  color: ColoNames.loaderColor,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Lets get you started",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
