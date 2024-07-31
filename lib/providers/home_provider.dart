import 'package:flutter/material.dart';
import 'package:tashil_agary/domain/controller/home_controller.dart';
import 'package:tashil_agary/domain/controller/search_controller.dart';

import '../domain/model/models/general_property_model.dart';


class HomeProvider extends ChangeNotifier {
  final HomeController _api=HomeController();
  final SearchApiController _apiSearch=SearchApiController();
bool isLoading=false;
  List<GeneralPropertyModel>properties=[];
  // List<FinishingTypesModel>finishingTypes=[];
  // List<HomeCatogeryModel> categories=[];



changeLoading([bool? isloading,bool? isNotify]){
  // isLoading=!isLoading;
  isLoading=isloading??false;
  if(isNotify!=false)
  notifyListeners();
}




  Future< List<GeneralPropertyModel>>getProperties({required BuildContext context,bool?isNotify,int? cityId,int? categoryId,
    int? floor,int? bathroomsNo,int? roomsNo,double? propertySize,double? minPrice,double? maxPrice,
    int? finishingTypeId,required bool isAuction, bool? forSale,bool? forRent,
    int? kitchensNo, int? receptionsNo,int?apartmentsNo,int? storesNo,int?buildingAge,String? direction,double? streetWidth})async{
    isLoading=true;
    properties=[];
    if(isNotify!=false) notifyListeners();

    // ignore: use_build_context_synchronously
    properties=await _api.getProperties(context: context,cityId: cityId,categoryId: categoryId,
        floor: floor,bathroomsNo: bathroomsNo,roomsNo: roomsNo,propertySize: propertySize,
        receptionsNo: receptionsNo,apartmentsNo: apartmentsNo,storesNo: storesNo,buildingAge: buildingAge,
        streetWidth: streetWidth,direction: direction,
        forRent: forRent,forSale: forSale,kitchensNo: kitchensNo,
        minPrice: minPrice,maxPrice: maxPrice,finishingTypeId: finishingTypeId,isAuction:isAuction );
    isLoading=false;
    notifyListeners();

    return properties;
  }

  // Future<void>getFinishingTypes({required BuildContext context,bool?isNotify,int? cityId})async{
  //   isLoading=true;
  //   if(isNotify!=false) notifyListeners();
  //
  //   // ignore: use_build_context_synchronously
  //   finishingTypes=await _api.getFinishingTypes(context: context);
  //   isLoading=false;
  //   notifyListeners();
  //
  // }
  //
  // Future<void>getCategories({required BuildContext context,bool?isNotify,})async{
  //   isLoading=true;
  //   if(isNotify!=false) notifyListeners();
  //
  //   // ignore: use_build_context_synchronously
  //   var data=await _api.getCategories(context: context);
  //   categories=[HomeCatogeryModel(id: 0,name: 'all'.tr())];
  //   categories.addAll(data);
  //   isLoading=false;
  //   notifyListeners();
  //
  // }


  // Future<void>getHomeData({required BuildContext context})async{
  //   // if(homeModel.categories.isEmpty) isLoading=true;
  //   //
  //   // // notifyListeners();
  //   //
  //   // // ignore: use_build_context_synchronously
  //   // homeModel=await _api.getHomeData(context: context,);
  //   // isLoading=false;
  //   // notifyListeners();
  //   return;
  //   // ignore: use_build_context_synchronously
  //   if(Constants.userDataModel!=null&&Constants.isLogin) {
  //    // ignore: use_build_context_synchronously
  //    Constants.navigatorAppKey.currentContext?.read<NotificationsProvider>().getCountUnreadNotification(context: context);
  //
  //   }
  //
  // }



}
