import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppText extends StatelessWidget {
  final  String title;
  final Color? titleColor;
  final  TextAlign? titleAlign;
  final double? titleSize;
  final  int? titleMaxLines;
  final  double? titleHeight;
  final  bool? underline;
  final  bool? lineThrough;
  final  FontWeightType? fontWeightType;
  const AppText({Key? key, required this.title,  this.titleSize,this.titleColor,
    this.titleAlign=TextAlign.center, this.titleMaxLines=1,this.titleHeight=1,
    this.underline, this.lineThrough,
    this.fontWeightType=FontWeightType.regular}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
        title,
        textAlign: titleAlign,
        overflow: TextOverflow.ellipsis,
        maxLines: titleMaxLines,
        style:getAppTextStyle(
          titleHeight: titleHeight,
          titleSize: titleSize??FontSize.s14,
          titleColor: titleColor??ColorManager.textColor,
          fontWeightType: fontWeightType,
          lineThrough: lineThrough,
          underline: underline
        )

    );
  }
}
getAppTextStyle({double? titleSize,Color? titleColor, double? titleHeight,
  FontWeightType? fontWeightType,bool? underline=false,bool? lineThrough=false}){
return  GoogleFonts.tajawal(
  fontSize: titleSize??FontSize.s14,
  height: titleHeight,
  color: titleColor??ColorManager.textColor,
  decoration: underline==true?TextDecoration.underline:
  (lineThrough==true?TextDecoration.lineThrough:null),
  decorationThickness: 10,
  fontWeight: getFontWeightType(fontWeightType??FontWeightType.regular),
  fontStyle: FontStyle.normal,
);
}
getFontWeightType(FontWeightType fontWeightType){
  if(fontWeightType==FontWeightType.bold){
    return FontWeight.bold;
  }
  else if(fontWeightType==FontWeightType.semiBold){
    return FontWeight.w600;
  }
  else if(fontWeightType==FontWeightType.extraBold){
    return FontWeight.w700;
  }
  else if(fontWeightType==FontWeightType.light){
    return FontWeight.w300;
  }
  else if(fontWeightType==FontWeightType.medium){
    return FontWeight.w500;
  }
  else{
    // regular
    return FontWeight.w400;
  }
}
//
// class MediumTextStyle extends StatelessWidget {
//   final  String title;
//   final Color? titleColor;
//   final  TextAlign? titleAlign;
//   final double? titleSize;
//   final  int? titleMaxLines;
//   const MediumTextStyle({Key? key, required this.title, required this.titleSize,this.titleColor,
//     this.titleAlign=TextAlign.start, this.titleMaxLines=1}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//
//     // return AutoSizeText(
//     return Text(
//         title,
//         overflow: TextOverflow.ellipsis,
//         style: getTextStyleMedium(color: titleColor??ColorManager.textColor,
//             fontSize: titleSize??FontSize.s11),
//         maxLines: titleMaxLines,
//         textAlign: titleAlign);
//   }
// }
//
// class SemiBoldTextStyle extends StatelessWidget {
//   final  String title;
//   final Color? titleColor;
//   final  TextAlign? titleAlign;
//   final double? titleSize;
//   final  int? titleMaxLines;
//   const SemiBoldTextStyle({Key? key, required this.title, required this.titleSize,this.titleColor,
//     this.titleAlign=TextAlign.start, this.titleMaxLines=1}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//
//     // return AutoSizeText(
//     return Text(
//         title,
//         overflow: TextOverflow.ellipsis,
//         style: getTextStyleSemiBold(color: titleColor??ColorManager.textColor,fontSize: titleSize??FontSize.s16),
//         maxLines: titleMaxLines,
//         textAlign: titleAlign);
//   }}
//
//
// class BoldTextStyle extends StatelessWidget {
//   final  String title;
//   final Color? titleColor;
//   final  TextAlign? titleAlign;
//   final double? titleSize;
//   final  int? titleMaxLines;
//   const BoldTextStyle({Key? key, required this.title, required this.titleSize,this.titleColor,
//     this.titleAlign=TextAlign.start, this.titleMaxLines=1}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//
//     // return AutoSizeText(
//     return Text(
//         title,
//         overflow: TextOverflow.ellipsis,
//         style: getTextStyleMoreBold(color: titleColor??ColorManager.textColor,
//             fontSize: titleSize??FontSize.s16
//         ),
//         maxLines: titleMaxLines,
//         textAlign: titleAlign);
//   }}
//
// class MoreBoldTextStyle extends StatelessWidget {
//   final  String title;
//   final Color? titleColor;
//   final  TextAlign? titleAlign;
//   final double? titleSize;
//   final  int? titleMaxLines;
//   const MoreBoldTextStyle({Key? key, required this.title, required this.titleSize,this.titleColor,
//     this.titleAlign=TextAlign.start, this.titleMaxLines=1}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//
//     // return AutoSizeText(
//     return Text(
//         title,
//         overflow: TextOverflow.ellipsis,
//         style: getTextStyleMoreBold(color: titleColor??ColorManager.textColor,
//             fontSize: titleSize??FontSize.s16
//         ),
//         maxLines: titleMaxLines,
//         textAlign: titleAlign);
//   }}
//
//
// class LightTextStyle extends StatelessWidget {
//   final  String title;
//   final Color? titleColor;
//   final  TextAlign? titleAlign;
//   final double? titleSize;
//   final  int? titleMaxLines;
//   const LightTextStyle({Key? key, required this.title, required this.titleSize,this.titleColor,
//     this.titleAlign=TextAlign.start, this.titleMaxLines=1}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//
//     // return AutoSizeText(
//     return Text(
//         title,
//         overflow: TextOverflow.ellipsis,
//         style: getTextStyleLight(color: titleColor??ColorManager.textColor,fontSize: titleSize??FontSize.s12),
//         maxLines: titleMaxLines,
//         textAlign: titleAlign);
//   }}
//
//
// class RegularTextStyle extends StatelessWidget {
//   final  String title;
//   final Color? titleColor;
//   final  TextAlign? titleAlign;
//   final double? titleSize;
//   final double? titleHeight;
//
//   final  int? titleMaxLines;
//   // ignore: use_key_in_widget_constructors
//   const RegularTextStyle({required this.title, required this.titleSize,this.titleColor,
//     this.titleAlign=TextAlign.start, this.titleMaxLines=1,this.titleHeight});
//   @override
//   Widget build(BuildContext context) {
//
//     // return AutoSizeText(
//     return Text(
//       title,
//
//       overflow: TextOverflow.ellipsis,
//       style: getTextStyleRegular(color: titleColor??ColorManager.textColor,fontSize: titleSize??FontSize.s16,titleHeight: titleHeight),
//       maxLines: titleMaxLines,
//       textAlign: titleAlign,);
//   }}
// TextStyle _getTextStyle(double fontSize,FontWeight fontWeight ,Color color,bool? underLine ,double titleHeight){
//   return TextStyle(fontSize: fontSize,color: color,height: titleHeight,
//     // fontFamily:Constants.isArabic?GoogleFonts.tajawal().fontFamily:FontWeightManager.proximaFontFamily,
//     fontWeight: Constants.isArabic?fontWeight:FontWeight.w400,
//     // fontFamily:Constants.isArabic?GoogleFonts.tajawal().fontFamily: GoogleFonts.poppins().fontFamily,
//     decoration: underLine!=null&&underLine?TextDecoration.underline:null,);
// }
//
// TextStyle _getBoldTextStyle(double fontSize,FontWeight fontWeight ,Color color,bool? underLine ,double titleHeight){
//   return TextStyle(fontSize: fontSize,color: color,height: titleHeight,
//     // fontFamily:Constants.isArabic?GoogleFonts.tajawal().fontFamily:FontWeightManager.proximaFontFamily,
//     fontWeight: Constants.isArabic?fontWeight:FontWeight.w900,
//     // fontWeight: fontWeight,
//     // fontFamily:Constants.isArabic?GoogleFonts.tajawal().fontFamily: GoogleFonts.poppins().fontFamily,
//     decoration: underLine!=null&&underLine?TextDecoration.underline:null,);
// }
// // static const FontWeight bold=FontWeight.w700;
// // static const FontWeight semiBold=FontWeight.w600;
// // static const FontWeight medium=FontWeight.w500;
// // static const FontWeight regular=FontWeight.w400;
// // static const FontWeight light=FontWeight.w300;
//
// //--- bold
// TextStyle getTextStyleNormal({double fontSize=FontSize.s12,required Color color,bool? underLine, double? titleHeight}){
//   return _getTextStyle(fontSize, FontWeightManager.bold, color,underLine,titleHeight??1.4);
// }
//
// //--- bold
// TextStyle getTextStyleBold({double fontSize=FontSize.s12,required Color color,bool? underLine,double? titleHeight}){
//   return _getTextStyle(fontSize, FontWeightManager.bold, color,underLine,titleHeight??1.4);
// }
//
// //---More bold
// TextStyle getTextStyleMoreBold({double fontSize=FontSize.s12,required Color color,bool? underLine,double? titleHeight}){
//   return _getBoldTextStyle(fontSize, FontWeightManager.moreBold, color,underLine,titleHeight??1.4);
// }
//
// //--- Semi bold
// TextStyle getTextStyleSemiBold({double fontSize=FontSize.s12,required Color color,bool? underLine,double? titleHeight}){
//   return _getTextStyle(fontSize,  FontWeightManager.semiBold, color,underLine,titleHeight??1.4);
// }
//
// //--- medium
// TextStyle getTextStyleMedium({double fontSize=FontSize.s12,required Color color,bool? underLine,double? titleHeight}){
//   return _getTextStyle(fontSize,  FontWeightManager.medium, color,underLine,titleHeight??1.4);
// }
//
// //--- regular
// TextStyle getTextStyleRegular({double fontSize=FontSize.s12,required Color color,bool? underLine,double? titleHeight}){
//   return _getTextStyle(fontSize,  FontWeightManager.regular, color,underLine,titleHeight??1.4);
// }
//
// //--- light
// TextStyle getTextStyleLight({double fontSize=FontSize.s12,required Color color,bool? underLine,double? titleHeight}){
//   return _getTextStyle(fontSize,  FontWeightManager.light, color,underLine,titleHeight??1.4,);
// }