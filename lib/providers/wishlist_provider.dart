
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tashil_agary/app/contants.dart';
import 'package:tashil_agary/domain/controller/wishlist_controller.dart';
import 'package:tashil_agary/domain/model/home_venue_model.dart';
import 'package:tashil_agary/domain/model/model/home_product.dart';
import 'package:tashil_agary/providers/home_provider.dart';


class WishlistProvider extends ChangeNotifier {
  final WishlistController _api=WishlistController();
  bool isLoading=false;

  List<HomeProduct> wishList=[];
  int page=1;
  bool isExitMoreData=true;

  Future<void>getWishList({required BuildContext context,required bool notify})async{
    isLoading=true;
    page=1;
    isExitMoreData=true;
    if(notify)notifyListeners();
    wishList=await _api.getUserWishlistData(context: context,page: page);
    if(wishList.isEmpty) isExitMoreData=false;
    isLoading=false;
    notifyListeners();
  }

  Future<void>getMoreWishList({required BuildContext context,})async{
    if(!isExitMoreData)return;
    isLoading=true;
    page+=1;
    notifyListeners();
    List<HomeProduct> newData=await _api.getUserWishlistData(context: context,page: page);
    if(newData.isEmpty) {
      isExitMoreData=false;
    } else {
      wishList.addAll(newData);
    }
    isLoading=false;
    notifyListeners();
  }


  Future<bool>wishlist({required BuildContext context,required int adId})async{
    // isLoading=true;
    //   notifyListeners();

    bool wished=await _api.wishlist(context: context,adId: adId);
    if(wished) {
      for (var item in context.read<HomeProvider>().properties) {
        if (item.id == adId) {
          item.wishlist = true;
          context.read<HomeProvider>().notifyListeners();
          return wished;
        }
      }
    }
    isLoading=false;
    notifyListeners();
    return wished;
  }
  Future<bool>unWishlist({required BuildContext context,required int adId})async{
    // isLoading=true;
    //   notifyListeners();

    bool unWished=await _api.unWishlist(context: context,adId: adId);
    if(unWished){
      // ignore: use_build_context_synchronously
      for(var item in context.read<HomeProvider>().properties){
        if(item.id==adId){
          item.wishlist=false;
          // ignore: use_build_context_synchronously
          context.read<HomeProvider>().notifyListeners();
          return unWished;
        }
      }
    }
    isLoading=false;
    notifyListeners();
    return unWished;
  }

}
