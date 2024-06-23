import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:tashil_agary/app/cache_helper.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/presentation/notifications/notifications_screen.dart';
import 'package:tashil_agary/utilites/route_manager.dart';


class NotificationService {
  static final NotificationService _notificationService =
  NotificationService._internal();
  factory NotificationService() {
    return _notificationService;
  }
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  NotificationService._internal();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  int _id = 0;
  bool show = true;
  Future<void> init() async {

    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestCriticalPermission: true,
            requestSoundPermission: true,
            // onDidReceiveLocalNotification: flutterNotificationClick
        );
    // const IOSInitializationSettings initializationSettingsIOS =
    // IOSInitializationSettings(
    //   requestSoundPermission: true,
    //   requestBadgePermission: true,
    //   requestAlertPermission: true,
    //   // onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    // );

    const InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsDarwin,
        macOS: null);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: flutterNotificationClick,
    // onDidReceiveBackgroundNotificationResponse: _firebaseMessagingBackgroundHandler
    );

    messaging.getToken().then((value){
      Utils.printData('Firebase Notification token ====>$value');
      Constants.firebaseToken='$value';

    });
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      _id++;
      if(Constants.userDataModel!=null) {
        Constants.notificationsCounter.value= Constants.notificationsCounter.value+1;
        CacheHelper.saveData(key: ConstantsKeys.notificationKey, value: Constants.notificationsCounter.value);
      }
      // _showNotificationWithDefaultSound(event.notification.title,event.notification.body);
      showLocalNotification(event,_id);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
           flutterNotificationClick(null);

    });
    // FirebaseMessaging.onBackgroundMessage((message) async{
    //   if(Platform.isAndroid)_firebaseMessagingBackgroundHandler(message);
    // });
  }



  showLocalNotification(RemoteMessage event,int id) async {

    String? title=event.notification!.title;
    String? body=event.notification!.body;

    var android = AndroidNotificationDetails(
      // "${DateTime.now()}",
      title??'',
      body??'',
      // "${_notify["body"]}",
      priority: Priority.high,
      importance: Importance.max,
      playSound: true,
      shortcutId: "$_id",
    );
    var ios =  DarwinNotificationDetails(subtitle: title??'',);

    var platform = NotificationDetails(android: android, iOS: ios);
    flutterLocalNotificationsPlugin.show(id, "$title", "$body", platform, payload: json.encode(event.data));
  }



  static Future flutterNotificationClick(payload) async {

    MyRoute().navigate(context: Constants.navigatorAppKey.currentContext!, route: const NotificationsScreen());
  }

  void _firebaseMessagingBackgroundHandler(RemoteMessage? message) async {
    await Firebase.initializeApp();
    MyRoute().navigate(context: Constants.navigatorAppKey.currentContext!, route: const NotificationsScreen());
  }





}