import 'dart:ui' as ui;

import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/providers/home_provider.dart';
import 'package:tashil_agary/utilites/route_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LocalizationManager{
 static const localePath='assets/translations';
 static const localeList= [Locale('en', 'US'), Locale('ar', 'EG')];
 static Locale starLocale= const Locale('ar', 'EG');
 static const fallbackLocale=  Locale('en', 'US');
 static const arabicLocale=Locale('ar', 'EG');
 static const englishLocale=Locale('en', 'US');
 static SharedPreferences? prefs;
 static init() async {
   prefs = await SharedPreferences.getInstance();
   getLocale();

 }



 static getLocale(){

  String? langCode=prefs!.getString(ConstantsKeys.langCodeKey);



  if(langCode==null){
    Constants.isArabic=true;
    Constants.langCode='ar';
    prefs!.setString(ConstantsKeys.langCodeKey,'ar');
    // ignore: use_build_context_synchronously
    starLocale= const Locale('ar', 'EG');

   //  var sysLocale = ui.window.locale;
   // // ignore: use_build_context_synchronously
   // // context.setLocale(const Locale('ar', 'EG'));
   //  if(sysLocale.languageCode=='en'){
   //    Constants.isArabic=false;
   //    Constants.langCode='en';
   //    prefs!.setString(ConstantsKeys.langCodeKey,'en');
   //    // ignore: use_build_context_synchronously
   //    starLocale= const  Locale('en', 'US');
   //  }else{
   //    Constants.isArabic=true;
   //    Constants.langCode='ar';
   //    prefs!.setString(ConstantsKeys.langCodeKey,'ar');
   //    // ignore: use_build_context_synchronously
   //    starLocale= const Locale('ar', 'EG');
   //  }


  }
  else if(langCode=='ar'){
   // ignore: use_build_context_synchronously
   // context.setLocale(const Locale('ar', 'EG'));
   Constants.isArabic=true;
   Constants.langCode='ar';
   prefs!.setString(ConstantsKeys.langCodeKey,'ar');
   // ignore: use_build_context_synchronously
   starLocale= const Locale('ar', 'EG');

  }
 else{

   // ignore: use_build_context_synchronously
   // context.setLocale(const Locale('en', 'US'));
   Constants.isArabic=false;
   Constants.langCode='en';
   prefs!.setString(ConstantsKeys.langCodeKey,'en');
   starLocale= const  Locale('en', 'US');
  }
  // ignore: use_build_context_synchronously
  // getHomeData(context);
 }
//
static changeLocaleLange(BuildContext context)async{
  if(context.locale.languageCode=='ar') {
   prefs!.setString(ConstantsKeys.langCodeKey,'en');
    // ignore: use_build_context_synchronously
    context.setLocale(const Locale('en', 'US'));

    Constants.isArabic=false;
    Constants.langCode='en';
  } else {
    // ignore: use_build_context_synchronously
    context.setLocale(const Locale('ar', 'EG'));
    prefs!.setString(ConstantsKeys.langCodeKey,'ar');
    Constants.isArabic=true;
    Constants.langCode='ar';
  }
  gotoIntro(context:context,currentIndexScreen: 0);

 }

static changeLocaleLangeToEnglish({required BuildContext context})async{

if(!Constants.isArabic)return;
   prefs!.setString(ConstantsKeys.langCodeKey,'en');

    // ignore: use_build_context_synchronously
    context.setLocale(const Locale('en', 'US'));

    Constants.isArabic=false;
    Constants.langCode='en';

// GeneralController.changeLanguage(context: context);
//
//   context.read<HomeProvider>().getHomeData(context: context);
gotoSplash(context);
 }
static changeLocaleLangeToArabic({required BuildContext context,})async{

  if(Constants.isArabic)return;
    context.setLocale(const Locale('ar', 'EG'));
    prefs!.setString(ConstantsKeys.langCodeKey,'ar');

    Constants.isArabic=true;
    Constants.langCode='ar';
//   GeneralController.changeLanguage(context: context);
//   print('---------------- ar -------------------');
//   context.read<HomeProvider>().getHomeData(context: context);
  gotoSplash(context);
 }


}