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
import 'package:tashil_agary/domain/model/privacy_model.dart';
import 'package:tashil_agary/domain/model/models/register_request_body.dart';
import 'package:tashil_agary/domain/dio/dio_imports.dart';
import 'package:tashil_agary/domain/model/model/home_model.dart';
import 'package:tashil_agary/domain/model/models/user_data_model.dart';

import '../model/models/finishing_types_model.dart';
import '../model/models/general_property_model.dart';
import '../model/models/home_catogery_model.dart';

class HomeController  {
  final DioHelper _dio = DioHelper();

  Future< List<FinishingTypesModel>>getFinishingTypes({required BuildContext context}) async {
    List<FinishingTypesModel> data=[];

    var res = await _dio.get(url:'${Urls.finishingTypes}?lang=${Constants.langCode}', context: context);
    if (res != null) {
      try{
        data = List<FinishingTypesModel>.from(res['data'].map((x) => FinishingTypesModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }
  Future<List<GeneralPropertyModel>> getProperties({required BuildContext context,int? cityId,int? categoryId,
  int? floor,int? bathroomsNo,int? roomsNo,double? propertySize,double? minPrice,double? maxPrice,
  int? finishingTypeId,int? ownerId,bool? isAuction, bool? forSale,bool? forRent ,
  int? kitchensNo, int? receptionsNo,int?apartmentsNo,int? storesNo,int? floorsNo,int?buildingAge,String? direction,double? streetWidth}) async {
    List<GeneralPropertyModel> data=[];
    String url='${Urls.properties}?lang=${Constants.langCode}&no_page=1';

    if(cityId!=null)url='$url&city_id=$cityId';
    if(ownerId!=null)url='$url&owner_id=$ownerId';
    if(isAuction!=null&&isAuction==true) {
      url='$url&auction=1';
    } else {
      url='$url&all=1';
    }
    if(forSale==true) {
      url='$url&type=sale';
    } else if(forRent==true) {
      url='$url&type=rent';
    } else{}
    if(categoryId!=null&&categoryId!=0)url='$url&category_id=$categoryId';
    if(finishingTypeId!=null)url='$url&finishing_type_id=$finishingTypeId';
    if(maxPrice!=null&&maxPrice>0)url='$url&max_price=$maxPrice';
    if(minPrice!=null&&minPrice>0)url='$url&min_price=$minPrice';
    if(roomsNo!=null&&roomsNo>0)url='$url&rooms_no=$roomsNo';
    if(kitchensNo!=null&&kitchensNo>0)url='$url&kitchens_no=$kitchensNo';
    if(bathroomsNo!=null&&bathroomsNo>0)url='$url&bathrooms_no=$bathroomsNo';
    if(floor!=null&&floor>0)url='$url&floor=$floor';
    if(floorsNo!=null&&floorsNo>0)url='$url&floors_no=$floorsNo';
    if(propertySize!=null&&propertySize>0)url='$url&property_size=$propertySize';


    if(receptionsNo!=null&&receptionsNo>0)url='$url&receptions_no=$receptionsNo';
    if(apartmentsNo!=null&&apartmentsNo>0)url='$url&apartments_no=$apartmentsNo';
    if(storesNo!=null&&storesNo>0)url='$url&stores_no=$storesNo';
    if(buildingAge!=null&&buildingAge>0)url='$url&building_age=$buildingAge';
    if(direction!=null&&direction.isNotEmpty)url='$url&direction=$direction';
    if(streetWidth!=null&&streetWidth>0)url='$url&street_width=$streetWidth';



    var res = await _dio.get(url:url, context: context);
    if (res != null) {
      try{
        data = List<GeneralPropertyModel>.from(res['data'].map((x) => GeneralPropertyModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }
  Future<List<HomeCatogeryModel>> getCategories({required BuildContext context,}) async {
    List<HomeCatogeryModel> data=[];
    var res = await _dio.get(url:'${Urls.categories}?lang=${Constants.langCode}', context: context);
    if (res != null) {
      try{
        data = List<HomeCatogeryModel>.from(res['data'].map((x) => HomeCatogeryModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }
  //---------------------------
  Future<HomeModel> getHomeData({required BuildContext context,}) async {
    HomeModel homeModel=HomeModel(categories: [],popularProducts: [],newProducts: []);
String url='${Urls.homeScreen}?lang=${Constants.langCode}';
if(Constants.isLogin&&Constants.userDataModel!=null)url='$url&user_id=${Constants.userDataModel!.id}';
    var res = await _dio.get(url:url, context: context);
    if (res != null) {
     try{
       homeModel = HomeModel.fromJson(res['data']);
     }catch(e){
       Utils.printData(e.toString());
     }

    }
    return homeModel;

  }

  Future<List<HomeVenueModel>> getCategoryData({required BuildContext context,required  int catId,required  int page}) async {
    List<HomeVenueModel> data=[];
    var res = await _dio.get(url:'${Urls.oneCategoryData}$catId&lang=${Constants.langCode}&page=$page&${Constants.locationText}', context: context);
    if (res != null) {
     try{
       data = List<HomeVenueModel>.from(res['data'].map((x) => HomeVenueModel.fromJson(x)));

     }catch(e){
       Utils.printData(e.toString());
     }

    }
    return data;
  }
  Future<List<HomeMainCategoryModel>> getAllCategories({required BuildContext context,required  int page}) async {
    List<HomeMainCategoryModel> data=[];
    var res = await _dio.get(url:'${Urls.allCategories}?lang=${Constants.langCode}&page=$page', context: context);
    if (res != null) {
     try{
       data = List<HomeMainCategoryModel>.from(res['data'].map((x) => HomeMainCategoryModel.fromJson(x)));

     }catch(e){
       Utils.printData(e.toString());
     }

    }
    return data;

  }

  Future<List<HomeVenueModel>> getRecentlyViewedStores({required BuildContext context,required  int page}) async {
    List<HomeVenueModel> data=[];
    var res = await _dio.get(url:'${Urls.recentlyViewedStores}?lang=${Constants.langCode}&page=$page&${Constants.locationText}', context: context);
    if (res != null) {
      try{
        data = List<HomeVenueModel>.from(res['data'].map((x) => HomeVenueModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }
  Future<List<HomeVenueModel>> getFeaturedStores({required BuildContext context,required  int page}) async {
    List<HomeVenueModel> data=[];
    var res = await _dio.get(url:'${Urls.featuredStores}?lang=${Constants.langCode}&page=$page&${Constants.locationText}', context: context);
    if (res != null) {
      try{
        data = List<HomeVenueModel>.from(res['data'].map((x) => HomeVenueModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }
  Future<List<HomeVenueModel>> getNewStores({required BuildContext context,required  int page}) async {
    List<HomeVenueModel> data=[];
    var res = await _dio.get(url:'${Urls.newStores}?lang=${Constants.langCode}&page=$page&${Constants.locationText}', context: context);
    if (res != null) {
      try{
        data = List<HomeVenueModel>.from(res['data'].map((x) => HomeVenueModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }

  Future<PrivacyModel> getPrivacyPolicy({required BuildContext context,}) async {
    PrivacyModel privacyModel=PrivacyModel(title: '',id: 0,content: '');
    var res = await _dio.get(url:'${Urls.privacyPolicy}?lang=${Constants.langCode}', context: context);
    if (res != null) {
      try{
        privacyModel =PrivacyModel.fromJson(res['data']);


      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return privacyModel;
  }
  Future<PrivacyModel> getTermsOfUse({required BuildContext context,}) async {
    PrivacyModel privacyModel=PrivacyModel(title: '',id: 0,content: '');
    var res = await _dio.get(url:'${Urls.termsUse}?lang=${Constants.langCode}', context: context);
    if (res != null) {
      try{
        privacyModel =PrivacyModel.fromJson(res['data']);


      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return privacyModel;

  }
  Future<PrivacyModel> getTermsService({required BuildContext context,}) async {
    PrivacyModel privacyModel=PrivacyModel(title: '',id: 0,content: '');
    var res = await _dio.get(url:'${Urls.termsService}?lang=${Constants.langCode}', context: context);
    if (res != null) {
      try{
        privacyModel =PrivacyModel.fromJson(res['data']);


      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return privacyModel;

  }

}
