import 'package:flutter/material.dart';
import 'package:xcelpros/screens/bedRoom.dart';
import 'package:xcelpros/screens/main.dart';
import 'package:xcelpros/utils/constants.dart';
import 'package:xcelpros/utils/page_transition.dart';
import 'package:toast/toast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var titleLeftPosition = MediaQuery.of(context).size.width * 0.07;
    var titleFontSize = MediaQuery.of(context).size.width * 0.085;
    var greenViewHeight = MediaQuery.of(context).size.height * 0.22;
    var greenViewWidth = MediaQuery.of(context).size.width;
    var tabbarViewHieht = MediaQuery.of(context).size.height * 0.084;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: greenViewHeight,
                color: ColoNames.appThemeGreen,
                width: greenViewWidth,
                child: Image.asset(
                  "assets/images/Group 63.png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: titleLeftPosition,
                bottom: titleLeftPosition,
                child: Text("Control\nPanel",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w600)),
              ),
              Positioned(
                child: Image.asset("assets/images/user.png"),
                right: 20,
                bottom: titleLeftPosition,
              )
            ],
          ),
          Container(
            color: ColoNames.appThemeGreen,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.78,
              decoration: BoxDecoration(
                  color: Color(0xffF6F8FB),
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(40.0),
                    topRight: const Radius.circular(40.0),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, top: 30, bottom: 0),
                    child: Text(
                      "All Rooms",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff393939)),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, bottom: 2),
                          child: Container(
                            child: GridView.count(
                              crossAxisCount: 2,
                              children: List.generate(6, (index) {
                                return collectionViewCell(index, context);
                              }),
                            ),
                          )
                          // ListView(
                          //   children: <Widget>[
                          //     Text(
                          //       "All Rooms",
                          //       style: TextStyle(fontSize: 20, color: Colors.grey),
                          //     ),

                          //   ],
                          // ),
                          )),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        color: Colors.white,
                        height: tabbarViewHieht,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                                onTap: () {
                                  Toast.show("clicked on index 0", context,
                                      duration: Toast.LENGTH_SHORT,
                                      gravity: Toast.CENTER);
                                },
                                child: Image.asset("assets/images/bulb.png")),
                            GestureDetector(
                                onTap: () {
                                  Toast.show("clicked on index 1", context,
                                      duration: Toast.LENGTH_SHORT,
                                      gravity: Toast.CENTER);
                                },
                                child: Image.asset(
                                    "assets/images/Icon feather-home.png")),
                            GestureDetector(
                              onTap: () {
                                Toast.show("clicked on index 2", context,
                                    duration: Toast.LENGTH_SHORT,
                                    gravity: Toast.CENTER);
                              },
                              child: Image.asset(
                                  "assets/images/Icon feather-settings.png"),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget collectionViewCell(int index, BuildContext context) {
    var imagesArray = [
      "assets/images/bed.png",
      "assets/images/room.png",
      "assets/images/kitchen.png",
      "assets/images/bathtube.png",
      "assets/images/house.png",
      "assets/images/balcony.png"
    ];
    var roomNames = [
      "Bed room",
      "Living room",
      "Kitchen",
      "Bath room",
      "Out door",
      "Balcony"
    ];
    var numberOfLights = [
      "4 Lights",
      "2 Lights",
      "5 Lights",
      "1 Light",
      "5 Lights",
      "2 Lights"
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          if (index == 0) {
            print("object");
            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //     builder: (BuildContext context) => BedRoom()));
            Navigator.push(
              context,
              PageTransition(
                duration: Duration(milliseconds: 400),
                type: PageTransitionType.fade,
                child: BedRoom(),
              ),
            );
            // Navigator.pushNamed(context, Constants.ROUTE_BED_ROOM);
          } else {}
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0.3,
                blurRadius: 7,
                offset: Offset(1, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    imagesArray[index],
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.width * 0.15,
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, bottom: 10),
                  child: Text(
                    roomNames[index],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                        color: Color(0xff393939)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    numberOfLights[index],
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width * 0.032,
                        color: Color(0xFFF3A90A)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
