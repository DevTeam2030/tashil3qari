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
import 'package:tashil_agary/domain/model/privacy_model.dart';
import 'package:tashil_agary/domain/model/models/register_request_body.dart';
import 'package:tashil_agary/domain/dio/dio_imports.dart';
import 'package:tashil_agary/domain/model/model/home_model.dart';
import 'package:tashil_agary/domain/model/models/user_data_model.dart';

class OneCategoryController  {
  final DioHelper _dio = DioHelper();

  Future<List<HomeProduct>> getAllCategoryProducts({required BuildContext context,required  int catId}) async {
    List<HomeProduct> data=[];
    var res = await _dio.get(url:'${Urls.getProducts}?cat_id=$catId&lang=${Constants.langCode}', context: context);
    if (res != null) {
     try{
       data = List<HomeProduct>.from(res['data'].map((x) => HomeProduct.fromJson(x)));

     }catch(e){
       Utils.printData(e.toString());
     }

    }
    return data;

  }





}
