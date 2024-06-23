import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/urls.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/loading_manager.dart';
import 'package:tashil_agary/domain/model/models/register_request_body.dart';
import 'package:tashil_agary/domain/dio/dio_imports.dart';
import 'package:tashil_agary/domain/model/social_login_model.dart';
import 'package:tashil_agary/domain/model/social_login_request_body.dart';
import 'package:tashil_agary/domain/model/models/user_data_model.dart';

class SocialLoginController  {
  final DioHelper _dio = DioHelper();



  Future<bool> activeSocialAccounts({required BuildContext context,required SocialLoginRequestBodyModel socialLoginRequestBodyModel}) async {
    UserDataModel? userDataModel;
    var res = await _dio.post(url:'${Urls.activeSocialAccounts}?lang=${Constants.langCode}', context: context, body: socialLoginRequestBodyModel.toJson());
    if (res != null&&res['data'].toString().isNotEmpty) {
     // try{
     //   // Map<String, dynamic> map = Map<String, dynamic>.from(res);
     //   userDataModel = UserDataModel.fromJson(res['data']);
     // }catch(e){
     //   Utils.printData(e.toString());
     // }
return true;
    }
    return false;

  }

  Future<bool> unActiveSocialAccounts({required BuildContext context,required String  registrationType }) async {
    UserDataModel? userDataModel;
    var res = await _dio.post(url:'${Urls.unActiveSocialAccounts}?lang=${Constants.langCode}',
        context: context, body: { "registration_type":registrationType});
    if (res != null&&res['data'].toString().isNotEmpty) {
      // try{
      //   // Map<String, dynamic> map = Map<String, dynamic>.from(res);
      //   userDataModel = UserDataModel.fromJson(res['data']);
      // }catch(e){
      //   Utils.printData(e.toString());
      // }
      return true;
    }
    return false;

  }



  Future<SocialLoginModel> getSocialLoginList({required BuildContext context,}) async {
    SocialLoginModel socialLoginModel=SocialLoginModel(apple: false,email: false,facebook: false,google: false);
    var res = await _dio.get(url:'${Urls.listSocialAccounts}?lang=${Constants.langCode}', context: context);
    if (res != null) {
      try{
        socialLoginModel =SocialLoginModel.fromJson(res['data']);

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return socialLoginModel;
  }
}
