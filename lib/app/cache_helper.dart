import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/utils.dart';
import 'package:tashil_agary/domain/model/models/user_data_model.dart';

class CacheHelper{
  static SharedPreferences? prefs;
  // static DateFormat dayFormatter = DateFormat('yyyy-MM-dd');
  static init() async {
    prefs = await SharedPreferences.getInstance();
    getUserDataModel();





  }


  static Future<bool> saveData({required String key, required dynamic value,}) async {
    if (value is String) return await prefs!.setString(key, value);
    if (value is int) return await prefs!.setInt(key, value);
    if (value is bool) return await prefs!.setBool(key, value);
    return await prefs!.setDouble(key, value);
  }
  static dynamic getData({required String key}) {
    return prefs!.get(key);
  }
  static dynamic saveCachedNotifications({required int count}) {
   prefs!.setInt(ConstantsKeys.notificationKey,count);
    Constants.notificationsCounter.value=count;
  }
  static dynamic getCachedNotifications() {
    int count= prefs!.getInt(ConstantsKeys.notificationKey)??0;
    Constants.notificationsCounter.value=count;
  }


  static saveDataToUserModel({required UserDataModel userDataModel,}) async{
Constants.userDataModel=userDataModel;
Constants.isLogin=true;
saveData(key: ConstantsKeys.userDataModelKey, value: json.encode(userDataModel.toJson()));

  }

  static Future<UserDataModel?> getUserDataModel()async {
    String? data = prefs!.getString(ConstantsKeys.userDataModelKey) ;
    if(data!=null){
      Utils.printData(data);
      Constants.isLogin=true;
      UserDataModel user= UserDataModel.fromJson(json.decode(data));
      Constants.userDataModel=user;
return user;
    }
    return null;


  }


  static clearUserModelData() {
    CacheHelper.removeData(key:  ConstantsKeys.userDataModelKey);
    Constants.isLogin=false;
    Constants.userDataModel=null;
  }

  static Future<bool> clearData() {
    return prefs!.clear();
  }

  static Future<bool> removeData({required key}) {
    return prefs!.remove(key);
  }





}