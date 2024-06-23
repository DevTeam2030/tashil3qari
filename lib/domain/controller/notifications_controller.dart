import 'package:flutter/cupertino.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/urls.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/domain/dio/dio_imports.dart';


import '../../components/loading_manager.dart';
import '../model/user_notification_model.dart';

class NotificationsController  {
  final DioHelper _dio = DioHelper();
  Future<List<NotificationModel>> getUserNotifications({required BuildContext context,}) async {
    List<NotificationModel> data=[];
    print('------------------- ${Constants.userDataModel!.isUser}');

    var res = await _dio.get(url:'${Constants.userDataModel!.isUser?Urls.userNotifications:Urls.consultantNotifications}?lang=${Constants.langCode}', context: context);
    if (res != null) {
      try{
        data = List<NotificationModel>.from(res['data'].map((x) => NotificationModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }
  Future<int> getCountUnreadNotification({required BuildContext context,}) async {
    int count=0;
    var res = await _dio.get(url:'${Urls.countNotification}?lang=${Constants.langCode}', context: context);
    if (res != null&&res['data'].toString().isNotEmpty) {
      try{
        // data = List<NotificationsModel>.from(res['data'].map((x) => NotificationsModel.fromJson(x)));
         count =int.parse(res['data'].toString());
      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return count;
  }
  Future<void> setNotificationSeen({required BuildContext context,}) async {
    var res = await _dio.post(url:'${Urls.notificationSeen}?lang=${Constants.langCode}', context: context,body: {});
  }

  Future<bool> sendNotification({required BuildContext context,required int userId,required String title,required String body}) async {
    var res = await _dio.post(url:'${Urls.sendNotificationMessage}?lang=${Constants.langCode}', context: context,
        body: {
          "user_id":userId,
          "title":title,
          "body":body
        });
    if (res != null) {
      // if(res['message']!=null) LoadingDialog.showToastNotification(res['message']);
      return true;
    }
    return false;
  }


  Future<bool> acceptProperty({required BuildContext context,required int propertyId,required int notificationId}) async {
    var res = await _dio.post(url:'${Urls.acceptProperty}?lang=${Constants.langCode}', context: context,
        body: {
          "property_id":propertyId,
          "not_id":notificationId
        });
    if (res != null) {
      if(res['message']!=null) LoadingDialog.showToastNotification(res['message']);
      return true;
    }
    return false;

  }
  Future<bool> acceptAgreement({required BuildContext context,required int agreementId,required int consultantId,required bool isAccept}) async {
    var res = await _dio.post(url:'${Urls.estateApproveAgreement}?lang=${Constants.langCode}', context: context,
        body: {
        "agreement_id":agreementId ,
        "consultant_id":consultantId,
          "status":isAccept?"approved":"rejected"
        });
    if (res != null) {
      if(res['message']!=null) LoadingDialog.showToastNotification(res['message']);
      return true;
    }
    return false;
  }
  Future<bool> refuseProperty({required BuildContext context,required int propertyId,required int notificationId}) async {
    var res = await _dio.post(url:'${Urls.refuseProperty}?lang=${Constants.langCode}', context: context,
        body: {
          "property_id":propertyId,
          "not_id":notificationId
        });
    if (res != null) {
      if(res['message']!=null) LoadingDialog.showToastNotification(res['message']);
      return true;
    }
    return false;
  }

}
