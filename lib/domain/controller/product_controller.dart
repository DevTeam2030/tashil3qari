import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/urls.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/loading_manager.dart';
import 'package:tashil_agary/domain/model/model/home_main_category.dart';
import 'package:tashil_agary/domain/model/home_venue_model.dart';
import 'package:tashil_agary/domain/model/model/home_product.dart';
import 'package:tashil_agary/domain/model/model/product_details_model.dart';
import 'package:tashil_agary/domain/model/privacy_model.dart';
import 'package:tashil_agary/domain/model/models/register_request_body.dart';
import 'package:tashil_agary/domain/dio/dio_imports.dart';
import 'package:tashil_agary/domain/model/model/home_model.dart';
import 'package:tashil_agary/domain/model/models/user_data_model.dart';

import '../model/models/auction_data_model.dart';
import '../model/models/property_info_model.dart';

class ProductController  {
  final DioHelper _dio = DioHelper();

  Future<PropertyInfoModel?> getPropertyInfo({required BuildContext context,required  int propertyId}) async {
    PropertyInfoModel? product;
    var res = await _dio.get(url:'${Urls.getPropertyInfo}?id=$propertyId&lang=${Constants.langCode}', context: context);
    if (res != null) {
     // try{
       product =PropertyInfoModel.fromJson(res['data'][0]);

     // }catch(e){
     //   Utils.printData(e.toString());
     // }

    }
    return product;

  }


  Future<AuctionDataModel?> getAuctionData({required BuildContext context,required  int propertyId}) async {
    AuctionDataModel? product;
    var res = await _dio.get(url:'${Urls.getAuctions}?property_id=$propertyId&lang=${Constants.langCode}', context: context);
    if (res != null) {
     // try{
       product =AuctionDataModel.fromJson(res['data'][0]);

     // }catch(e){
     //   Utils.printData(e.toString());
     // }

    }
    return product;

  }

  Future<bool> addAuction({required BuildContext context,required String price,required currencyId,required int propertyId}) async {

    var res = await _dio.post(url:'${Urls.addAuction}?lang=${Constants.langCode}',
      context: context,
      body: {
        "property_id":propertyId,
        "price":price,
        "currency_id":currencyId
      },
    );
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
