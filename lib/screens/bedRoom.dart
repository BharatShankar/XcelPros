import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:xcelpros/screens/bedRoom/bedRoomProvider.dart';
import 'package:xcelpros/screens/main.dart';
import 'package:xcelpros/utils/constants.dart';

class BedRoom extends StatefulWidget {
  @override
  _BedRoomState createState() => _BedRoomState();
}

class _BedRoomState extends State<BedRoom> {
  double _value = 1;
  Color defaltColor = Colors.yellow;
  var typesOfLights = ["Main light", "Desk lights", "Bed light"];
  var imagesOfLights = [
    ImageNames.mainLight,
    ImageNames.deskLight,
    ImageNames.bedLight,
  ];
  List<Color> _colors = [
    ColoNames.orangeBtnColor1,
    ColoNames.orangeBtnColor2
  ]; //first button
  List<Color> _secondBtnColors = [
    ColoNames.purplBtnColor1,
    ColoNames.purplBtnColor2
  ]; //second Container
  List<Color> _thirdBtnColors = [
    ColoNames.blueBtnColor1,
    ColoNames.blueBtnColor2
  ]; //third Container
  List<Color> _fourthBtnColors = [
    ColoNames.greenBtnColor1,
    ColoNames.greenBtnColor2
  ]; //fourth Container
  List<double> _stops = [0.0, 0.7];

