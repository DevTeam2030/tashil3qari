import 'package:flutter/cupertino.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/urls.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/domain/dio/dio_imports.dart';
import 'package:tashil_agary/domain/model/models/consultant_model.dart';
import '../../components/loading_manager.dart';
import '../model/models/consultant_info_model.dart';
import '../model/models/general_property_model.dart';

class ConsultantController  {
  final DioHelper _dio = DioHelper();
  Future<List<ConsultantModel>> getConsultants({required BuildContext context,int? opportunityId,}) async {
    List<ConsultantModel> data=[];
    String url='${Urls.getConsultant}?lang=${Constants.langCode}';
    if(opportunityId!=null) url+='&real_estate_opportunitie_id=$opportunityId';
    var res = await _dio.get(url:url, context: context);
    if (res != null) {
      try{
        data = List<ConsultantModel>.from(res['data'].map((x) => ConsultantModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }

  Future<List<ConsultantModel>> getAgreementConsultants({required BuildContext context,int? agreementId,}) async {
    List<ConsultantModel> data=[];
    String url='${Urls.getAgreementConsultants}?lang=${Constants.langCode}&agreement_id=$agreementId';
    var res = await _dio.get(url:url, context: context);
    if (res != null) {
      try{
        data = List<ConsultantModel>.from(res['data'].map((x) => ConsultantModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }

  Future<ConsultantInfoModel?> getConsultantInfo({required BuildContext context,required int consultantId}) async {

    String url='${Urls.getConsultantInfo}?consultant_id=$consultantId&lang=${Constants.langCode}';
    ConsultantInfoModel? data;
    var res = await _dio.get(url:url, context: context);
    if (res != null) {
      try{
        data = ConsultantInfoModel.fromJson(res['data'][0]);

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }

  Future<bool> followConsultant({required BuildContext context,required int consultantId}) async {
    var res = await _dio.post(url:'${Urls.followConsultant}?lang=${Constants.langCode}', context: context,
        body: {
          "follower_id":consultantId
        });
    if (res != null) {
      if(res['message']!=null) LoadingDialog.showToastNotification(res['message']);
      return true;
    }
    return false;
  }
  Future<bool> addRateToConsultant({required BuildContext context,required int consultantId,
    required double rate, required String comment}) async {
    var res = await _dio.post(url:'${Urls.addRateToConsultant}?lang=${Constants.langCode}', context: context,
        body: {
          "consultant_id":consultantId,
          "rate":rate,
          "comment":comment
        });
    if (res != null) {
      if(res['message']!=null) LoadingDialog.showToastNotification(res['message']);
      return true;
    }
    return false;
  }
  Future<bool> replyRate({required BuildContext context,required int rateId,required String comment}) async {
    var res = await _dio.post(url:'${Urls.replyRate}?lang=${Constants.langCode}', context: context,
        body: {
          "rate_id":rateId,
          "comment":comment
        });
    if (res != null) {
      if(res['message']!=null) LoadingDialog.showToastNotification(res['message']);
      return true;
    }
    return false;
  }

  Future<bool> unFollowConsultant({required BuildContext context,required int consultantId}) async {
    var res = await _dio.post(url:'${Urls.unFollowConsultant}?lang=${Constants.langCode}', context: context,
        body: {
          "follower_id":consultantId
        });
    if (res != null) {
      if(res['message']!=null) LoadingDialog.showToastNotification(res['message']);
      return true;
    }
    return false;
  }

  Future<List<GeneralPropertyModel>> getConsultantsAds({required BuildContext context,required int consultantId}) async {
    List<GeneralPropertyModel> data=[];

    var res = await _dio.get(url:'${Urls.consultantAds}?consultant_id=$consultantId&lang=${Constants.langCode}', context: context);
    if (res != null) {
      try{
        data = List<GeneralPropertyModel>.from(res['data'].map((x) => GeneralPropertyModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }

}
