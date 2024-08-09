import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/domain/controller/home_controller.dart';
import 'package:tashil_agary/domain/controller/search_controller.dart';
import 'package:tashil_agary/providers/wishlist_provider.dart';

import '../app/utils.dart';
import '../domain/model/models/general_property_model.dart';

class SearchProvider extends ChangeNotifier {
  final HomeController _api=HomeController();

  bool isLoading=false;
  List<GeneralPropertyModel>allProperties=[];
  List<GeneralPropertyModel>properties=[];




  changeLoading([bool? isloading,bool? isNotify]){
  // isLoading=!isLoading;
  isLoading=isloading??false;
  if(isNotify!=false)
  notifyListeners();
  }



  Future< List<GeneralPropertyModel>>getProperties({required BuildContext context,bool?isNotify,int? cityId,int? categoryId,
  int? floor,int? bathroomsNo,int? roomsNo,double? propertySize,double? minPrice,double? maxPrice,bool?isAuction,
  int? finishingTypeId,bool? forSale,bool? forRent,bool?feminine,bool? monthly,
    bool? annex, bool? carEntrance, bool? elevator, bool?  airConditioners, bool? waterAvailability, bool? electricityAvailability,
    bool? swimmingPool, bool?  footballField, bool?  volleyballCourt, bool?  amusementPark, bool? familySection,
    int? kitchensNo, int? receptionsNo,int?apartmentsNo,int? storesNo,int? floorsNo,int?buildingAge,String? direction,double? streetWidth})async{
  isLoading=true;
  allProperties=[];
  properties=[];
  if(isNotify!=false) notifyListeners();

  // ignore: use_build_context_synchronously
  allProperties=await _api.getProperties(context: context,cityId: cityId,categoryId: categoryId,
  floor: floor,bathroomsNo: bathroomsNo,roomsNo: roomsNo,propertySize: propertySize,
  isAuction: isAuction,   receptionsNo: receptionsNo,apartmentsNo: apartmentsNo,storesNo: storesNo,buildingAge: buildingAge,
      streetWidth: streetWidth,direction: direction,monthly: monthly,
      forRent: forRent,forSale: forSale,kitchensNo: kitchensNo,floorsNo:floorsNo,
  waterAvailability: waterAvailability,volleyballCourt: volleyballCourt,
  swimmingPool: swimmingPool,carEntrance: carEntrance,footballField: footballField,feminine:feminine ,
    familySection:familySection ,airConditioners: airConditioners,amusementPark: amusementPark,annex:annex,
  elevator:elevator , electricityAvailability:electricityAvailability ,
  minPrice: minPrice,maxPrice: maxPrice,finishingTypeId: finishingTypeId,);
  properties=allProperties;
  isLoading=false;
  notifyListeners();

  return properties;
  }

  Future<void>removeFromWishlist({required BuildContext context,required GeneralPropertyModel  property})async{
    if(Utils.checkIsLogin()==false)return;
    isLoading=true;
    notifyListeners();
    bool unWished =await context.read<WishlistProvider>().unWishlist(context: context,adId: property.id);
    if(unWished){
      allProperties.where((element) => element.id==property.id).first.wishlist=false;
      properties.where((element) => element.id==property.id).first.wishlist=false;
    }


    isLoading=false;
    notifyListeners();
  }
  Future<void>addToWishlist({required BuildContext context,required GeneralPropertyModel  property})async{
    if(Utils.checkIsLogin()==false)return;
    isLoading=true;
    notifyListeners();
    bool wishlist =await context.read<WishlistProvider>().wishlist(context: context,adId: property.id);
    if(wishlist){
      allProperties.where((element) => element.id==property.id).first.wishlist=true;
      properties.where((element) => element.id==property.id).first.wishlist=true;
    }

    isLoading=false;
    notifyListeners();
  }



  }