  List<Color> listOfColors = [
    Color(0xffF29A9A),
    Color(0xff94EA8A),
    Color(0xff94CAEB),
    Color(0xffA594EB),
    Color(0xffDE94EB),
    Color(0xffEBD094)
  ];
  @override
  Widget build(BuildContext context) {
    double greenAreaHeight = MediaQuery.of(context).size.height * 0.32;
    var whiteAreaHeight = MediaQuery.of(context).size.height * 0.67;
    var greenAreaWidth = MediaQuery.of(context).size.width;
    final bedRoomService = Provider.of<BedRoomProvider>(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  greenInvivibleCircles(greenAreaHeight, greenAreaWidth),
                  Positioned(
                      left: MediaQuery.of(context).size.width * 0.07,
                      top: MediaQuery.of(context).size.width * 0.1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Constants.ROUTE_HOME);
                        },
                        child: Image.asset(
                            "assets/images/Icon ionic-md-arrow-round-back.png"),
                      )),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.07,
                    top: MediaQuery.of(context).size.width * 0.065,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "   Bed\nRoom",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.09,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: MediaQuery.of(context).size.width * 0.08,
                    top: MediaQuery.of(context).size.height * 0.07,
                    child: Image.asset(
                      "assets/images/lamp.png",
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                  ),
                  Positioned(
                      right: MediaQuery.of(context).size.width * 0.219,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.14,
                        width: 5,
                        color: Colors.white,
                      )),
                  Positioned(
                      right: MediaQuery.of(context).size.width * 0.2,
                      top: MediaQuery.of(context).size.height * 0.179,
                      child: Container(
                        height: 11,
                        width: 20,
                        decoration: new BoxDecoration(
                            color: bedRoomService.selectedColor.withOpacity(
                                bedRoomService?.intensityValue ?? 1.0),
                            borderRadius: new BorderRadius.only(
                              bottomLeft: const Radius.circular(20.0),
                              bottomRight: const Radius.circular(20.0),
                            )),
                      )),
                  Positioned(
                    top: MediaQuery.of(context).size.width * 0.3,
                    left: MediaQuery.of(context).size.width * 0.07,
                    child: Text("4 Lights",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: Colors.yellow[700],
                        )),
                  ),
                  Positioned(
                      left: 20,
                      top: MediaQuery.of(context).size.height * 0.2,
                      child: new Container(
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                          height: MediaQuery.of(context).size.width * 0.12,
                          width: MediaQuery.of(context).size.width - 20,
                          child: new ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              lightsCollectionView(
                                  imagesOfLights[0], typesOfLights[0]),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Image.asset(
                                      imagesOfLights[1],
                                      color: Colors.white,
                                    ),
                                    Text(
                                      typesOfLights[1],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        MediaQuery.of(context).size.width *
                                            0.02),
                                    color: ColoNames.buttonGreenColor),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              lightsCollectionView(
                                  imagesOfLights[2], typesOfLights[2]),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                              )
                            ],
                          )))
                ],
              ),
              Container(
                height: whiteAreaHeight,
                width: MediaQuery.of(context).size.width,
                color: ColoNames.appThemeGreen,
                child: Container(
                  decoration: BoxDecoration(
                      color: ColoNames.containerColor,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      children: <Widget>[
                        intensityWidget(),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: bulbColorController(bedRoomService),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30, top: 30),
                          child: Text(
                            "Colors",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff393939),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        colorCircles(bedRoomService),
                        spaceWidget(),
                        screensWidget(),
                        spaceWidget(),
                        gradientButtons(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.09,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Toast.show("clicked on index 0", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
                    },
                    child: Image.asset("assets/images/bulb.png")),
                GestureDetector(
                    onTap: () {
                      Toast.show("clicked on index 1", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
                    },
                    child: Image.asset("assets/images/Icon feather-home.png")),
                GestureDetector(
                  onTap: () {
                    Toast.show("clicked on index 2", context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
                  },
                  child: Image.asset("assets/images/Icon feather-settings.png"),
                )
              ],
            ),
          ),
          powerButton(),
        ],
        alignment: Alignment.bottomCenter,
      ),
    );
  }

  Widget greenInvivibleCircles(double greenAreaHeight, double greenAreaWidth) {
    return Container(
      height: greenAreaHeight,
      width: greenAreaWidth,
      color: ColoNames.appThemeGreen,
      child: Image.asset(
        "assets/images/Group 63.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Widget powerButton() {
    return Positioned(
        right: 20,
        top: MediaQuery.of(context).size.height * 0.3,
        child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/images/Icon awesome-power-off.png",
                fit: BoxFit.fill,
              ),
            ),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3.0,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(18.0)),
            )));
  }

  Widget spaceWidget() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.038,
    );
  }

  Widget intensityWidget() {
    return Text(
      "Intensity",
      style: TextStyle(
        color: Color(0xff393939),
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget colorCircles(BedRoomProvider bedRoomService) {
    return Wrap(
      children: <Widget>[
        selectClorLight(0, listOfColors[0], bedRoomService),
        SizedBox(
          width: 15,
        ),
        selectClorLight(1, listOfColors[1], bedRoomService),
        SizedBox(
          width: 15,
        ),
        selectClorLight(2, listOfColors[2], bedRoomService),
        SizedBox(
          width: 15,
        ),
        selectClorLight(3, listOfColors[3], bedRoomService),
        SizedBox(
          width: 15,
        ),
        selectClorLight(4, listOfColors[4], bedRoomService),
        SizedBox(
          width: 15,
        ),
        selectClorLight(5, listOfColors[5], bedRoomService),
      ],
    );
  }

  Widget screensWidget() {
    return Text(
      "Scenes",
      style: TextStyle(
          color: Color(0xff393939), fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget gradientButtons() {
    return Column(
      children: <Widget>[
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            scenesGrandients(_colors, "Birthday"),
            scenesGrandients(_secondBtnColors, "Party"),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.04,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            scenesGrandients(_thirdBtnColors, "Relax"),
            scenesGrandients(_fourthBtnColors, "Fun"),
          ],
        ),
      ],
    );
  }

  Widget scenesGrandients(List<Color> colours, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.width * 0.12,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * 0.015),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3.0,
              ),
            ],
            gradient: LinearGradient(
              colors: colours,
              stops: _stops,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/images/surface1.png"),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget selectClorLight(
      int index, Color choosedColor, BedRoomProvider bedRoomService) {
    return GestureDetector(
      onTap: () {
        bedRoomService.changeLampColor(listOfColors[index]);
        // setState(() {
        //   print("object");
        //   defaltColor = listOfColors[index];
        // });
      },
      child: Container(
        height: MediaQuery.of(context).size.width * 0.1,
        width: MediaQuery.of(context).size.width * 0.1,
        decoration: BoxDecoration(
            color: choosedColor,
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * 0.05)),
      ),
    );
  }

  Widget lightsCollectionView(String imageName, String lightName) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            imageName,
            color: ColoNames.buttonGreenColor,
          ),
          Text(
            lightName,
            style: TextStyle(
                color: ColoNames.buttonGreenColor,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
          color: Colors.white),
    );
  }

  Widget bulbColorController(BedRoomProvider bedRoomService) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image.asset(ImageNames.bulbWhite),
        Container(
          width: MediaQuery.of(context).size.width * 0.75,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              valueIndicatorColor: Colors.blue,
              inactiveTrackColor: Colors.grey[200],
              activeTrackColor: Colors.yellow,
              thumbColor: Colors.white,
              overlayColor: Colors.yellow[50],
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
            ),
            child: Slider(
              min: 0,
              max: 1,
              value: _value,
              onChanged: (value) {
                bedRoomService.lightIntensity(value);
                _value = bedRoomService.intensityValue;
                // setState(() {
                //   _value = value;
                // });
              },
            ),
          ),
        ),
        Image.asset(ImageNames.yellowBulb),
      ],
    );
  }
}
