import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tashil_agary/app/cache_helper.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/my_app.dart';
import 'package:tashil_agary/app/notifications.dart';
import 'package:tashil_agary/presentation/notifications/notifications_screen.dart';
import 'package:tashil_agary/utilites/color_manager.dart';
import 'package:tashil_agary/utilites/localization_manager.dart';
import 'package:tashil_agary/utilites/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  // await initDynamicLinks();

  await CacheHelper.init();
  await LocalizationManager.init();
  NotificationService().init();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: ColorManager.white, // navigation bar color
      statusBarColor: ColorManager.white,
      statusBarBrightness: Brightness.dark // Dark == white status bar -- for IOS.
  ));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(
    EasyLocalization(
      supportedLocales: LocalizationManager.localeList,
      path: LocalizationManager.localePath, // <-- change the path of the translation files
      fallbackLocale:LocalizationManager.fallbackLocale,
      startLocale: LocalizationManager.starLocale,
      saveLocale: true,
      child: MyApp(),
    ),
  );
}


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // await Firebase.initializeApp();
  MyRoute().navigate(context: Constants.navigatorAppKey.currentContext!, route: const NotificationsScreen());
}

