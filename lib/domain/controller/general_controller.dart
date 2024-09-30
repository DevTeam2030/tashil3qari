import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/urls.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/domain/dio/dio_imports.dart';
import 'package:tashil_agary/domain/model/models/setting_model.dart';

import '../../components/loading_manager.dart';
import '../model/models/add_complaint_request_body.dart';
import '../model/models/country_model.dart';
import '../model/models/home_catogery_model.dart';


class GeneralController  {
  final DioHelper _dio = DioHelper();

  Future<List<CountryModel>> getCountries({required BuildContext context,}) async {
    List<CountryModel> data=[];
    var res = await _dio.get(url:'${Urls.countries}?lang=${Constants.langCode}', context: context);
    if (res != null) {
      try{
        data = List<CountryModel>.from(res['data'].map((x) => CountryModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }
    }
    return data;
  }
  Future<List<CityModel>> getCities({required BuildContext context,required  int countryId}) async {
    List<CityModel> data=[];
    var res = await _dio.get(url:'${Urls.cities}?lang=${Constants.langCode}&country_id=$countryId', context: context);
    if (res != null) {
      try{
        data = List<CityModel>.from(res['data'].map((x) => CityModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }


  Future<SettingModel> getSettingData({required BuildContext context,}) async {
    SettingModel settingModel=SettingModel(consultantFess: 0,countAllAds: 0,licenseFess: 0,categories: [],countries: [],nationalities: [],
        auctionDurations: [],reasons: [],currencies: [],featuredPlans: [],serialNumbers: [],servicesAboutAr: '',
      pledgeMessage: '',policyPrivacy: '',terms: '', servicesAboutEn: '',
        finishingTypes: [],  appValueAfterSelling: 0,);
    var res = await _dio.get(url:'${Urls.settings}?lang=${Constants.langCode}', context: context);
    if (res != null) {
     try{
       settingModel = SettingModel.fromJson(res['data']);
       var data=settingModel.categories;
        settingModel.categories=[];
        settingModel.categories.add(HomeCatogeryModel(name: 'all'.tr(),id: 0,
            options: HomeCategoryOptionModel(
                roomsNo: true,
                bathroomsNo: true,
                floorsNo: true,
                receptionsNo: true,
                floor: true,
                apartmentsNo: true,
                direction: true,
                streetWidth: true,
                storesNo: true,
                buildingAge: true,
                kitchensNo: true,
                feminine: true,
                annex: true,airConditioners: true,carEntrance: true,elevator: true,electricityAvailability: true,
                swimmingPool: true,
                footballField: true,volleyballCourt: true,amusementPark: true,familySection: true,
                waterAvailability: true
            )));
        settingModel.categories.addAll(data);
     }catch(e){
       Utils.printData(e.toString());
     }

    }
    return settingModel;

  }


  Future<bool> sentComplaint({required BuildContext context,required AddComplaintRequestModel model}) async {
    var res = await _dio.post(url:'${Urls.addComplaint}?lang=${Constants.langCode}', context: context,body: model.toJson());
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
