import 'package:flutter/material.dart';

class ResponsiveManager {
  static late MediaQueryData _mediaQueryData;
  static double screenWidth=0;
  static double screenHeight=0;
  static double defaultSize=0;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context).copyWith(textScaleFactor: 1.0);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    defaultSize=_mediaQueryData.size.width/375;
  }
}




