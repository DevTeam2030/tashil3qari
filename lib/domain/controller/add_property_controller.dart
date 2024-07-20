import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/urls.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/loading_manager.dart';
import 'package:tashil_agary/domain/dio/dio_imports.dart';
import 'package:tashil_agary/domain/model/model/home_product.dart';
import 'package:tashil_agary/domain/model/models/make_auction_model.dart';
import 'package:tashil_agary/utilites/route_manager.dart';

import '../../presentation/general/add_ad/add_ad_imports.dart';
import '../../presentation/general/add_ad/widgets/widgetImports.dart';
import '../model/models/add_property_model.dart';



class AddPropertyController  {
  final DioHelper _dio = DioHelper();

  Future<bool> deleteVideo({required BuildContext context,required   int propertyId }) async {

    var res = await _dio.post(url:'${Urls.deleteVideoAd}?lang=${Constants.langCode}', context: context,
        body: {
      "property_id":propertyId
        });
    if (res != null) {
     try{
       LoadingDialog.showSimpleToast(res['message'].toString());
       return true;
     }catch(e){
       Utils.printData(e.toString());
       return false;
     }

    }
    return false;

  }
  Future<bool> editProperty({required BuildContext context,required   EditPropertyModel model, }) async {

    Map<String,dynamic>map=model.toJson();
    FormData formData = FormData.fromMap(map);
    map.forEach((key, value) {
      if(value is File){

        formData.files.add(MapEntry(key, MultipartFile.fromFileSync(value.path)));
    }
      else if(value is List<File>){
        for(int i=0;i<value.length;i++) {
          formData.files.add(
              MapEntry(key+'[$i]', MultipartFile.fromFileSync(value[i].path)));
        }}
      else {
          formData.fields.add(MapEntry(key, value.toString()));

    }
    });
    formData.fields.add(MapEntry('lang', Constants.langCode));
    var res = await _dio.post(url:'${Urls.editProperty}?lang=${Constants.langCode}', context: context,body: map,formData: formData);
    if (res != null) {
     try{

       LoadingDialog().widgetAlertDialog(context:Constants.navigatorAppKey.currentContext!,
           widget:  AdSuccesWidget(title: 'editMessage'.tr(),
               // message: 'requirementsMessage1'.tr(),
               message: res['message'].toString()
           ));
       return true;
     }catch(e){
       Utils.printData(e.toString());
       return false;
     }

    }
    return false;

  }
  Future<int?> addProperty({required BuildContext context,required  Map<String,dynamic>map,required bool addBid }) async {
    int? num;
    FormData formData = FormData.fromMap(map);
    map.forEach((key, value) {
      if(value is File){
        formData.files.add(MapEntry(key, MultipartFile.fromFileSync(value.path)));
    }
      else if(value is List<File>){
        for(int i=0;i<value.length;i++) {
          formData.files.add(
              MapEntry(key+'[$i]', MultipartFile.fromFileSync(value[i].path)));
        }}
      else {
          formData.fields.add(MapEntry(key, value.toString()));

    }
    });
    formData.fields.add(MapEntry('lang', Constants.langCode));
    var res = await _dio.post(url:'${Urls.addProperty}?lang=${Constants.langCode}', context: context,body: map,formData: formData);
    if (res != null) {
     try{

      num= int.tryParse(res['data']['id'].toString());
    if(num!=null){
      if(addBid){
        MyRoute().navigate(context: context, route: IfAddAdBidScreen(propertyId: num));
      }else {
        gotoIntro(context: context);
      }

      LoadingDialog().widgetAlertDialog(context:Constants.navigatorAppKey.currentContext!,
          widget:  AdSuccesWidget(title: 'requirementsMessage'.tr(),
              // message: 'requirementsMessage1'.tr(),
              message: res['message'].toString()
          ));
    }
     }catch(e){
       Utils.printData(e.toString());
     }

    }
    return num;

  }

