import 'package:flutter/material.dart';

class ColorManager{
  static const Color primary =   Color(0xFF2F93F6);
  static const Color fff =   Color(0xFFFFFFFF);
  static const Color text =   Color(0xFF282828);
  static const Color textField =   Color(0xFF959595);
  static const Color reject =   Color(0xFFFF8787);
  static const Color premium =   Color(0xFFCE9E1F);
  static const Color other =   Color(0xFFA0A0A0);
  static const Color meChatColor =   Color(0xFF0093FF);
  static const Color otherChatColor =   Color(0xFF234F68);


  // static const Color divider=   Color(0xFF828282);
  static const Color icons =   Color(0xFF292D32);
  static const Color icons2 =   Color(0xFF1F4C6B);
  // static const Color other =   Color(0xFF234F68);
  static const Color icons3 =   Color(0xFF252B5C);
  static const Color icons4 =   Color(0xFF303A42);
  static const Color notificationsBody =   Color(0xFFA7A7A7);

  static const Color textGrey=   Color(0xFFF5F4F8);
  static const Color review=   Color(0xFFE9E9E9);
  static const Color grey=   Color(0xFFD1D1D1);
  static const Color divider=   Color(0xFFECEDF3);
  static const Color requirement=   Color(0xFFF5F5F5);

  static const Color bottom=   Color(0xFFA9C0FF);
  static Color white =Colors.white;
  static const Color red = Color(0xFFFF0000);




  static const Color primary2 =   Color(0xFFFF635C);
  static const Color primaryWithOpacity =   Color(0xFFffdedc);
  static const Color green =   Color(0xFF48B581);
  static const Color searchGrey =   Color(0xFFECECEC);
  static const Color dashboard =   Color(0xFFFEEEE);


  static const Color reviewBorder=   Color(0xFF76C1D1);
  static const Color mySeparator=   Color(0xFFD4D4D4);
  static const Color calender=   Color(0xFF65B43D);


  static const Color drawerInActive=   Color(0xFFA4A4A5);
  static const Color appBarTitle=   Color(0xFF5D5167);
  static const Color orange=   Color(0xFFF9B21E);
  static const Color seeMore=   Color(0xFFF2DAAE1);

  static const Color textDate=    Color(0xFF5D5167);
  static const Color notificationTitle=     Color(0xFF9389C0);



  // static const Color primary2 =   Color(0xFF7b69ff);
  static const Color textPrimaryColor =   Color(0xFF0E42CF);
  static const Color allColor =   Color(0xFF0D45DC);
  static const Color titleHomeColor =   Color(0xFF312775);
  static const Color titleServiceNameColor =   Color(0xFF060911);
  static const Color textFormFieldFillColor =  Color(0xFFEBEBEE);
  static const Color circleYellowColor =  Color(0xFFFFDF72);
  static const Color memberShipColor =  Color(0xFF202A45);
  static const Color newsText =  Color(0xFF444D6E);

  static const Color reviewGrey = Color(0xFFC4C4C4);

  static const Color reviewDateGrey = Color(0xFFA3A3A3);


  // static const Color white = Color(0xFFFFFFFF);
  static const Color grey1 = Colors.grey;

  static Color black =Colors.black;

 // static const Color secondary =  Color(0xFF970CC0);
 // static const Color secondary2 =  Color(0xFF5E0878);
 // static const Color secondary3 =  Color(0xFFBF7ABA);
 // static const Color secondary4 =  Color(0xFF970CC0);
 // static const Color secondary5 =  Color(0xFF9A2C92);
 static const Color bookColor =  Color(0xFFF2E4F1);
 // static const Color starColor =  Color(0xFFF59217);
 static const Color starColor =  Color(0xFFFFBC01);
 static const Color starReviewColor =  Color(0xFFFFBC01);

 static const Color starGryColor =  Color(0xFFDADDE0);
 static const Color tabGreyColor =  Color(0xFF777777);
 static const Color serviceColor =  Color(0xFFF8F8F8);
 static const Color selectedColor =  Color(0xFF5CB85C);
 static const Color languageColor =  Color(0xFF56E9EF);
 static const Color dotColor =  Color(0xFFD59DE5);
 static const Color reviewGreyColor =  Color(0xFF9F9F9F);
 static const Color barrierColor =  Color(0xFF0E030D);
 static const Color hintColor =  Color(0xFF9E9E9E);
  static const Color lightGrey = Color(0xFFE4E6E7);




  static const Color grey4 = Color(0xFFAEB4B7);
 static const Color textColor =  Colors.black;
  //static const Color grey = Colors.grey;

 static const Color transparent = Colors.transparent;
  static Color error =Colors.red;



  static  Color redShade700 = Colors.red.shade700;





  static Color modeLightColor =Colors.white;
  static Color modeDarkColor = const Color(0xFF212121);
  static List<Color> colors =[
     const Color(0xFFFCB41E),
     const Color(0xFF76C1D1),
     const Color(0xFFFF635C),
     const Color(0xFF5D5167),

     const Color(0xFF9389C0),
     const Color(0xFF65B43D),
     const Color(0xFFA4A4A5),
     const Color(0xFF48B581),

    const Color(0xFFCCA3A1),
    const Color(0xFF10839B),
    const Color(0xFF770500),
    const Color(0xFFB779EB),
  ];

}

// extension HexColor on Color{
// static  Color fromHex(String colorString){
//     String hexColorString=colorString.replaceAll('#', '');
//     if(hexColorString.length==6)hexColorString='FF$hexColorString'; // 8 char with opacity 100%
//     Color newColor=Color(int.parse(hexColorString,radix: 16,),);
//     return newColor;
//   }
// }

extension HexColor on String {
  Color toColor() {
    // Remove any leading hash if present
    String hex = this.replaceAll('#', '');

    // Parse the hex string to an integer
    int value = int.parse('0xFF$hex');

    // Create a Color object from the integer value
    return Color(value);
  }
}