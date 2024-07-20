
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/domain/controller/home_controller.dart';
import 'package:tashil_agary/domain/controller/one_category_controller.dart';
import 'package:tashil_agary/domain/controller/product_controller.dart';
import 'package:tashil_agary/domain/controller/search_controller.dart';
import 'package:tashil_agary/domain/model/home_venue_model.dart';
import 'package:tashil_agary/domain/model/model/home_main_category.dart';
import 'package:tashil_agary/domain/model/model/home_model.dart';
import 'package:tashil_agary/domain/model/model/home_product.dart';
import 'package:tashil_agary/domain/model/model/product_details_model.dart';
import 'package:tashil_agary/domain/model/privacy_model.dart';
import 'package:tashil_agary/providers/notifications_provider.dart';
import 'package:tashil_agary/providers/wishlist_provider.dart';

import '../app/my_app.dart';
import '../app/utils.dart';
import '../domain/model/models/auction_data_model.dart';
import '../domain/model/models/general_property_model.dart';
import '../domain/model/models/property_info_model.dart';

class ProductProvider extends ChangeNotifier {
  final ProductController _api=ProductController();
  final HomeController _apiHome=HomeController();
  bool isLoading=false;
  List<GeneralPropertyModel>similarProperties=[];
  List<GeneralPropertyModel>ownerProperties=[];
  PropertyInfoModel? propertyInfo;
  AuctionDataModel? auctionData;
  AuctionUserModel? mostAuctionUser;
  double? distance;
  LatLng? currentLocation;

  Future<void>getPropertyInfo({required BuildContext context,required int propertyId,})async{
    isLoading=true;
    isLinkDynamic.value=false;
    propertyInfo=await _api.getPropertyInfo(context: context, propertyId: propertyId);
    if(propertyInfo!=null){
      getLocationDistance(latitude: propertyInfo!.latitude,longitude:propertyInfo!.latitude );
      getSimilarProperties(context: context,isNotify: false,categoryId: propertyInfo!.catId);
    }
    notifyListeners();
  }


  getLocationDistance({required double latitude,required double longitude}){
    Utils.getCurrentLocationLatLng().then((value) async{
      if(value!=null){
        currentLocation=value;
        distance=await Utils.distanceBetween(location1:value,
            location2:  LatLng(latitude,longitude));

      }

    });
  }

  Future<void>getAuctionData({required BuildContext context,required int propertyId,bool?isNotify,})async{

    isLoading=true;
    if(isNotify!=false) notifyListeners();
    auctionData=await _api.getAuctionData(context: context, propertyId: propertyId);

    if(auctionData!=null&&auctionData!.auctionsUsers.isNotEmpty)mostAuctionUser=auctionData!.auctionsUsers.first;

    for(var item in auctionData!.auctionsUsers){
      if((double.tryParse(item.price)??0)>=(double.tryParse(mostAuctionUser!.price)??0)){
        mostAuctionUser=item;
        break;
      }
    }
    isLoading=false;
    notifyListeners();
  }
  Future<void> addAuction({required BuildContext context,required String price,required currencyId,required int propertyId }) async {
    isLoading = true;
    notifyListeners();
    bool data= await _api.addAuction(context: context,propertyId: propertyId,price: price,currencyId: currencyId);
    if(data)getAuctionData(context: context, propertyId: propertyId);
    else{
      isLoading = false;
      notifyListeners();
    }
  }
  Future<void>getOwnerProperties({required BuildContext context,bool?isNotify,required int ownerId})async{
    isLoading=true;
    ownerProperties=[];
    if(isNotify!=false) notifyListeners();

    // ignore: use_build_context_synchronously
    ownerProperties=await _apiHome.getProperties(context: context,ownerId: ownerId);
    isLoading=false;
    notifyListeners();
  }


  Future<void>getSimilarProperties({required BuildContext context,bool?isNotify,required int categoryId})async{
    isLoading=true;
    similarProperties=[];
    if(isNotify!=false) notifyListeners();

    // ignore: use_build_context_synchronously
    similarProperties=await _apiHome.getProperties(context: context,ownerId: categoryId);
    isLoading=false;
    notifyListeners();
  }
  Future<void>unWish({required BuildContext context,required GeneralPropertyModel  property})async{
    if(Utils.checkIsLogin()==false)return;
    isLoading=true;
    notifyListeners();
    bool unWished =await context.read<WishlistProvider>().unWishlist(context: context,adId: property.id);
    if(unWished)ownerProperties.firstWhere((element) => element.id==property.id,).wishlist=false;


    isLoading=false;
    notifyListeners();
  }
  Future<void>wish({required BuildContext context,required GeneralPropertyModel  property})async{
    if(Utils.checkIsLogin()==false)return;
    isLoading=true;
    notifyListeners();
    bool wishlist =await context.read<WishlistProvider>().wishlist(context: context,adId: property.id);
    if(wishlist)ownerProperties.firstWhere((element) => element.id==property.id,).wishlist=true;

    isLoading=false;
    notifyListeners();
  }

}
