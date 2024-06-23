import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/cache_helper.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/domain/controller/notifications_controller.dart';


import '../domain/model/user_notification_model.dart';


class NotificationsProvider extends ChangeNotifier {
  final NotificationsController _api=NotificationsController();
  bool isLoading=false;
  int countUnreadNotification=0;
  List<NotificationModel> userNotifications=[];

  Future<void>getUserNotifications({required BuildContext context,required bool notify})async{
    isLoading=true;
    userNotifications=[];
    
    if(notify)notifyListeners();
    userNotifications=await _api.getUserNotifications(context: context,);

    if(countUnreadNotification>0) await setNotificationSeen(context: context,);
    isLoading=false;
    notifyListeners();
  }

  notify(){
    isLoading=true;
    isLoading=false;
    notifyListeners();
  }

  Future<void>getCountUnreadNotification({required BuildContext context,})async{
    if(Constants.userDataModel==null)return;
    countUnreadNotification=await _api.getCountUnreadNotification(context: context,);
    CacheHelper.saveCachedNotifications(count: countUnreadNotification);
    notifyListeners();
  }

  Future<void>setNotificationSeen({required BuildContext context,})async{
    await _api.setNotificationSeen(context: context,);
    countUnreadNotification=0;
    CacheHelper.saveCachedNotifications(count: countUnreadNotification);
  }

  Future<void>sendNotification({required BuildContext context,required int userId,required String title,required String body})async{
    bool data=await _api.sendNotification(context: context,userId: userId,title: title,body: body);
  }

  Future<void>refuseProperty({required BuildContext context,required int propertyId,required int notificationId})async{
    isLoading=true;
    notifyListeners();
    bool data=await _api.refuseProperty(context: context,propertyId: propertyId,notificationId: notificationId);
    if(data)getUserNotifications(context: context, notify: false);
    else{
      isLoading=false;
      notifyListeners();
    }

  }
  Future<void>acceptProperty({required BuildContext context,required int propertyId,required int notificationId})async{
    isLoading=true;
    notifyListeners();
    bool data=await _api.acceptProperty(context: context,propertyId: propertyId,notificationId: notificationId);
    if(data)getUserNotifications(context: context, notify: false);
    else{
      isLoading=false;
      notifyListeners();
    }

  }

  Future<void>acceptAgreement({required BuildContext context,required int agreementId,required bool isAccept,required int consultantId})async{
    isLoading=true;
    notifyListeners();
    bool data=await _api.acceptAgreement(context: context,isAccept: isAccept,agreementId:agreementId,consultantId: consultantId);
    if(data)getUserNotifications(context: context, notify: false);
    else{
      isLoading=false;
      notifyListeners();
    }

  }


}
