import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/urls.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/domain/dio/dio_imports.dart';


import '../../components/loading_manager.dart';
import '../model/models/post_model.dart';
import '../model/user_notification_model.dart';

class CouncilController  {
  final DioHelper _dio = DioHelper();
  Future<List<PostModel>> getPosts({required BuildContext context,int? cityId}) async {
    List<PostModel> data=[];
    String url='${Urls.getPosts}?lang=${Constants.langCode}';
    if(cityId!=null){
      url+='&city_id=$cityId';
    }
    var res = await _dio.get(url:url, context: context);
    if (res != null) {
      try{
        data = List<PostModel>.from(res['data'].map((x) => PostModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }

  Future<List<PostModel>> getOpportunities({required BuildContext context,int? cityId}) async {
    List<PostModel> data=[];
    String url='${Urls.getOpportunities}?lang=${Constants.langCode}';
    if(cityId!=null){
      url+='&city_id=$cityId';
    }
    var res = await _dio.get(url:url, context: context);
    if (res != null) {
      try{
        data = List<PostModel>.from(res['data'].map((x) => PostModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }

  Future<bool> addPost({required BuildContext context,required String post,required File? image,required int cityId}) async {
    FormData formData = FormData();
    if(image!=null){
      formData.files.add(MapEntry('image', MultipartFile.fromFileSync(image.path, filename: image.path.split("/").last),));
    }

    formData.fields.add(MapEntry('city_id', cityId.toString()));
    formData.fields.add(MapEntry('post', post));

    var res = await _dio.post(url:'${Urls.addPost}?lang=${Constants.langCode}', context: context,body: {},formData: formData);
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
  Future<bool> editPost({required BuildContext context,required String post,required int postId,
    required int cityId}) async {

    var res = await _dio.post(url:'${Urls.editPost}?lang=${Constants.langCode}', context: context,body: {
      "post":post,
      "city_id":cityId,
      "post_id":postId
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


  Future<bool> addOpportunity({required BuildContext context,required String post,required String description,
    required File? image,required int cityId}) async {
    FormData formData = FormData();
    if(image!=null){
      formData.files.add(MapEntry('image', MultipartFile.fromFileSync(image.path, filename: image.path.split("/").last),));
    }
    
    formData.fields.add(MapEntry('city_id', cityId.toString()));
    formData.fields.add(MapEntry('post', post));
    formData.fields.add(MapEntry('description', post));

    var res = await _dio.post(url:'${Urls.addOpportunity}?lang=${Constants.langCode}', context: context,body: {},formData: formData);
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

  Future<bool> hidePostOrOpportunity({required BuildContext context,required int postId,required bool isPost}) async {
    String url=isPost?Urls.hidePost:Urls.hideOpportunity;
    var res = await _dio.post(url:'$url?lang=${Constants.langCode}', context: context,
        body: {
          "post_id":postId
        });
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


  Future<bool> deletePostOrOpportunity({required BuildContext context,required int postId,required bool isPost}) async {
    String url=isPost?Urls.deletePost:Urls.deleteOpportunity;
    var res = await _dio.post(url:'$url?lang=${Constants.langCode}', context: context,
        body: {
          "post_id":postId
        });
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


  Future<bool> reportConsultant({required BuildContext context,required int consultantId,required String message}) async {

    var res = await _dio.post(url:'${Urls.reportConsultant}?lang=${Constants.langCode}', context: context,
        body: {
          "consultant_id":consultantId,
          "message":message
        });
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
  Future<bool> likePost({required BuildContext context,required int postId,required isLike}) async {

    var res = await _dio.post(url:'${isLike?Urls.likePost:Urls.unlikePost}?lang=${Constants.langCode}', context: context,
        body: {
          "post_id":postId
        });
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

  Future<bool> likeOpportunity({required BuildContext context,required int opportunityId,required isLike}) async {

    var res = await _dio.post(url:'${isLike?Urls.likeOpportunity:Urls.unLikeOpportunity}?lang=${Constants.langCode}', context: context,
        body: {
          "post_id":opportunityId
        });
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
