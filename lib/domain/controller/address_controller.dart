import 'package:flutter/cupertino.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/urls.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/domain/dio/dio_imports.dart';
import 'package:tashil_agary/domain/model/add_address_request.dart';
import 'package:tashil_agary/domain/model/address_model.dart';


import '../model/models/country_model.dart';

class AddressController  {
  final DioHelper _dio = DioHelper();
  Future<bool> addAddress({required BuildContext context,required AddAddressRequest addAddressRequest}) async {

    var res = await _dio.post(url:'${Urls.addAddress}?lang=${Constants.langCode}',
        context: context,body: addAddressRequest.toJson());
    if (res != null) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> editAddress({required BuildContext context,required EditAddressRequest editAddressRequest}) async {

    var res = await _dio.post(url:'${Urls.editAddress}?lang=${Constants.langCode}',
        context: context,body: editAddressRequest.toJson());
    if (res != null) {
      return true;
    } else {
      return false;
    }
  }
  Future<bool> deleteAddress({required BuildContext context,required int addressId}) async {

    var res = await _dio.post(url:'${Urls.deleteAddress}?lang=${Constants.langCode}',
        context: context,body: {    "address_id":addressId});
    if (res != null) {
      return true;
    } else {
      return false;
    }
  }

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

  Future<List<AddressModel>> getListAddressesData({required BuildContext context,}) async {
    List<AddressModel> data=[];
    var res = await _dio.get(url:'${Urls.listAddress}?lang=${Constants.langCode}', context: context);
    if (res != null) {
      try{
        data = List<AddressModel>.from(res['data'].map((x) => AddressModel.fromJson(x)));

      }catch(e){
        Utils.printData(e.toString());
      }

    }
    return data;
  }


}
