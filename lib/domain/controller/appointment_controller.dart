import 'package:flutter/cupertino.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/urls.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/domain/dio/dio_imports.dart';
import 'package:tashil_agary/domain/model/cancel_model.dart';
import 'package:tashil_agary/domain/model/order_model.dart';
import 'package:tashil_agary/domain/model/promo_code_model.dart';

import '../../components/loading_manager.dart';

class AppointmentController  {
  final DioHelper _dio = DioHelper();

  Future<PromoCodeModel?> applyPromoCode({required BuildContext context, required int storeId,required String promoCode}) async {

    PromoCodeModel? promoCodeMode;
    var res = await _dio.post(url:'${Urls.usePromo}?lang=${Constants.langCode}',body: {
      "store_id" : storeId,
      "promo_code" :promoCode
    }, context: context);
    if (res != null) {
      try{
        promoCodeMode =PromoCodeModel.fromJson(res['data']);


      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return promoCodeMode;

  }
  Future<String> addAppointment({required BuildContext context, required Map<String,dynamic>body}) async {

    var res = await _dio.post(url:'${Urls.addOrder}?lang=${Constants.langCode}',
        context: context,body: body);
    if (res != null&&res['data'].toString().isNotEmpty) {
      return res['data']['order_id'].toString();
    } else {
      return '';
    }
  }
  Future<bool> reOrder({required BuildContext context, required Map<String,dynamic>body}) async {

    var res = await _dio.post(url:'${Urls.reOrder}?lang=${Constants.langCode}',
        context: context,body: body);
    if (res != null) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> rescheduleOrder({required BuildContext context, required Map<String,dynamic>body}) async {

    var res = await _dio.post(url:'${Urls.rescheduleOrder}?lang=${Constants.langCode}',
        context: context,body: body);
    if (res != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> cancelAppointment({required BuildContext context, required int appointmentId, required int reasonId}) async {

    var res = await _dio.post(url:'${Urls.cancelOrder}?lang=${Constants.langCode}',
        context: context,body: {
          "order_id":appointmentId,
          "reason_id":reasonId,
        });
    if (res != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteOrderService({required BuildContext context,
    required List<int> services,required int orderId}) async {

    var res = await _dio.post(url:'${Urls.deleteOrderService}?lang=${Constants.langCode}',
        context: context,body: {
          "order_id":orderId,
          "services":services,
        });
    if (res != null) {
      if(res['message']!=null) LoadingDialog.showSimpleToast(res['message']);
      return true;
    } else {
      return false;
    }
  }

  Future<List<CancelReasonModel>> getCancelReasons({required BuildContext context,required String vendorId}) async {
    List<CancelReasonModel> data=[];
    var res = await _dio.get(url:'${Urls.cancelReasons}?vendor_id=$vendorId&lang=${Constants.langCode}', context: context);
    if (res != null) {
      try{
        // venueModel = VenueModel.fromJson();
        data = List<CancelReasonModel>.from(res['data'].map((x) => CancelReasonModel.fromJson(x)));
      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;

  }
  Future<bool> addToCalendar({required BuildContext context, required int appointmentId}) async {

    var res = await _dio.post(url:'${Urls.addToCalendar}?lang=${Constants.langCode}',
        context: context,body: {
          "order_id":appointmentId
        });
    if (res != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<AppointmentModel>> getMyAppointments({required BuildContext context,required AppointmentStatus appointmentStatus,required int page}) async {
    List<AppointmentModel> data=[];
    String status=appointmentStatus==AppointmentStatus.finishedStatus?'finished':
    (appointmentStatus==AppointmentStatus.cancelledStatus?'cancelled':'new');
    var res = await _dio.get(url:'${Urls.myOrders}$status&lang=${Constants.langCode}&&page=$page', context: context);
    if (res != null) {
      try{
        data = List<AppointmentModel>.from(res['data'].map((x) => AppointmentModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }

}
