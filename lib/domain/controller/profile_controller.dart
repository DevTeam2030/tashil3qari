import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/urls.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/components/loading_manager.dart';
import 'package:tashil_agary/domain/dio/dio_imports.dart';
import 'package:tashil_agary/domain/model/models/user_data_model.dart';

import '../model/models/ProfileModel.dart';
import '../model/models/general_property_model.dart';
import '../model/models/update_profile_request_body.dart';
import '../model/models/user_ads_model.dart';

class ProfileController  {
  final DioHelper _dio = DioHelper();
  Future<ProfileModel?> getProfileData({required BuildContext context,}) async {
    ProfileModel? profileDataModel;
    var res = await _dio.get(url:'${Urls.profile}?lang=${Constants.langCode}', context: context);
    if (res != null) {
      try{
       profileDataModel = ProfileModel.fromJson(res['data']);
      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return profileDataModel;

  }





  Future<bool> changePassword({required BuildContext context,required String currentPassword,required String newPassword}) async {

    var res = await _dio.post(url:'${Urls.changePassword}?lang=${Constants.langCode}',
        context: context,
        body: {
          "current_password":currentPassword,
          "password":newPassword,
          "password_confirmation":newPassword
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

  Future<bool> deleteProperty({required BuildContext context,required int propertyId,required int reasonId,
    required String otherReasonOptional}) async {

    Map<String,dynamic> body= {
      "property_id":propertyId,
      "reason_id":reasonId
    };
    if(otherReasonOptional.isNotEmpty){
      body['other_reason']=otherReasonOptional;

    }
    var res = await _dio.post(url:'${Urls.deleteProperty}?lang=${Constants.langCode}',
        context: context,
        body: body,
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
  Future<bool> removeFromAuction({required BuildContext context,required int propertyId,}) async {

    var res = await _dio.post(url:'${Urls.removeFromAuction}?lang=${Constants.langCode}',
        context: context,
        body: {
          "property_id":propertyId,
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

  Future<bool> unPublishProperty({required BuildContext context,required int propertyId,}) async {

    var res = await _dio.post(url:'${Urls.unPublishProperty}?lang=${Constants.langCode}',
        context: context,
        body: {
          "property_id":propertyId,
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


  Future<UserDataModel?> updateProfile({required BuildContext context, required UpdateProfileRequestModel model}) async {

    FormData formData = FormData();
    model.toJson().forEach((key, value) {
      if(value is  File){
        formData.files.add(MapEntry(key, MultipartFile.fromFileSync(value.path, filename: value.path.split("/").last),));

      }else{
        formData.fields.add(MapEntry(key, value.toString()));
      }
    });
    // FormData formData = FormData.fromMap(model.toJson().remove('image'));
    // FormData formData = FormData.fromMap(model.toJson());
    // print(formData.fields);
    // return true;
// Map<String,dynamic>body={
//   "user_id":Constants.userDataModel!.id,
//   "first_name":firstName,
//   "last_name":lastName
// };
    var res = await DioHelper().post(url: '${Urls.updateProfile}?lang=${Constants.langCode}',
        context: context,body: model.toJson(),formData: formData);
    UserDataModel? user;
    if (res != null) {
      try{

        user = UserDataModel.fromJson(res['data']);
      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return user;
  }

  Future<String> updateImageProfile({required BuildContext context, required XFile photo,}) async {
    var formData = FormData();
    // UserDataModel?  userDataModel;
    MapEntry<String, MultipartFile> pic = MapEntry('image', MultipartFile.fromFileSync(photo.path, filename: photo.path.split("/").last),);
    formData.files.add(pic);
    // formData.fields.add(MapEntry('email', email));
    // formData.fields.add(MapEntry('phone', phone));
    // formData.fields.add(MapEntry('id_number', idNumber));


    var res = await DioHelper().post(url: '${Urls.updateProfile}?lang=${Constants.langCode}', context: context,body: {},formData:formData);
    if (res != null) {
      try{
        // userDataModel = UserDataModel.fromJson(res['data']['image']);

return res['data']['image'];
      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return '';
  }


  Future<List<UserAdsModel>> getUserAds({required BuildContext context}) async {
    List<UserAdsModel> data=[];

    var res = await _dio.get(url:'${Urls.userAds}?lang=${Constants.langCode}', context: context);
    if (res != null) {
      try{
        data = List<UserAdsModel>.from(res['data'].map((x) => UserAdsModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }
  Future<List<GeneralPropertyModel>> getUserWishList({required BuildContext context}) async {
    List<GeneralPropertyModel> data=[];

    var res = await _dio.get(url:'${Urls.userWishlist}?lang=${Constants.langCode}', context: context);
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
