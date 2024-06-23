import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/urls.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/domain/dio/dio_imports.dart';
import '../../components/loading_manager.dart';
import '../model/agreement/accept_agreement_model.dart';
import '../model/agreement/add_consultant_agreement_model.dart';
import '../model/agreement/agreement_details_model.dart';
import '../model/models/agreements_model.dart';

class AgreementsController  {
  final DioHelper _dio = DioHelper();
  Future<bool> acceptAgreement({required BuildContext context,required AcceptAgreementModel model}) async {

    var res = await _dio.post(url:'${Urls.acceptAgreement}?lang=${Constants.langCode}',
        context: context,body: model.toJson());
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

  Future<List<AgreementDetailsModel>> getEstateAgreements({required BuildContext context,}) async {
    List<AgreementDetailsModel> data=[];
    var res = await _dio.get(url:'${Urls.getEstateAgreements}?lang=${Constants.langCode}', context: context);
    if (res != null) {
      try{
        data = List<AgreementDetailsModel>.from(res['data'].map((x) => AgreementDetailsModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }
  Future<bool> addConsultantEstateAgreement({required BuildContext context,required AddConsultantAgreementModel model}) async {

    var res = await _dio.post(url:'${Urls.addConsultantEstateAgreement}?lang=${Constants.langCode}',
        context: context,body: model.toJson());
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

  // Future<String> addPdf({required BuildContext context,required PdfRequestModel model}) async {
  //
  //   Map<String,dynamic>map=model.toJson();
  //   FormData formData = FormData.fromMap(map);
  //   map.forEach((key, value) {
  //     if(value is File){
  //
  //       formData.files.add(MapEntry(key, MultipartFile.fromFileSync(value.path)));
  //     }
  //     else if(value is List<File>){
  //       for(int i=0;i<value.length;i++) {
  //         formData.files.add(
  //             MapEntry(key+'[$i]', MultipartFile.fromFileSync(value[i].path)));
  //       }}
  //     else {
  //       formData.fields.add(MapEntry(key, value.toString()));
  //
  //     }
  //   });
  //   var res = await _dio.post(url:'${Urls.addPdf}?lang=${Constants.langCode}',
  //       context: context,body: model.toJson());
  //   if (res != null) {
  //     try{
  //       LoadingDialog.showSimpleToast(res['message'].toString());
  //       return true;
  //     }catch(e){
  //       Utils.printData(e.toString());
  //       return false;
  //     }
  //
  //   }
  //   return false;
  // }

  Future<bool> addAgreement({required BuildContext context,required SentAgreementRequestModel model}) async {

    var res = await _dio.post(url:'${Urls.addAgreement}?lang=${Constants.langCode}',
        context: context,body: model.toJson());
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
  Future<bool> addOpportunityAgreement({required BuildContext context,required SentOpportunityAgreementRequestModel model}) async {

    var res = await _dio.post(url:'${Urls.addAgreement}?lang=${Constants.langCode}',
        context: context,body: model.toJson());
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


  Future<bool> addConsultantAgreement({required BuildContext context,required AddConsultantAgreementRequestModel model}) async {

    var res = await _dio.post(url:'${Urls.addConsultantAgreement}?lang=${Constants.langCode}',
        context: context,body: model.toJson());
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

  Future<List<AgreementModel>> getAgreements({required BuildContext context,}) async {
    List<AgreementModel> data=[];
    var res = await _dio.get(url:'${Urls.getAgreements}?lang=${Constants.langCode}', context: context);
    if (res != null) {
      try{
        data = List<AgreementModel>.from(res['data'].map((x) => AgreementModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }


}
