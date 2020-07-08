import 'package:flutter/material.dart';

class BedRoomProvider with ChangeNotifier {
  //Getters
  double intensityValue = 1.0;
  Color selectedColor = Colors.yellow;

//setters
  void lightIntensity(double value) {
    intensityValue = value;
    notifyListeners();
  }

  void changeLampColor(Color listOfColor) {
    selectedColor = listOfColor;
    notifyListeners();
  }
}