  Future<void> makeAuction({required BuildContext context,required  MakeAuctionModel model,required bool isPropertyFeatured}) async {
    var res = await _dio.post(url:'${Urls.makeAuction}?lang=${Constants.langCode}', context: context,body: model.toJson(),);
    if (res != null) {
      // LoadingDialog.showSimpleToast(res['message'].toString());
      //
      if(isPropertyFeatured){
        gotoIntro(context: context);
      }else{
        MyRoute().navigate(context: context, route: AddAdFeaturedScreen(propertyId: model.propertyId,));
      }

    LoadingDialog().widgetAlertDialog(context:Constants.navigatorAppKey.currentContext!,
              widget:  AdSuccesWidget(title: 'requirementsMessage'.tr(),
                message: res['message'].toString()));
    }

  }
  Future<void> makeAdFeatured({required BuildContext context,required  MakeAdFeaturedModel model}) async {
    var res = await _dio.post(url:'${Urls.featuredProperty}?lang=${Constants.langCode}', context: context,body: model.toJson(),);
    if (res != null) {
      gotoIntro(context: context);
      LoadingDialog().widgetAlertDialog(context:Constants.navigatorAppKey.currentContext!,
          widget:  AdSuccesWidget(title: 'requirementsMessage'.tr(),
              message: res['message'].toString()));
    }

  }

  Future<List<HomeProduct>> getUserWishlistData({required BuildContext context,required  int page}) async {
    List<HomeProduct> data=[];
    String url='${Urls.getWishlist}?lang=${Constants.langCode}';
    if(Constants.userDataModel!=null&&Constants.isLogin)url='$url&user_id=${Constants.userDataModel!.id}';
    var res = await _dio.get(url:url, context: context);
    if (res != null) {
      try{
        data = List<HomeProduct>.from(res['data'].map((x) => HomeProduct.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }

  Future<void> hiringRealEstateConsultantForAd({required BuildContext context,required int propertyId,required int consultantId}) async {
    // int? num;

    var res = await _dio.post(url:'${Urls.addConsultantProperty}?lang=${Constants.langCode}', context: context,
        body:
        {
    "property_id": propertyId,
    "consultant_id": consultantId,
    });
    if (res != null) {
      try{

        // num= int.tryParse(res['data']['id'].toString());
        // if(num!=null){
        //   MyRoute().navigate(context: context, route: IfAddAdBidScreen(propertyId: num));
          LoadingDialog().widgetAlertDialog(context:Constants.navigatorAppKey.currentContext!,
              widget:  AdSuccesWidget(title: 'requirementsMessage'.tr(),
                  // message: 'requirementsMessage1'.tr(),
                  message: res['message'].toString()
              ));
        // }
      }catch(e){
        Utils.printData(e.toString());
      }

    }
    // return num;

  }



  Future<int?> addUnPublishedPropertyToPublish({required BuildContext context,required  Map<String,dynamic>map, }) async {
    int? num;

    var res = await _dio.post(url:'${Urls.publishProperty}?lang=${Constants.langCode}', context: context,body: map,);
    if (res != null) {
      try{

        num= int.tryParse(res['data']['id'].toString());
        if(num!=null){
          MyRoute().navigate(context: context, route: IfAddAdBidScreen(propertyId: num));
          LoadingDialog().widgetAlertDialog(context:Constants.navigatorAppKey.currentContext!,
              widget:  AdSuccesWidget(title: 'requirementsMessage'.tr(),
                  // message: 'requirementsMessage1'.tr(),
                  message: res['message'].toString()
              ));
        }
      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return num;

  }


  Future<bool> deleteImageFromAd({required BuildContext context,required  int imageId }) async {
    int? num;

    var res = await _dio.post(url:'${Urls.deleteImageFromAd}?lang=${Constants.langCode}', context: context,
      body: {
      "image_id":imageId
    },);
    if (res != null) {
      try{
        LoadingDialog.showSimpleToast(res['message'].toString());
        return true;
      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return false;

  }


}
