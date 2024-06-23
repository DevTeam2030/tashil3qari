import 'package:flutter/cupertino.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/urls.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/domain/dio/dio_imports.dart';

import '../model/model/home_product.dart';

class SearchApiController  {
  final DioHelper _dio = DioHelper();


  Future<List<HomeProduct>> searchProducts({required BuildContext context,required  int? catId,required  int? subCatId,required String? keyword}) async {
    List<HomeProduct> data=[];
    //?lang=en&user_id=990004&&sub_cat_id=121&keywords=happ
    String url='${Urls.search}?lang=${Constants.langCode}';
    if(Constants.userDataModel!=null) url='$url&user_id=${Constants.userDataModel!.id}';
    if(keyword!=null&&keyword.isNotEmpty) url='$url&keywords=$keyword';
    if(catId!=null) url='$url&cat_id=$catId';
    else if(subCatId!=null) url='$url&sub_cat_id=$subCatId';
    else{}

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


}
