

import 'package:tashil_agary/utilites/responsive_manager.dart';

extension Reponsive on num {
  ///!------------- get height from screen height
  double get h {
    double digit  = toDouble();
    double height = (digit / 812.0) * ResponsiveManager.screenHeight;
    return height;
  }
  //!------------- get Width from screen Width
  double get w {
    double digit  = toDouble();
    double width = (digit / 375.0) * ResponsiveManager.screenWidth;
    return width;
  }

  double get sh {
    return this*ResponsiveManager.screenHeight;
  }
  ///!------------- screen Width
  double get sw {
    return this*ResponsiveManager.screenWidth;
  }


}

