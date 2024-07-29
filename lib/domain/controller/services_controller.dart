import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/urls.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/domain/dio/dio_imports.dart';
import 'package:tashil_agary/domain/model/models/service_model.dart';
import '../../components/loading_manager.dart';
import '../model/agreement/accept_agreement_model.dart';
import '../model/agreement/add_consultant_agreement_model.dart';
import '../model/agreement/agreement_details_model.dart';
import '../model/models/agreements_model.dart';

class ServicesController  {
  final DioHelper _dio = DioHelper();
  Future<List<ServiceModel>> getServices({required BuildContext context,}) async {
    List<ServiceModel> data=[];
    var res = await _dio.get(url:'${Urls.services}?lang=${Constants.langCode}', context: context);
    if (res != null) {
      try{
        data = List<ServiceModel>.from(res['data'].map((x) => ServiceModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }



}
