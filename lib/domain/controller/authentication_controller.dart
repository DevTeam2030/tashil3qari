import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/urls.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/loading_manager.dart';
import 'package:tashil_agary/domain/dio/dio_imports.dart';
import 'package:tashil_agary/domain/model/models/register_request_body.dart';
import 'package:tashil_agary/domain/model/models/user_data_model.dart';
import 'package:tashil_agary/domain/model/social_login_model.dart';

import '../model/models/ProfileModel.dart';
import '../model/models/auth/register_model.dart';
import '../model/models/auth/upgrade_user_consultant_model.dart';
import '../model/models/update_profile_request_body.dart';
import '../model/notifications_setting_request_model.dart';

class AuthController  {
  final DioHelper _dio = DioHelper();

  Future<UserDataModel?> updateNotificationsStatus({required BuildContext context,required NotificationsSettingRequestModel notificationsSettingRequestModel}) async {
    UserDataModel? profileDataModel;
    var res = await _dio.post(url:'${Urls.updateNotificationsStatus}?lang=${Constants.langCode}', body: notificationsSettingRequestModel.toJson(),context: context);
    if (res != null) {
      try{
       profileDataModel = UserDataModel.fromJson(res['data']);
      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return profileDataModel;

  }


  Future<bool> deleteAccount({required BuildContext context,}) async {

    var res = await _dio.post(url:'${Urls.deleteAccount}?lang=${Constants.langCode}',
        context: context, body:{});
    if (res != null) return true;
    return false;

  }
  Future<RegisterModel?> register({required BuildContext context,required RegisterRequestModel model}) async {
    RegisterModel? registerModel;
    FormData formData = FormData();

    for(var entry in model.toJson().entries){
      if(entry.value is File){
        formData.files.add(MapEntry(entry.key, MultipartFile.fromFileSync(entry.value.path)));
      }else{
        formData.fields.add(MapEntry(entry.key, entry.value.toString()));
      }
    }
    var res = await _dio.post(url:'${Urls.register}?lang=${Constants.langCode}', context: context, body:{},formData: formData);
    if (res != null) {

     try{
       // Map<String, dynamic> map = Map<String, dynamic>.from(res);
       registerModel = RegisterModel.fromJson(res['data']);
       // LoadingDialog().titleMessageAlert(
       //   context: context,
       //   title: 'signIn'.tr(),
       //   message:res['message'].toString(),
       // );
       // LoadingDialog.showToastNotification(res['message'].toString());
       // ignore: use_build_context_synchronously
       // LoadingDialog().titleMessageAlert(context:context,
       //   title: 'Create Account'.tr(), message:res['message'].toString());
       LoadingDialog.showToastNotification(res['message'].toString());

     }catch(e){
       Utils.printData(e.toString());
     }

    }
    // return userDataModel;
    return registerModel;

  }


  Future<RegisterModel?> updateRegisterPhone({required BuildContext context,required UpdatePhoneRequestModel model}) async {
    RegisterModel? registerModel;

    FormData formData = FormData.fromMap({
      "id":model.id,
      "phone":model.phone,
      "first_name":model.firstName,
      "last_name":model.lastName,
      "des":model.des,
      "image": await MultipartFile.fromFile(model.image.path),
    });
    var res = await _dio.post(url:'${Urls.updatePhone}?lang=${Constants.langCode}', context: context, body:{},formData: formData);
    if (res != null) {

      try{
        // Map<String, dynamic> map = Map<String, dynamic>.from(res);
        registerModel = RegisterModel.fromJson(res['data']);
        // LoadingDialog().titleMessageAlert(context:context,
        //     title: 'Create Account'.tr(), message:res['message'].toString());
        LoadingDialog.showToastNotification(res['message'].toString(),);



      }catch(e){
        Utils.printData(e.toString());
      }

    }
    // return userDataModel;
    return registerModel;

  }


  Future<RegisterModel?> activateAccount({required BuildContext context,required String email,required String code}) async {
    RegisterModel? registerModel;
    Map<String,dynamic>body={
      "email":email,
      "verification_code":code,
    };
    var res = await _dio.post(url:'${Urls.activateAccount}?lang=${Constants.langCode}', context: context, body:body);
    if (res != null) {

     try{
       // Map<String, dynamic> map = Map<String, dynamic>.from(res);
       registerModel = RegisterModel.fromJson(res['data']);
       // LoadingDialog().titleMessageAlert(context:context,
       //   title: 'Create Account'.tr(), message:res['message'].toString());
       LoadingDialog.showToastNotification(res['message'].toString());

     }catch(e){
       Utils.printData(e.toString());
     }

    }
    // return userDataModel;
    return registerModel;

  }
  Future<void> sendVerificationCode({required BuildContext context,required String email,}) async {

    Map<String,dynamic>body={
      "email":email,
      "lang":Constants.langCode,
    };
    var res = await _dio.post(url:'${Urls.sendVerificationCode}?lang=${Constants.langCode}', context: context, body:body);
    if (res != null) {

     try{
       LoadingDialog.showToastNotification(res['message'].toString());

     }catch(e){
       Utils.printData(e.toString());
     }

    }

  }


  Future<UserDataModel?> updateUserLocation({required BuildContext context,required UpdateUserLocationRequestModel model}) async {



    Map<String,dynamic>body= model.toJson();
    // Map<String,dynamic>body= {
    // "id": model.id,
    // "addresses":[
    //     {
    //       "longitude": model.addresses[0].longitude,
    //       "latitude": model.addresses[0].latitude,
    //     }
    //   ],
    //   // "addresses":"[{longitude:31.3978706,latitude:31.3978706}]"
    // };

    var res = await _dio.post(url:'${Urls.updateLocation}?lang=${Constants.langCode}', context: context, body: body,);
    // RegisterModel? registerModel;
    // if (res != null) {

    //  try{
    //    // Map<String, dynamic> map = Map<String, dynamic>.from(res);
    //    registerModel = RegisterModel.fromJson(res['data']);
    //    gotoIntroLogin(context: context);
    //    Utils.showAlertSuccess(context: context, message: 'RegisterSuccess'.tr());
    //    // LoadingDialog().titleMessageAlert(context:context,
    //    //   title: 'Create Account'.tr(), message:res['message'].toString());
    //
    //
    //  }catch(e){
    //    Utils.printData(e.toString());
    //  }
    //
    // }
    // // return userDataModel;
    // return registerModel;
      UserDataModel? userDataModel;
      if (res != null) {
        try{
          // Map<String, dynamic> map = Map<String, dynamic>.from(res);
          userDataModel = UserDataModel.fromJson(res['data']);
        }catch(e){
          Utils.printData(e.toString());
        }

      }
      return userDataModel;

  }


  Future<UserDataModel?> updateConsultantLocation({required BuildContext context,required UpdateLocationRequestModel model}) async {


    // Map<String,dynamic>body= {
    // "id": model.id,
    //
    //
    // };

    // for(var item in model.addresses)
    //  body.addAll({
    //     "addresses[${model.addresses.indexOf(item)}]": {
    //       "city_id": item.cityId,
    //       "longitude": item.longitude,
    //       "latitude": item.latitude,
    //     },
    //   });
    // "addresses":"[{longitude:31.3978706,latitude:31.3978706}]"
    var res = await _dio.post(url:'${Urls.updateLocation}?lang=${Constants.langCode}', context: context, body: model.toJson(),);
    // if (res != null) {
      // RegisterModel? registerModel;
    //  try{
    //    // Map<String, dynamic> map = Map<String, dynamic>.from(res);
    //    registerModel = RegisterModel.fromJson(res['data']);
    //    gotoIntroLogin(context: context);
    //    Utils.showAlertSuccess(context: context, message: 'RegisterSuccess'.tr());
    //    // LoadingDialog().titleMessageAlert(context:context,
    //    //   title: 'Create Account'.tr(), message:res['message'].toString());
    //
    //
    //  }catch(e){
    //    Utils.printData(e.toString());
    //  }
    //
    // }
    // // return userDataModel;
    // return registerModel;
    UserDataModel? userDataModel;
    if (res != null) {
      try{
        // Map<String, dynamic> map = Map<String, dynamic>.from(res);
        userDataModel = UserDataModel.fromJson(res['data']);
      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return userDataModel;
  }


  Future<void> requestConsultant({required BuildContext context,required UpgradeUserConsultantModel model}) async {
    Map<String,dynamic>body= model.toJson();
    // Map<String,dynamic>body= {
    //   "license_number": model.licenseNumber,
    //   "serial_number": model.serialNumber,
    //   "des": model.des,
    //   "addresses": List<dynamic>.from(model.addresses.map((x) => x.toJson())),
    // // "addresses":[
    // //     {
    // //       "longitude": model.addresses[0].longitude,
    // //       "latitude": model.addresses[0].latitude,
    // //     }
    // //   ],
    // //   "addresses":"[{longitude:31.3978706,latitude:31.3978706}]"
    // };
    // print('------  '+ body.toString());
    var res = await _dio.post(url:'${Urls.requestConsultant}?lang=${Constants.langCode}',
      context: context, body: body);

    if (res != null) {
      try{
        LoadingDialog().titleMessageAlert(context:context,
            title: 'upgradeTpConsultant'.tr(), message:res['message'].toString());
      }catch(e){
        Utils.printData(e.toString());
      }

    }

  }


  Future<bool> register2({required BuildContext context,required RegisterRequestBodyModel requestBodyModel}) async {
    UserDataModel? userDataModel;



    FormData formData = FormData.fromMap({
      "type": requestBodyModel.userType == UserType.user ? "normal" : "consultant",
      "email": requestBodyModel.email,
      "nationality": requestBodyModel.nationality,
      "id_number": requestBodyModel.idNumber,
      "registration_type": Utils.getRegistrationTypeString(registerType: requestBodyModel.registrationType),
      "password": requestBodyModel.password,
      "password_confirmation": requestBodyModel.passwordConfirmation,
      "image": await MultipartFile.fromFile(requestBodyModel.image.path),
      "phone": requestBodyModel.phone,
      "first_name": requestBodyModel.firstName,
      "last_name": requestBodyModel.lastName,
      "lang": requestBodyModel.lang,
      "addresses": List<dynamic>.from(requestBodyModel.addresses.map((x) => x.toJson())),
    });
    var res = await _dio.post(url:'${Urls.register}?lang=${Constants.langCode}', context: context, body:{},formData: formData);
    if (res != null) {

     try{
       // Map<String, dynamic> map = Map<String, dynamic>.from(res);
       // userDataModel = UserDataModel.fromJson(res['data']);
       // LoadingDialog().titleMessageAlert(
       //   context: context,
       //   title: 'signIn'.tr(),
       //   message:res['message'].toString(),
       // );
       // LoadingDialog.showToastNotification(res['message'].toString());
       // ignore: use_build_context_synchronously
       LoadingDialog().titleMessageAlert(context:context,
         title: 'Create Account'.tr(), message:res['message'].toString());


       return true;
     }catch(e){
       Utils.printData(e.toString());
     }

    }
    // return userDataModel;
    return false;

  }


  Future<UserDataModel?> loginSocialMedia({required BuildContext context,
    required SocialLoginAndRegisterRequestBodyModel socialLoginRequestBodyModel}) async {
    UserDataModel? userDataModel;

    Map<String, dynamic> body=socialLoginRequestBodyModel.toJson();
    if(socialLoginRequestBodyModel.phone.isEmpty&&socialLoginRequestBodyModel.registrationType!='email') {
      body.removeWhere((key, value) => key == "phone");
    }
    var res = await _dio.post(url:'${Urls.loginSocialMedia}?lang=${Constants.langCode}', context: context, body:body);

      if (res != null) {
        try{
          // Map<String, dynamic> map = Map<String, dynamic>.from(res);
          userDataModel = UserDataModel.fromJson(res['data']);
        }catch(e){
          Utils.printData(e.toString());
        }

      }
      return userDataModel;



  }



  Future<UserDataModel?> login({required BuildContext context,required String idNumber, required String password }) async {
    UserDataModel? userDataModel;
    var res = await _dio.post(url:'${Urls.login}?lang=${Constants.langCode}',
        context: context,
        body: {
      "id_number":idNumber,
      "password":password,
      "fcm_token":Constants.firebaseToken,
        },
    );
    if (res != null) {
     try{
       // Map<String, dynamic> map = Map<String, dynamic>.from(res);
       userDataModel = UserDataModel.fromJson(res['data']);
     }catch(e){
       Utils.printData(e.toString());
     }

    }
    return userDataModel;

  }



  Future<bool> forgetPassword({required BuildContext context,required String idNumber,}) async {

    var res = await _dio.post(url:'${Urls.forgetPassword}?lang=${Constants.langCode}',
        context: context,
        body: {
            "id_number":idNumber

        },
    );
    if (res != null) {
     try{
       // LoadingDialog().titleMessageAlert(
       //   context: context,
       //   title: 'Forget password1'.tr(),
       //   message:res['message'].toString(),
       // );
       // return true;
       LoadingDialog.showSimpleToast(res['message'].toString());
     }catch(e){
       Utils.printData(e.toString());
     }

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
