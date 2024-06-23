

import 'package:tashil_agary/utilites/responsive_manager.dart';

extension Reponsive on double {
  ///!------------- get height from screen height
  double get h {
    double digit  = this;
    double height = (digit / 812.0) * ResponsiveManager.screenHeight;
    return height;
  }
  //!------------- get Width from screen Width
  double get w {
    double digit  = this;
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

