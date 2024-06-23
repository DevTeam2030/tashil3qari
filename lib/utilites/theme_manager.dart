import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


ThemeData getApplicationThemeData({required Brightness brightness}){
  return ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(builders: {
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    }),
    appBarTheme: AppBarTheme(
      // color:brightness==Brightness.light?ColorManager.white: ColorManager.black,
      color: ColorManager.white,
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: .4,
      titleTextStyle: const TextStyle(color: ColorManager.text,fontSize: FontSize.s16,fontWeight: FontWeight.bold)
    ),

    //------  colors
    primaryColor: ColorManager.primary,
    hintColor: ColorManager.grey,
    primaryColorDark: ColorManager.modeDarkColor,
    primaryColorLight: ColorManager.modeDarkColor,
    brightness:brightness,
    disabledColor: ColorManager.transparent,
    // splashColor: ColorManager.secondary.withOpacity(.4),
      backgroundColor: ColorManager.white,



      // textTheme:Constants.isArabic?GoogleFonts.cairoTextTheme(): GoogleFonts.promptTextTheme(),
      textTheme: GoogleFonts.tajawalTextTheme(),
    fontFamily:GoogleFonts.tajawal().fontFamily,
    scaffoldBackgroundColor: ColorManager.white,
    useMaterial3: true,
    highlightColor:  ColorManager.transparent,
    splashColor: ColorManager.transparent,

    // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey1),

    //------  card view theme
  //   cardTheme: CardTheme(
  //     color: ColorManager.white,
  //      elevation: AppSize.s4,
  //     shadowColor: ColorManager.grey
  //   ),
  //
  //   //------  app bar theme
  //   appBarTheme:AppBarTheme(
  //
  //     shadowColor: ColorManager.white,
  //   elevation: 0,
  //   color: ColorManager.transparent,
  //   centerTitle: true,
  //     titleTextStyle: getTextStyleMedium(color: ColorManager.black,fontSize: FontSize.s16)
  // ),
  //
  //   //------  button thme
  //   buttonTheme: ButtonThemeData(
  //     disabledColor: ColorManager.grey1,
  //   buttonColor: ColorManager.primary,
  //   splashColor: ColorManager.primary,
  //   shape: const StadiumBorder (),
  // ),
  //
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style:ElevatedButton.styleFrom(
  //       textStyle: getTextStyleMedium(color: ColorManager.black),
  //       primary: ColorManager.primary,
  //       shadowColor: ColorManager.grey1,
  //       shape:  RoundedRectangleBorder (borderRadius: BorderRadius.circular(AppSize.s12)),
  //     )
  //   ),
  //   //------  text style
  //   textTheme: TextTheme(
  //     headline1: getTextStyleSemiBold(color: ColorManager.black,fontSize: FontSize.s16),
  //     subtitle1: getTextStyleMedium(color: ColorManager.grey1,fontSize: FontSize.s16),
  //     caption: getTextStyleRegular(color: ColorManager.grey1,fontSize: FontSize.s16),
  //     bodyText1: getTextStyleRegular(color: ColorManager.grey1,fontSize: FontSize.s16),
  //   ),
  //   //--------- input decroation for text field
  //   inputDecorationTheme: InputDecorationTheme(
  //     hintStyle: getTextStyleRegular(color: ColorManager.black),
  //     labelStyle: getTextStyleMedium(color: ColorManager.grey),
  //     errorStyle: getTextStyleMedium(color: ColorManager.error),
  //     contentPadding: const EdgeInsets.all(PaddingManager.p12),
  //     enabledBorder:OutlineInputBorder(
  //       borderSide: BorderSide(color: ColorManager.grey,width: AppSize.s5, ),
  //       borderRadius: BorderRadius.circular(AppSize.s12),
  //     ),
  //     focusedBorder:OutlineInputBorder(
  //       borderSide: BorderSide(color: ColorManager.grey,width: AppSize.s5, ),
  //       borderRadius: BorderRadius.circular(AppSize.s12),
  //     ),
  //     errorBorder:OutlineInputBorder(
  //       borderSide: BorderSide(color: ColorManager.grey,width: AppSize.s5, ),
  //       borderRadius: BorderRadius.circular(AppSize.s12),
  //     ),
  //     focusedErrorBorder: OutlineInputBorder(
  //       borderSide: BorderSide(color: ColorManager.grey,width: AppSize.s5, ),
  //       borderRadius: BorderRadius.circular(AppSize.s12),
  //     ),
  //     disabledBorder: OutlineInputBorder(
  //       borderSide: BorderSide(color: ColorManager.grey,width: AppSize.s5, ),
  //       borderRadius: BorderRadius.circular(AppSize.s12),
  //     ),
  //
  //   )
  );
}