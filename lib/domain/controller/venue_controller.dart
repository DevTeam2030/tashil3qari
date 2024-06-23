import 'package:flutter/cupertino.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/urls.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/domain/dio/dio_imports.dart';
import 'package:tashil_agary/domain/model/cancel_model.dart';
import 'package:tashil_agary/domain/model/venue_model.dart';
import 'package:tashil_agary/domain/model/venue_service_model.dart';

class VenueController  {
  final DioHelper _dio = DioHelper();

  Future<VenueModel?> getVenueData({required BuildContext context,required int storeId}) async {
    VenueModel? venueModel;
    var res = await _dio.get(url:'${Urls.storeInfo}$storeId&lang=${Constants.langCode}&${Constants.locationText}', context: context);
    // var res = await _dio.get(url:'${Urls.storeInfo}$storeId&lang=${Constants.langCode}&${Constants.locationText}', context: context);
    if (res != null) {
      try{
        venueModel = VenueModel.fromJson(res['data']);
      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return venueModel;

  }

  Future<void> addRecentlyViewed({required BuildContext context,required int storeId}) async {

    var res = await _dio.post(url:'${Urls.addRecentlyViewed}?lang=${Constants.langCode}',body: {
      "store_id":storeId,
      "token":Constants.firebaseToken
    }, context: context);

  }

  Future<List<VenueServiceModel>> getUpsellServices({required BuildContext context,required int serviceId}) async {
    List<VenueServiceModel> data=[];
    var res = await _dio.get(url:'${Urls.upsellServices}$serviceId&lang=${Constants.langCode}', context: context);
    if (res != null) {
      try{
        // venueModel = VenueModel.fromJson();
        data = List<VenueServiceModel>.from(res['data'].map((x) => VenueServiceModel.fromJson(x)));
      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;

  }


  Future<List<VenueServiceModel>> getUpsellForAllServices({required BuildContext context,required List<int> serviceIds,
    required int employeeId,required String orderDate,required String orderTime,}) async {
    List<VenueServiceModel> data=[];
    String url='${Urls.upsellForAllServices}?lang=${Constants.langCode}&order_date=$orderDate&order_time=$orderTime';
    if(employeeId!=0)url+='&employee_id=$employeeId';
    // url+='&services=${serviceIds.map((e) => e).toString()}';
    String services='';
    for(var item in serviceIds){
      services+='$item${item==serviceIds.last?'':','}';
    }
    url+='&services=$services';
    var res = await _dio.get(url:url, context: context);
    if (res != null) {
      try{
        data = List<VenueServiceModel>.from(res['data'].map((x) => VenueServiceModel.fromJson(x)));
      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;

  }


  // Future<List<String>> getStoreTimes1({required BuildContext context,required int storeId,
  //   required int? employeeId,required String date,}) async {
  //   List<String> data=[];
  //   // String url='${Urls.storeTimes}$storeId&date=$date&lang=${Constants.langCode}';
  //   String url='${Urls.storeTimes}$storeId&date=$date&lang=${Constants.langCode}';
  //   if(employeeId!=null&&employeeId!=0)url+='&employe_id=$employeeId';
  //   var res = await _dio.get(url:url, context: context);
  //   if (res != null) {
  //     try{
  //       data = List<String>.from(res['data'].map((x) => x));
  //     }catch(e){
  //       Utils.printData(e.toString());
  //     }
  //
  //   }
  //   return data;
  //
  // }

  Future<List<String>> getStoreTimes({required BuildContext context,required int storeId,
    required int? employeeId,required String date,required   List<VenueServiceModel> services}) async {
    List<String> data=[];
List<Map<String,dynamic>>ser=[];

for(var item in services){
  ser.add({
  "service":item.id,
  "option_id":item.options.isEmpty?'':item.options.first.id
  });
}
    Map<String,dynamic>body={
      "id":storeId,
      "date":date,
      // "employe_id":employeeId!=null&&employeeId!=0?employeeId:0,
      "reserved_services":ser
    };
    // "services":[
    // {
    // "service":9,
    // "option_id":15
    // }
    // reserved_services
    if(employeeId!=null&&employeeId!=0)  body['employe_id']=employeeId;
    var res = await _dio.post(url:'${Urls.storeTimes}?lang=${Constants.langCode}', context: context,body: body);
    if (res != null) {
      try{
        data = List<String>.from(res['data'].map((x) => x));
      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;

  }


  Future<List<String>> getStoreTimes2({required BuildContext context,required int storeId,
    required int? employeeId,required String date,required List<int>servicesIds}) async {
    List<String> data=[];

    Map<String,dynamic>body={
      "id":storeId,
      "date":date,
      // "employe_id":employeeId!=null&&employeeId!=0?employeeId:0,
      "services":servicesIds
    };
    // "services":[
    // {
    // "service":9,
    // "option_id":15
    // }
    // reserved_services
    if(employeeId!=null&&employeeId!=0)  body['employe_id']=employeeId;
    var res = await _dio.post(url:'${Urls.storeTimes}?lang=${Constants.langCode}', context: context,body: body);
    if (res != null) {
      try{
        data = List<String>.from(res['data'].map((x) => x));
      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;

  }
  Future<List<String>> checkForReschedule({required BuildContext context,required int orderId,required String date}) async {
    List<String> data=[];
    String url='${Urls.checkForReschedule}?order_id=$orderId&order_date=$date&lang=${Constants.langCode}';
    var res = await _dio.get(url:url, context: context);
    if (res != null) {
      try{
        data = List<String>.from(res['data'].map((x) => x));
      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;

  }

  Future<bool> rateVenue({required BuildContext context,required int storeId,required int rate,required String comment,}) async {
    Map<String,dynamic>body={
      "store_id":storeId,
      "rate":rate,
      "comment":comment
    };
    var res = await _dio.post(url:'${Urls.rateStore}?lang=${Constants.langCode}', context: context,body: body);
    if (res != null) {
     return true;

    }
    return false;

  }

}
